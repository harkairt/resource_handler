// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'resource_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FetchInfoTearOff {
  const _$FetchInfoTearOff();

  NoFetchInfo none() {
    return const NoFetchInfo();
  }

  IdFetchInfo id(dynamic id) {
    return IdFetchInfo(
      id,
    );
  }

  PagingFetchInfo paging() {
    return const PagingFetchInfo();
  }
}

/// @nodoc
const $FetchInfo = _$FetchInfoTearOff();

/// @nodoc
mixin _$FetchInfo {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(dynamic id) id,
    required TResult Function() paging,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(dynamic id)? id,
    TResult Function()? paging,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoFetchInfo value) none,
    required TResult Function(IdFetchInfo value) id,
    required TResult Function(PagingFetchInfo value) paging,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoFetchInfo value)? none,
    TResult Function(IdFetchInfo value)? id,
    TResult Function(PagingFetchInfo value)? paging,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchInfoCopyWith<$Res> {
  factory $FetchInfoCopyWith(FetchInfo value, $Res Function(FetchInfo) then) =
      _$FetchInfoCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchInfoCopyWithImpl<$Res> implements $FetchInfoCopyWith<$Res> {
  _$FetchInfoCopyWithImpl(this._value, this._then);

  final FetchInfo _value;
  // ignore: unused_field
  final $Res Function(FetchInfo) _then;
}

/// @nodoc
abstract class $NoFetchInfoCopyWith<$Res> {
  factory $NoFetchInfoCopyWith(
          NoFetchInfo value, $Res Function(NoFetchInfo) then) =
      _$NoFetchInfoCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoFetchInfoCopyWithImpl<$Res> extends _$FetchInfoCopyWithImpl<$Res>
    implements $NoFetchInfoCopyWith<$Res> {
  _$NoFetchInfoCopyWithImpl(
      NoFetchInfo _value, $Res Function(NoFetchInfo) _then)
      : super(_value, (v) => _then(v as NoFetchInfo));

  @override
  NoFetchInfo get _value => super._value as NoFetchInfo;
}

/// @nodoc

class _$NoFetchInfo extends NoFetchInfo {
  const _$NoFetchInfo() : super._();

  @override
  String toString() {
    return 'FetchInfo.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoFetchInfo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(dynamic id) id,
    required TResult Function() paging,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(dynamic id)? id,
    TResult Function()? paging,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoFetchInfo value) none,
    required TResult Function(IdFetchInfo value) id,
    required TResult Function(PagingFetchInfo value) paging,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoFetchInfo value)? none,
    TResult Function(IdFetchInfo value)? id,
    TResult Function(PagingFetchInfo value)? paging,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class NoFetchInfo extends FetchInfo {
  const factory NoFetchInfo() = _$NoFetchInfo;
  const NoFetchInfo._() : super._();
}

/// @nodoc
abstract class $IdFetchInfoCopyWith<$Res> {
  factory $IdFetchInfoCopyWith(
          IdFetchInfo value, $Res Function(IdFetchInfo) then) =
      _$IdFetchInfoCopyWithImpl<$Res>;
  $Res call({dynamic id});
}

/// @nodoc
class _$IdFetchInfoCopyWithImpl<$Res> extends _$FetchInfoCopyWithImpl<$Res>
    implements $IdFetchInfoCopyWith<$Res> {
  _$IdFetchInfoCopyWithImpl(
      IdFetchInfo _value, $Res Function(IdFetchInfo) _then)
      : super(_value, (v) => _then(v as IdFetchInfo));

  @override
  IdFetchInfo get _value => super._value as IdFetchInfo;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(IdFetchInfo(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$IdFetchInfo extends IdFetchInfo {
  const _$IdFetchInfo(this.id) : super._();

  @override
  final dynamic id;

  @override
  String toString() {
    return 'FetchInfo.id(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IdFetchInfo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  $IdFetchInfoCopyWith<IdFetchInfo> get copyWith =>
      _$IdFetchInfoCopyWithImpl<IdFetchInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(dynamic id) id,
    required TResult Function() paging,
  }) {
    return id(this.id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(dynamic id)? id,
    TResult Function()? paging,
    required TResult orElse(),
  }) {
    if (id != null) {
      return id(this.id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoFetchInfo value) none,
    required TResult Function(IdFetchInfo value) id,
    required TResult Function(PagingFetchInfo value) paging,
  }) {
    return id(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoFetchInfo value)? none,
    TResult Function(IdFetchInfo value)? id,
    TResult Function(PagingFetchInfo value)? paging,
    required TResult orElse(),
  }) {
    if (id != null) {
      return id(this);
    }
    return orElse();
  }
}

abstract class IdFetchInfo extends FetchInfo {
  const factory IdFetchInfo(dynamic id) = _$IdFetchInfo;
  const IdFetchInfo._() : super._();

  dynamic get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdFetchInfoCopyWith<IdFetchInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagingFetchInfoCopyWith<$Res> {
  factory $PagingFetchInfoCopyWith(
          PagingFetchInfo value, $Res Function(PagingFetchInfo) then) =
      _$PagingFetchInfoCopyWithImpl<$Res>;
}

/// @nodoc
class _$PagingFetchInfoCopyWithImpl<$Res> extends _$FetchInfoCopyWithImpl<$Res>
    implements $PagingFetchInfoCopyWith<$Res> {
  _$PagingFetchInfoCopyWithImpl(
      PagingFetchInfo _value, $Res Function(PagingFetchInfo) _then)
      : super(_value, (v) => _then(v as PagingFetchInfo));

  @override
  PagingFetchInfo get _value => super._value as PagingFetchInfo;
}

/// @nodoc

class _$PagingFetchInfo extends PagingFetchInfo {
  const _$PagingFetchInfo() : super._();

  @override
  String toString() {
    return 'FetchInfo.paging()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PagingFetchInfo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(dynamic id) id,
    required TResult Function() paging,
  }) {
    return paging();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(dynamic id)? id,
    TResult Function()? paging,
    required TResult orElse(),
  }) {
    if (paging != null) {
      return paging();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoFetchInfo value) none,
    required TResult Function(IdFetchInfo value) id,
    required TResult Function(PagingFetchInfo value) paging,
  }) {
    return paging(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoFetchInfo value)? none,
    TResult Function(IdFetchInfo value)? id,
    TResult Function(PagingFetchInfo value)? paging,
    required TResult orElse(),
  }) {
    if (paging != null) {
      return paging(this);
    }
    return orElse();
  }
}

