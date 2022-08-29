// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorites_routes_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoritesRoutesStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<LocalRoute> routes) data,
    required TResult Function() loading,
    required TResult Function(Exception exception) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<LocalRoute> routes)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<LocalRoute> routes)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesRoutesStatesData value) data,
    required TResult Function(FavoritesRoutesStatesLoading value) loading,
    required TResult Function(FavoritesRoutesStatesError value) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavoritesRoutesStatesData value)? data,
    TResult Function(FavoritesRoutesStatesLoading value)? loading,
    TResult Function(FavoritesRoutesStatesError value)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesRoutesStatesData value)? data,
    TResult Function(FavoritesRoutesStatesLoading value)? loading,
    TResult Function(FavoritesRoutesStatesError value)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesRoutesStatesCopyWith<$Res> {
  factory $FavoritesRoutesStatesCopyWith(FavoritesRoutesStates value,
          $Res Function(FavoritesRoutesStates) then) =
      _$FavoritesRoutesStatesCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoritesRoutesStatesCopyWithImpl<$Res>
    implements $FavoritesRoutesStatesCopyWith<$Res> {
  _$FavoritesRoutesStatesCopyWithImpl(this._value, this._then);

  final FavoritesRoutesStates _value;
  // ignore: unused_field
  final $Res Function(FavoritesRoutesStates) _then;
}

/// @nodoc
abstract class _$$FavoritesRoutesStatesDataCopyWith<$Res> {
  factory _$$FavoritesRoutesStatesDataCopyWith(
          _$FavoritesRoutesStatesData value,
          $Res Function(_$FavoritesRoutesStatesData) then) =
      __$$FavoritesRoutesStatesDataCopyWithImpl<$Res>;
  $Res call({List<LocalRoute> routes});
}

/// @nodoc
class __$$FavoritesRoutesStatesDataCopyWithImpl<$Res>
    extends _$FavoritesRoutesStatesCopyWithImpl<$Res>
    implements _$$FavoritesRoutesStatesDataCopyWith<$Res> {
  __$$FavoritesRoutesStatesDataCopyWithImpl(_$FavoritesRoutesStatesData _value,
      $Res Function(_$FavoritesRoutesStatesData) _then)
      : super(_value, (v) => _then(v as _$FavoritesRoutesStatesData));

  @override
  _$FavoritesRoutesStatesData get _value =>
      super._value as _$FavoritesRoutesStatesData;

  @override
  $Res call({
    Object? routes = freezed,
  }) {
    return _then(_$FavoritesRoutesStatesData(
      routes == freezed
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<LocalRoute>,
    ));
  }
}

/// @nodoc

class _$FavoritesRoutesStatesData implements FavoritesRoutesStatesData {
  const _$FavoritesRoutesStatesData(final List<LocalRoute> routes)
      : _routes = routes;

  final List<LocalRoute> _routes;
  @override
  List<LocalRoute> get routes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

  @override
  String toString() {
    return 'FavoritesRoutesStates.data(routes: $routes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesRoutesStatesData &&
            const DeepCollectionEquality().equals(other._routes, _routes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_routes));

  @JsonKey(ignore: true)
  @override
  _$$FavoritesRoutesStatesDataCopyWith<_$FavoritesRoutesStatesData>
      get copyWith => __$$FavoritesRoutesStatesDataCopyWithImpl<
          _$FavoritesRoutesStatesData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<LocalRoute> routes) data,
    required TResult Function() loading,
    required TResult Function(Exception exception) exception,
  }) {
    return data(routes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<LocalRoute> routes)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
  }) {
    return data?.call(routes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<LocalRoute> routes)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(routes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesRoutesStatesData value) data,
    required TResult Function(FavoritesRoutesStatesLoading value) loading,
    required TResult Function(FavoritesRoutesStatesError value) exception,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavoritesRoutesStatesData value)? data,
    TResult Function(FavoritesRoutesStatesLoading value)? loading,
    TResult Function(FavoritesRoutesStatesError value)? exception,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesRoutesStatesData value)? data,
    TResult Function(FavoritesRoutesStatesLoading value)? loading,
    TResult Function(FavoritesRoutesStatesError value)? exception,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class FavoritesRoutesStatesData implements FavoritesRoutesStates {
  const factory FavoritesRoutesStatesData(final List<LocalRoute> routes) =
      _$FavoritesRoutesStatesData;

  List<LocalRoute> get routes;
  @JsonKey(ignore: true)
  _$$FavoritesRoutesStatesDataCopyWith<_$FavoritesRoutesStatesData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoritesRoutesStatesLoadingCopyWith<$Res> {
  factory _$$FavoritesRoutesStatesLoadingCopyWith(
          _$FavoritesRoutesStatesLoading value,
          $Res Function(_$FavoritesRoutesStatesLoading) then) =
      __$$FavoritesRoutesStatesLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoritesRoutesStatesLoadingCopyWithImpl<$Res>
    extends _$FavoritesRoutesStatesCopyWithImpl<$Res>
    implements _$$FavoritesRoutesStatesLoadingCopyWith<$Res> {
  __$$FavoritesRoutesStatesLoadingCopyWithImpl(
      _$FavoritesRoutesStatesLoading _value,
      $Res Function(_$FavoritesRoutesStatesLoading) _then)
      : super(_value, (v) => _then(v as _$FavoritesRoutesStatesLoading));

  @override
  _$FavoritesRoutesStatesLoading get _value =>
      super._value as _$FavoritesRoutesStatesLoading;
}

/// @nodoc

class _$FavoritesRoutesStatesLoading implements FavoritesRoutesStatesLoading {
  const _$FavoritesRoutesStatesLoading();

  @override
  String toString() {
    return 'FavoritesRoutesStates.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesRoutesStatesLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<LocalRoute> routes) data,
    required TResult Function() loading,
    required TResult Function(Exception exception) exception,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<LocalRoute> routes)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<LocalRoute> routes)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesRoutesStatesData value) data,
    required TResult Function(FavoritesRoutesStatesLoading value) loading,
    required TResult Function(FavoritesRoutesStatesError value) exception,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavoritesRoutesStatesData value)? data,
    TResult Function(FavoritesRoutesStatesLoading value)? loading,
    TResult Function(FavoritesRoutesStatesError value)? exception,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesRoutesStatesData value)? data,
    TResult Function(FavoritesRoutesStatesLoading value)? loading,
    TResult Function(FavoritesRoutesStatesError value)? exception,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FavoritesRoutesStatesLoading implements FavoritesRoutesStates {
  const factory FavoritesRoutesStatesLoading() = _$FavoritesRoutesStatesLoading;
}

