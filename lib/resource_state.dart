import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_state.freezed.dart';

@freezed
class FetchInfo with _$FetchInfo{
  const FetchInfo._();
  const factory FetchInfo.none() = NoFetchInfo;
  const factory FetchInfo.id(dynamic id) = IdFetchInfo;
  const factory FetchInfo.paging() = PagingFetchInfo;

  dynamic get idOrNull => maybeWhen<dynamic>(id: (dynamic id) => id, orElse: () => null);

  bool get isPaging => maybeWhen<bool>(paging: () => true, orElse: () => false);
}

@freezed
class ResourceState<T, E> with _$ResourceState<T, E> {
  const ResourceState._();
  const factory ResourceState.unavailable() = UnavailableResource<T, E>;
  const factory ResourceState.fetching({
    @Default(null) T? currentValue,
    @Default(null) T? optimisticValue,
    @Default(FetchInfo.none()) FetchInfo info,
  }) = FetchingResource<T, E>;
  const factory ResourceState.available(T value) = AvailableResource<T, E>;
  const factory ResourceState.error(E error) = ErrorResource<T, E>;

  bool get isUnavailable => maybeWhen(unavailable: () => true, orElse: () => false);
  bool get isAvailable => maybeWhen(available: (_) => true, orElse: () => false);
  bool get isFetching => maybeWhen(fetching: (_, __, ___) => true, orElse: () => false);
  bool get isUpdating => maybeWhen(fetching: (_, optimisticValue, __) => optimisticValue != null, orElse: () => false);
  bool get isError => maybeWhen(error: (_) => true, orElse: () => false);

  T? get valueOrNull => maybeWhen(
        available: (value) => value,
        fetching: (currentValue, _, __) => currentValue,
        orElse: () => null,
      );

  T? get optimisticValueOrNull => maybeWhen(
        available: (value) => value,
        fetching: (_, optimisticValue, __) => optimisticValue,
        orElse: () => null,
      );

  ResourceState<T, E> asFetching() => maybeWhen(
        available: (value) => ResourceState.fetching(currentValue: value),
        fetching: (currentValue, _, __) => ResourceState.fetching(currentValue: currentValue),
        orElse: () => const ResourceState.fetching(currentValue: null),
      );

  ResourceState<T2, E> mapValue<T2>(T2 Function(T value) valueMapper) => when(
        unavailable: () => const ResourceState.unavailable(),
        fetching: (currentValue, optimisticValue, info) {
          T2? transformedCurrentValue;
          T2? transformedNewValue;
          if (currentValue != null) {
            transformedCurrentValue = valueMapper(currentValue);
          }
          if (optimisticValue != null) {
            transformedNewValue = valueMapper(optimisticValue);
          }
          return ResourceState.fetching(
            currentValue: transformedCurrentValue,
            optimisticValue: transformedNewValue,
            info: info
          );
        },
        available: (_) => ResourceState.available(valueMapper(_)),
        error: (_) => ResourceState.error(_),
      );

  ResourceState<T, E2> mapError<E2>(E2 Function(E error) errorMapper) => when(
        unavailable: () => const ResourceState.unavailable(),
        fetching: (_, __, ___) => ResourceState.fetching(currentValue: _, optimisticValue: __, info: ___),
        available: (_) => ResourceState.available(_),
        error: (e) => ResourceState.error(errorMapper(e)),
      );

  ResourceState<T2, E2> mapState<T2, E2>({
    required T2 Function(T value) value,
    required E2 Function(E error) error,
  }) =>
      mapValue(value).mapError(error);
}
