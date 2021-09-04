import 'package:dartz/dartz.dart';
import 'package:resource_handler/resource_handler.dart';
import 'package:mocktail/mocktail.dart';
import 'package:resource_handler/resource_state.dart';
import 'package:test/test.dart';

abstract class Emitter {
  void emit(Resource resources);
}

abstract class EventListener<ValueType, ErrorType> {
  void onFetched(ValueType value);
  void onUpdated(ValueType? current, ValueType? optimistic);
  void onError(ErrorType error);
}

class MockEmitter extends Mock with Emitter {}

class MockEventListener<ValueType, ErrorType> extends Mock with EventListener<ValueType, ErrorType> {}

class Handler with ResourceHandler {
  Handler({required this.emitter});

  final Emitter emitter;

  Future _fetch<T, E>(ValueResource<T, E> resource, {bool eager = false}) async {
    fetch(resource, emit: emitter.emit, eager: eager);
  }
}

extension X on List<Map<String, Resource>> {
  List<Resource?> of(String key) => map((e) => e.containsKey(key) ? e[key] : null).toList();
}

extension Y on List<Resource?> {
  List<ResourceState?> get states => map((e) => e?.state).toList();
}

ResourceState<String, String> unavailable() {
  return const ResourceState<String, String>.unavailable();
}

ResourceState<String, String> fetching([String? current, String? optimistic]) {
  return ResourceState<String, String>.fetching(currentValue: current, optimisticValue: optimistic);
}

ResourceState<String, String> available(String value) {
  return ResourceState<String, String>.available(value);
}

ResourceState<String, String> error(String error) {
  return ResourceState<String, String>.error(error);
}

void main() {
  late final Handler handler;
  late final Emitter emitter;
  late final EventListener<String, String> eventListener;
  late final ValueResource<String, String> resource;
  late final ValueResource<String, String> resourceFailingFetch;

  List<Resource> emits() {
    return (verify(() => emitter.emit(captureAny())).captured).toList().cast<Resource>();
  }

  void emitsNothing() => verifyNever(() => emitter.emit(captureAny()));

  setUpAll(() {
    emitter = MockEmitter();
    handler = Handler(emitter: emitter);
    registerFallbackValue(ValueResource<dynamic, dynamic>(fetch: () => Future.value()));

    eventListener = MockEventListener<String, String>();
    resource = ValueResource<String, String>(
      state: const ResourceState.unavailable(),
      fetch: () async => const Right<String, String>('fetched'),
      update: (updated) async => Right<String, String?>(updated),
      onError: (error) async => eventListener.onError(error),
      onUpdated: (current, optimistic) async => eventListener.onUpdated(current, optimistic),
      onFetched: (value) async => eventListener.onFetched(value),
    );
    resourceFailingFetch = ValueResource<String, String>(
      state: const ResourceState.unavailable(),
      fetch: () async => const Left<String, String>('error'),
      update: (updated) async => Right<String, String?>(updated),
      onError: (error) async => eventListener.onError(error),
      onUpdated: (current, optimistic) async => eventListener.onUpdated(current, optimistic),
      onFetched: (value) async => eventListener.onFetched(value),
    );
  });

  setUp(() {
    resetMocktailState();
    reset(emitter);
    reset(eventListener);
  });

  group('calling fetch', () {
    test('emit fetching then the fetched value', () async {
      await handler._fetch(resource);

      final emittedStates = emits().states;
      expect(emittedStates.length, equals(2));
      expect(emittedStates[0], equals(const ResourceState<String, String>.fetching()));
      expect(emittedStates[1], equals(const ResourceState<String, String>.available('fetched')));
      verify(() => eventListener.onFetched('fetched'));
    });

    test('should not emit anything if state is available', () async {
      await handler._fetch(resource.copyWith(available('current value')));

      emitsNothing();
    });

    test('should emit fetching with current value when calling with eager: true', () async {
      await handler._fetch(resource.copyWith(available('current value')), eager: true);

      final emittedStates = emits().states;
      expect(emittedStates.length, equals(2));
      expect(emittedStates[0], equals(fetching('current value')));
      expect(emittedStates[1], equals(available('fetched')));
      verify(() => eventListener.onFetched('fetched'));
    });

    test('should emit error when fetch fails', () async {
      await handler._fetch(resourceFailingFetch.copyWith(available('current value')), eager: true);

      final emittedStates = emits().states;
      expect(emittedStates.length, equals(2));
      expect(emittedStates[0], equals(fetching('current value')));
      expect(emittedStates[1], equals(error('error')));
      verify(() => eventListener.onError('error'));
      verifyNever(() => eventListener.onFetched(captureAny<String>()));
    });
  });
}
