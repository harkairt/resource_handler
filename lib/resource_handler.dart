import 'dart:core';
import 'package:resource_handler/resource_state.dart';
import 'package:dartz/dartz.dart';

export 'package:resource_handler/resource_state.dart';

mixin ResourceHandler {
  Future<Either<E?, T>> fetch<T, E>(
    ValueResource<T, E> resource, {
    required Function(Resource<T, E>) emit,
    bool revertOnError = false,
    bool eager = false,
  }) async {
    if (!eager) {
      if (resource.state.maybeMap(
        available: (_) => true,
        fetching: (_) => true,
        orElse: () => false,
      )) {
        return const Left(null);
      }
    }

    final currentValue = resource.valueOrNull;
    emit(resource.copyAsFetching());

    final fetchedValue = await resource.fetch();
    return fetchedValue.fold(
      (E error) {
        if (revertOnError) {
          if (currentValue == null) {
            emit(resource.copyWithUnavailable());
          } else {
            emit(resource.copyWithAvailable(currentValue));
          }
        } else {
          emit(resource.copyWithError(error));
          resource.onError?.call(error);
        }
        return Left(error);
      },
      (T fetchedValue) {
        emit(resource.copyWithAvailable(fetchedValue));
        resource.onFetched?.call(fetchedValue);
        return Right(fetchedValue);
      },
    );
  }

  Future<Either<E?, List<T>>> fetchPage<T extends Identifiable<dynamic>, E, PageType>(
    ListResource<T, E, PageType> listResource, {
    required Function(Resource<List<T>, E>) emit,
    bool revertOnError = false,
    bool restart = false,
  }) async {
    final pageParams = restart ? listResource.firstPageParams : listResource.pageParams;
    if (!pageParams.hasPageToLoad) {
      assert(pageParams.hasPageToLoad, 'ListResource has no more pages to load');
      return const Left(null);
    }

    List<T>? currentValue = listResource.valueOrNull;

    if (restart) {
      emit(listResource.copyWithFetching(current: []));
      currentValue = [];
    } else {
      if (pageParams.page == listResource.firstPageParams.page) {
        emit(listResource.copyAsFetching());
      } else {
        emit(listResource.copyAsPaging());
      }
    }

    final page = await listResource.fetchPage(pageParams);
    return page.fold(
      (E error) {
        if (revertOnError) {
          if (currentValue == null) {
            emit(listResource.copyWithUnavailable());
          } else {
            emit(listResource._copyWithPageFetchParams(
              [...currentValue],
              pageParams: listResource.pageParams,
            ));
          }
        } else {
          emit(listResource.copyWithError(error));
          listResource.onError?.call(error);
        }
        return Left(error);
      },
      (PageType page) {
        final nextPageDetails = listResource.extractPageDetails(page, listResource.pageParams);
        final newItems = [...currentValue ?? [], ...nextPageDetails.items].cast<T>();
        emit(
          listResource._copyWithPageFetchParams(
            newItems,
            pageParams: nextPageDetails.pageParams,
          ),
        );
        listResource.onFetched?.call(newItems);
        return Right(newItems);
      },
    );
  }

  Future<Either<E?, T>> update<T, E>(
    ValueResource<T, E> resource, {
    required Function(Resource<T, E>) emit,
    required T payload,
    bool revertOnError = false,
    bool revertOnRefetchError = false,
    bool refetchAfterSuccessfulUpdate = false,
  }) async {
    if (resource.update == null) {
      assert(resource.update != null, 'update function is not defined on resource');
      return const Left(null);
    }

    final currentValue = resource.valueOrNull;
    emit(resource.copyAsUpdating(payload));

    final updatedValue = await resource.update!(payload);
    return updatedValue.fold(
      (E error) {
        if (revertOnError) {
          if (currentValue == null) {
            emit(resource.copyWithUnavailable());
          } else {
            emit(resource.copyWithAvailable(currentValue));
          }
        } else {
          emit(resource.copyWithError(error));
          resource.onError?.call(error);
        }
        return Left(error);
      },
      (T? updatedValue) async {
        if (!(updatedValue == null || refetchAfterSuccessfulUpdate)) {
          resource.onUpdated?.call(currentValue, updatedValue);
          emit(resource.copyWithAvailable(updatedValue));
          return Right(updatedValue);
        }

        final refetchedValue = await resource.fetch();
        return refetchedValue.fold(
          (E error) async {
            final retriedRefetch = await resource.fetch();
            return retriedRefetch.fold(
              (E error) {
                if (revertOnRefetchError) {
                  if (updatedValue != null) {
                    emit(resource.copyWithAvailable(updatedValue));
                  } else {
                    emit(resource.copyWithError(error));
                  }
                } else {
                  emit(resource.copyWithError(error));
                  resource.onError?.call(error);
                }
                return Left(error);
              },
              (T retriedRefetch) {
                emit(resource.copyWithAvailable(retriedRefetch));
                resource.onUpdated?.call(currentValue, retriedRefetch);
                return Right(retriedRefetch);
              },
            );
          },
          (T refetchedValue) {
            emit(resource.copyWithAvailable(refetchedValue));
            resource.onUpdated?.call(currentValue, refetchedValue);
            return Right(refetchedValue);
          },
        );
      },
    );
  }

  Future<Either<E?, T?>> updateItem<T extends Identifiable<dynamic>, E, PageType>(
    ListResource<T, E, PageType> listResource, {
    required Function(Resource<List<T>, E>) emit,
    required T payload,
    bool revertOnError = false,
    bool revertOnRefetchError = false,
    bool refetchAfterItemUpdate = false,
  }) async {
    if (listResource.updateItem == null) {
      assert(listResource.updateItem != null, 'updateItem function is not defined on ListResource');
      return const Left(null);
    }

    final currentList = listResource.valueOrNull;
    final optimisticUpdatedList = currentList?.map((i) => i.id == payload.id ? payload : i).toList();
    emit(listResource.copyAsUpdating(
      optimisticUpdatedList ?? [payload],
      info: FetchInfo.id(payload.id),
    ));

    final updatedItem = await listResource.updateItem!(payload);
    return updatedItem.fold(
      (E error) {
        if (revertOnError) {
          if (currentList == null) {
            emit(listResource.copyWithUnavailable());
          } else {
            emit(listResource.copyWithAvailable(currentList));
          }
        } else {
          emit(listResource.copyWithError(error));
          listResource.onError?.call(error);
        }
        return Left(error);
      },
      (T? updatedItem) async {
        final onFirstPage = listResource.firstPageParams.page == listResource.pageParams.page;
        assert(
          updatedItem != null || refetchAfterItemUpdate,
          'refetchAfterItemUpdate is false, but the update function returned null. Falling back to optimistically updating list with update request payload.',
        );
        assert(
          onFirstPage || !refetchAfterItemUpdate,
          'refetchAfterItemUpdate is true but ListResource is already paged. This configuration is not advised because it is not clear which page needs to be refetched. Falling back to refetching the list from first page.',
        );

        final optimisticUpdatedItem = updatedItem ?? payload;

        if (!refetchAfterItemUpdate) {
          if (currentList == null) {
            emit(listResource.copyWithAvailable([optimisticUpdatedItem]));
            listResource.onUpdated?.call(currentList, [optimisticUpdatedItem]);
          } else {
            final updatedList =
                currentList.map((i) => i.id == optimisticUpdatedItem.id ? optimisticUpdatedItem : i).toList();
            emit(listResource.copyWithAvailable(updatedList));
            listResource.onUpdated?.call(currentList, updatedList);
          }

          return Right(updatedItem);
        }

        final page = await listResource.fetchPage(listResource.firstPageParams);
        page.fold(
          (E error) async {
            final retryPage = await listResource.fetchPage(listResource.firstPageParams);
            return retryPage.fold(
              (E error) {
                if (revertOnRefetchError) {
                  if (currentList == null) {
                    emit(listResource.copyWithAvailable([optimisticUpdatedItem]));
                    listResource.onUpdated?.call(currentList, [optimisticUpdatedItem]);
                  } else {
                    final updatedList =
                        currentList.map((i) => i.id == optimisticUpdatedItem.id ? optimisticUpdatedItem : i).toList();
                    emit(listResource.copyWithAvailable(updatedList));
                    listResource.onUpdated?.call(currentList, updatedList);
                  }
                } else {
                  emit(listResource.copyWithError(error));
                  listResource.onError?.call(error);
                }
              },
              (PageType page) {
                final pageDetails = listResource.extractPageDetails(page, listResource.pageParams);
                final newList = pageDetails.items;
                emit(listResource.copyWithAvailable(newList));
                listResource.onUpdated?.call(currentList, newList);
              },
            );
          },
          (PageType page) {
            final pageDetails = listResource.extractPageDetails(page, listResource.pageParams);
            final newList = pageDetails.items;
            emit(listResource.copyWithAvailable(newList));
            listResource.onUpdated?.call(currentList, newList);
          },
        );

        return Right(updatedItem);
      },
    );
  }
}