/// @nodoc
abstract class _$$FavoritesRoutesStatesErrorCopyWith<$Res> {
  factory _$$FavoritesRoutesStatesErrorCopyWith(
          _$FavoritesRoutesStatesError value,
          $Res Function(_$FavoritesRoutesStatesError) then) =
      __$$FavoritesRoutesStatesErrorCopyWithImpl<$Res>;
  $Res call({Exception exception});
}

/// @nodoc
class __$$FavoritesRoutesStatesErrorCopyWithImpl<$Res>
    extends _$FavoritesRoutesStatesCopyWithImpl<$Res>
    implements _$$FavoritesRoutesStatesErrorCopyWith<$Res> {
  __$$FavoritesRoutesStatesErrorCopyWithImpl(
      _$FavoritesRoutesStatesError _value,
      $Res Function(_$FavoritesRoutesStatesError) _then)
      : super(_value, (v) => _then(v as _$FavoritesRoutesStatesError));

  @override
  _$FavoritesRoutesStatesError get _value =>
      super._value as _$FavoritesRoutesStatesError;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_$FavoritesRoutesStatesError(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$FavoritesRoutesStatesError implements FavoritesRoutesStatesError {
  const _$FavoritesRoutesStatesError(this.exception);

  @override
  final Exception exception;

  @override
  String toString() {
    return 'FavoritesRoutesStates.exception(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesRoutesStatesError &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$FavoritesRoutesStatesErrorCopyWith<_$FavoritesRoutesStatesError>
      get copyWith => __$$FavoritesRoutesStatesErrorCopyWithImpl<
          _$FavoritesRoutesStatesError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<LocalRoute> routes) data,
    required TResult Function() loading,
    required TResult Function(Exception exception) exception,
  }) {
    return exception(this.exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<LocalRoute> routes)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
  }) {
    return exception?.call(this.exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<LocalRoute> routes)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this.exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesRoutesStatesData value) data,
    required TResult Function(FavoritesRoutesStatesLoading value) loading,
    required TResult Function(FavoritesRoutesStatesError value) exception,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavoritesRoutesStatesData value)? data,
    TResult Function(FavoritesRoutesStatesLoading value)? loading,
    TResult Function(FavoritesRoutesStatesError value)? exception,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesRoutesStatesData value)? data,
    TResult Function(FavoritesRoutesStatesLoading value)? loading,
    TResult Function(FavoritesRoutesStatesError value)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class FavoritesRoutesStatesError implements FavoritesRoutesStates {
  const factory FavoritesRoutesStatesError(final Exception exception) =
      _$FavoritesRoutesStatesError;

  Exception get exception;
  @JsonKey(ignore: true)
  _$$FavoritesRoutesStatesErrorCopyWith<_$FavoritesRoutesStatesError>
      get copyWith => throw _privateConstructorUsedError;
}