abstract class PagingFetchInfo extends FetchInfo {
  const factory PagingFetchInfo() = _$PagingFetchInfo;
  const PagingFetchInfo._() : super._();
}

/// @nodoc
class _$ResourceStateTearOff {
  const _$ResourceStateTearOff();

  UnavailableResource<T, E> unavailable<T, E>() {
    return UnavailableResource<T, E>();
  }

  FetchingResource<T, E> fetching<T, E>(
      {T? currentValue = null,
      T? optimisticValue = null,
      FetchInfo info = const FetchInfo.none()}) {
    return FetchingResource<T, E>(
      currentValue: currentValue,
      optimisticValue: optimisticValue,
      info: info,
    );
  }

  AvailableResource<T, E> available<T, E>(T value) {
    return AvailableResource<T, E>(
      value,
    );
  }

  ErrorResource<T, E> error<T, E>(E error) {
    return ErrorResource<T, E>(
      error,
    );
  }
}

/// @nodoc
const $ResourceState = _$ResourceStateTearOff();

/// @nodoc
mixin _$ResourceState<T, E> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unavailable,
    required TResult Function(
            T? currentValue, T? optimisticValue, FetchInfo info)
        fetching,
    required TResult Function(T value) available,
    required TResult Function(E error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unavailable,
    TResult Function(T? currentValue, T? optimisticValue, FetchInfo info)?
        fetching,
    TResult Function(T value)? available,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnavailableResource<T, E> value) unavailable,
    required TResult Function(FetchingResource<T, E> value) fetching,
    required TResult Function(AvailableResource<T, E> value) available,
    required TResult Function(ErrorResource<T, E> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnavailableResource<T, E> value)? unavailable,
    TResult Function(FetchingResource<T, E> value)? fetching,
    TResult Function(AvailableResource<T, E> value)? available,
    TResult Function(ErrorResource<T, E> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceStateCopyWith<T, E, $Res> {
  factory $ResourceStateCopyWith(
          ResourceState<T, E> value, $Res Function(ResourceState<T, E>) then) =
      _$ResourceStateCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class _$ResourceStateCopyWithImpl<T, E, $Res>
    implements $ResourceStateCopyWith<T, E, $Res> {
  _$ResourceStateCopyWithImpl(this._value, this._then);

  final ResourceState<T, E> _value;
  // ignore: unused_field
  final $Res Function(ResourceState<T, E>) _then;
}

/// @nodoc
abstract class $UnavailableResourceCopyWith<T, E, $Res> {
  factory $UnavailableResourceCopyWith(UnavailableResource<T, E> value,
          $Res Function(UnavailableResource<T, E>) then) =
      _$UnavailableResourceCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class _$UnavailableResourceCopyWithImpl<T, E, $Res>
    extends _$ResourceStateCopyWithImpl<T, E, $Res>
    implements $UnavailableResourceCopyWith<T, E, $Res> {
  _$UnavailableResourceCopyWithImpl(UnavailableResource<T, E> _value,
      $Res Function(UnavailableResource<T, E>) _then)
      : super(_value, (v) => _then(v as UnavailableResource<T, E>));

  @override
  UnavailableResource<T, E> get _value =>
      super._value as UnavailableResource<T, E>;
}

/// @nodoc

class _$UnavailableResource<T, E> extends UnavailableResource<T, E> {
  const _$UnavailableResource() : super._();

  @override
  String toString() {
    return 'ResourceState<$T, $E>.unavailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnavailableResource<T, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unavailable,
    required TResult Function(
            T? currentValue, T? optimisticValue, FetchInfo info)
        fetching,
    required TResult Function(T value) available,
    required TResult Function(E error) error,
  }) {
    return unavailable();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unavailable,
    TResult Function(T? currentValue, T? optimisticValue, FetchInfo info)?
        fetching,
    TResult Function(T value)? available,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (unavailable != null) {
      return unavailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnavailableResource<T, E> value) unavailable,
    required TResult Function(FetchingResource<T, E> value) fetching,
    required TResult Function(AvailableResource<T, E> value) available,
    required TResult Function(ErrorResource<T, E> value) error,
  }) {
    return unavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnavailableResource<T, E> value)? unavailable,
    TResult Function(FetchingResource<T, E> value)? fetching,
    TResult Function(AvailableResource<T, E> value)? available,
    TResult Function(ErrorResource<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (unavailable != null) {
      return unavailable(this);
    }
    return orElse();
  }
}

abstract class UnavailableResource<T, E> extends ResourceState<T, E> {
  const factory UnavailableResource() = _$UnavailableResource<T, E>;
  const UnavailableResource._() : super._();
}

/// @nodoc
abstract class $FetchingResourceCopyWith<T, E, $Res> {
  factory $FetchingResourceCopyWith(FetchingResource<T, E> value,
          $Res Function(FetchingResource<T, E>) then) =
      _$FetchingResourceCopyWithImpl<T, E, $Res>;
  $Res call({T? currentValue, T? optimisticValue, FetchInfo info});

  $FetchInfoCopyWith<$Res> get info;
}

/// @nodoc
class _$FetchingResourceCopyWithImpl<T, E, $Res>
    extends _$ResourceStateCopyWithImpl<T, E, $Res>
    implements $FetchingResourceCopyWith<T, E, $Res> {
  _$FetchingResourceCopyWithImpl(FetchingResource<T, E> _value,
      $Res Function(FetchingResource<T, E>) _then)
      : super(_value, (v) => _then(v as FetchingResource<T, E>));

  @override
  FetchingResource<T, E> get _value => super._value as FetchingResource<T, E>;

  @override
  $Res call({
    Object? currentValue = freezed,
    Object? optimisticValue = freezed,
    Object? info = freezed,
  }) {
    return _then(FetchingResource<T, E>(
      currentValue: currentValue == freezed
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as T?,
      optimisticValue: optimisticValue == freezed
          ? _value.optimisticValue
          : optimisticValue // ignore: cast_nullable_to_non_nullable
              as T?,
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as FetchInfo,
    ));
  }

  @override
  $FetchInfoCopyWith<$Res> get info {
    return $FetchInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value));
    });
  }
}