class ValueResource<T, E> extends Resource<T, E> {
  ValueResource({
    required this.fetch,
    ResourceState<T, E> state = const ResourceState.unavailable(),
    this.update,
    Future Function(T value)? onFetched,
    Future Function(T? oldValue, T newValue)? onUpdated,
    Future Function(E error)? onError,
  }) : super(
          state: state,
          onError: onError,
          onUpdated: onUpdated,
          onFetched: onFetched,
        );

  final Future<Either<E, T>> Function() fetch;
  final Future<Either<E, T?>> Function(T)? update;

  @override
  ValueResource<T, E> copyWith(ResourceState<T, E> state) {
    return ValueResource<T, E>(
      state: state,
      fetch: fetch,
      onError: onError,
      onUpdated: onUpdated,
      update: update,
      onFetched: onFetched,
    );
  }

  @override
  String toString() {
    return state.when(
      unavailable: () => 'unavailable',
      fetching: (current, optimisticValue, _) => 'fetching (current: $current)',
      available: (value) => 'available: $value',
      error: (error) => 'error: $error',
    );
  }
}

mixin Identifiable<T> {
  T get id;
}

class PageDetails<T> {
  PageDetails({
    required this.items,
    this.pageParams,
  });

  final PageParams? pageParams;
  final List<T> items;
}