/// @nodoc

class _$FetchingResource<T, E> extends FetchingResource<T, E> {
  const _$FetchingResource(
      {this.currentValue = null,
      this.optimisticValue = null,
      this.info = const FetchInfo.none()})
      : super._();

  @JsonKey(defaultValue: null)
  @override
  final T? currentValue;
  @JsonKey(defaultValue: null)
  @override
  final T? optimisticValue;
  @JsonKey(defaultValue: const FetchInfo.none())
  @override
  final FetchInfo info;

  @override
  String toString() {
    return 'ResourceState<$T, $E>.fetching(currentValue: $currentValue, optimisticValue: $optimisticValue, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchingResource<T, E> &&
            (identical(other.currentValue, currentValue) ||
                const DeepCollectionEquality()
                    .equals(other.currentValue, currentValue)) &&
            (identical(other.optimisticValue, optimisticValue) ||
                const DeepCollectionEquality()
                    .equals(other.optimisticValue, optimisticValue)) &&
            (identical(other.info, info) ||
                const DeepCollectionEquality().equals(other.info, info)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentValue) ^
      const DeepCollectionEquality().hash(optimisticValue) ^
      const DeepCollectionEquality().hash(info);

  @JsonKey(ignore: true)
  @override
  $FetchingResourceCopyWith<T, E, FetchingResource<T, E>> get copyWith =>
      _$FetchingResourceCopyWithImpl<T, E, FetchingResource<T, E>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unavailable,
    required TResult Function(
            T? currentValue, T? optimisticValue, FetchInfo info)
        fetching,
    required TResult Function(T value) available,
    required TResult Function(E error) error,
  }) {
    return fetching(currentValue, optimisticValue, info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unavailable,
    TResult Function(T? currentValue, T? optimisticValue, FetchInfo info)?
        fetching,
    TResult Function(T value)? available,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(currentValue, optimisticValue, info);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnavailableResource<T, E> value) unavailable,
    required TResult Function(FetchingResource<T, E> value) fetching,
    required TResult Function(AvailableResource<T, E> value) available,
    required TResult Function(ErrorResource<T, E> value) error,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnavailableResource<T, E> value)? unavailable,
    TResult Function(FetchingResource<T, E> value)? fetching,
    TResult Function(AvailableResource<T, E> value)? available,
    TResult Function(ErrorResource<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class FetchingResource<T, E> extends ResourceState<T, E> {
  const factory FetchingResource(
      {T? currentValue,
      T? optimisticValue,
      FetchInfo info}) = _$FetchingResource<T, E>;
  const FetchingResource._() : super._();

  T? get currentValue => throw _privateConstructorUsedError;
  T? get optimisticValue => throw _privateConstructorUsedError;
  FetchInfo get info => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchingResourceCopyWith<T, E, FetchingResource<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableResourceCopyWith<T, E, $Res> {
  factory $AvailableResourceCopyWith(AvailableResource<T, E> value,
          $Res Function(AvailableResource<T, E>) then) =
      _$AvailableResourceCopyWithImpl<T, E, $Res>;
  $Res call({T value});
}

/// @nodoc
class _$AvailableResourceCopyWithImpl<T, E, $Res>
    extends _$ResourceStateCopyWithImpl<T, E, $Res>
    implements $AvailableResourceCopyWith<T, E, $Res> {
  _$AvailableResourceCopyWithImpl(AvailableResource<T, E> _value,
      $Res Function(AvailableResource<T, E>) _then)
      : super(_value, (v) => _then(v as AvailableResource<T, E>));

  @override
  AvailableResource<T, E> get _value => super._value as AvailableResource<T, E>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(AvailableResource<T, E>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$AvailableResource<T, E> extends AvailableResource<T, E> {
  const _$AvailableResource(this.value) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'ResourceState<$T, $E>.available(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AvailableResource<T, E> &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  $AvailableResourceCopyWith<T, E, AvailableResource<T, E>> get copyWith =>
      _$AvailableResourceCopyWithImpl<T, E, AvailableResource<T, E>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unavailable,
    required TResult Function(
            T? currentValue, T? optimisticValue, FetchInfo info)
        fetching,
    required TResult Function(T value) available,
    required TResult Function(E error) error,
  }) {
    return available(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unavailable,
    TResult Function(T? currentValue, T? optimisticValue, FetchInfo info)?
        fetching,
    TResult Function(T value)? available,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnavailableResource<T, E> value) unavailable,
    required TResult Function(FetchingResource<T, E> value) fetching,
    required TResult Function(AvailableResource<T, E> value) available,
    required TResult Function(ErrorResource<T, E> value) error,
  }) {
    return available(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnavailableResource<T, E> value)? unavailable,
    TResult Function(FetchingResource<T, E> value)? fetching,
    TResult Function(AvailableResource<T, E> value)? available,
    TResult Function(ErrorResource<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(this);
    }
    return orElse();
  }
}

abstract class AvailableResource<T, E> extends ResourceState<T, E> {
  const factory AvailableResource(T value) = _$AvailableResource<T, E>;
  const AvailableResource._() : super._();

  T get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvailableResourceCopyWith<T, E, AvailableResource<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorResourceCopyWith<T, E, $Res> {
  factory $ErrorResourceCopyWith(
          ErrorResource<T, E> value, $Res Function(ErrorResource<T, E>) then) =
      _$ErrorResourceCopyWithImpl<T, E, $Res>;
  $Res call({E error});
}

/// @nodoc
class _$ErrorResourceCopyWithImpl<T, E, $Res>
    extends _$ResourceStateCopyWithImpl<T, E, $Res>
    implements $ErrorResourceCopyWith<T, E, $Res> {
  _$ErrorResourceCopyWithImpl(
      ErrorResource<T, E> _value, $Res Function(ErrorResource<T, E>) _then)
      : super(_value, (v) => _then(v as ErrorResource<T, E>));

  @override
  ErrorResource<T, E> get _value => super._value as ErrorResource<T, E>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ErrorResource<T, E>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$ErrorResource<T, E> extends ErrorResource<T, E> {
  const _$ErrorResource(this.error) : super._();

  @override
  final E error;

  @override
  String toString() {
    return 'ResourceState<$T, $E>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorResource<T, E> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $ErrorResourceCopyWith<T, E, ErrorResource<T, E>> get copyWith =>
      _$ErrorResourceCopyWithImpl<T, E, ErrorResource<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unavailable,
    required TResult Function(
            T? currentValue, T? optimisticValue, FetchInfo info)
        fetching,
    required TResult Function(T value) available,
    required TResult Function(E error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unavailable,
    TResult Function(T? currentValue, T? optimisticValue, FetchInfo info)?
        fetching,
    TResult Function(T value)? available,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnavailableResource<T, E> value) unavailable,
    required TResult Function(FetchingResource<T, E> value) fetching,
    required TResult Function(AvailableResource<T, E> value) available,
    required TResult Function(ErrorResource<T, E> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnavailableResource<T, E> value)? unavailable,
    TResult Function(FetchingResource<T, E> value)? fetching,
    TResult Function(AvailableResource<T, E> value)? available,
    TResult Function(ErrorResource<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorResource<T, E> extends ResourceState<T, E> {
  const factory ErrorResource(E error) = _$ErrorResource<T, E>;
  const ErrorResource._() : super._();

  E get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorResourceCopyWith<T, E, ErrorResource<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