class PageParams {
  const PageParams({required this.pageSize, required this.page});

  final int pageSize;
  final int page;

  bool get hasPageToLoad => page != -1;
  int get offset => (page - 1) * pageSize;

  PageParams nextPage() => PageParams(page: page + 1, pageSize: pageSize);
}

abstract class Resource<T, E> {
  Resource({
    required this.state,
    this.onError,
    this.onUpdated,
    this.onFetched,
  });
  ResourceState<T, E> state;

  Future Function(T value)? onFetched;
  Future Function(T? oldValue, T newValue)? onUpdated;
  Future Function(E error)? onError;

  T? get valueOrNull => state.valueOrNull;

  Resource<T, E> copyWithUnavailable() => copyWith(ResourceState<T, E>.unavailable());
  Resource<T, E> copyAsFetching() => copyWith(state.asFetching());
  Resource<T, E> copyWithAvailable(T value) => copyWith(ResourceState<T, E>.available(value));
  Resource<T, E> copyAsUpdating(
    T optimisticValue, {
    FetchInfo info = const FetchInfo.none(),
  }) =>
      copyWith(ResourceState<T, E>.fetching(
        currentValue: valueOrNull,
        optimisticValue: optimisticValue,
        info: info,
      ));

  Resource<T, E> copyWithError(E error) => copyWith(ResourceState<T, E>.error(error));

  Resource<T, E> copyWith(ResourceState<T, E> state);
}

class ListResource<T extends Identifiable<dynamic>, E, PageResponseType> extends Resource<List<T>, E> {
  ListResource({
    required this.fetchPage,
    required this.extractPageDetails,
    this.updateItem,
    ResourceState<List<T>, E> state = const ResourceState.unavailable(),
    this.firstPageParams = const PageParams(pageSize: 50, page: 1),
    this.pageParams = const PageParams(pageSize: 50, page: 1),
    Future Function(List<T> value)? onFetched,
    Future Function(List<T>? oldValue, List<T> newValue)? onUpdated,
    Future Function(E error)? onError,
  }) : super(
          state: state,
          onError: onError,
          onFetched: onFetched,
          onUpdated: onUpdated,
        );

  final PageParams pageParams;
  final PageParams firstPageParams;

  final Future<Either<E, PageResponseType>> Function(PageParams fetchParams) fetchPage;
  final PageDetails<T> Function(PageResponseType pageResponse, PageParams previousPageParams) extractPageDetails;
  final Future<Either<E, T?>> Function(T)? updateItem;

  ListResource<T, E, PageResponseType> copyAsPaging() => copyWith(ResourceState<List<T>, E>.fetching(
        currentValue: valueOrNull,
        info: const FetchInfo.paging(),
      ));

  ListResource<T, E, PageResponseType> copyWithFetching({
    List<T>? current,
    List<T>? optimistic,
    FetchInfo info = const FetchInfo.none(),
  }) =>
      copyWith(ResourceState.fetching(
        currentValue: current,
        optimisticValue: optimistic,
        info: info,
      ));

  ListResource<T, E, PageResponseType> _copyWithPageFetchParams(
    List<T> value, {
    required PageParams? pageParams,
  }) =>
      copyWith(ResourceState<List<T>, E>.available(value), pageParams: pageParams);

  @override
  ListResource<T, E, PageResponseType> copyWith(
    ResourceState<List<T>, E> state, {
    PageParams? pageParams,
    PageParams? firstPageParams,
  }) {
    final _pageParams =
        state.isUnavailable ? pageParams ?? firstPageParams ?? this.firstPageParams : pageParams ?? this.pageParams;

    return ListResource<T, E, PageResponseType>(
      state: state,
      extractPageDetails: extractPageDetails,
      fetchPage: fetchPage,
      onError: onError,
      onUpdated: onUpdated,
      onFetched: onFetched,
      pageParams: _pageParams,
      firstPageParams: firstPageParams ?? this.firstPageParams,
    );
  }
}
