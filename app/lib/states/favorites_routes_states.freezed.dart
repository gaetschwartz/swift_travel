// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    TResult? Function(List<LocalRoute> routes)? data,
    TResult? Function()? loading,
    TResult? Function(Exception exception)? exception,
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
    TResult? Function(FavoritesRoutesStatesData value)? data,
    TResult? Function(FavoritesRoutesStatesLoading value)? loading,
    TResult? Function(FavoritesRoutesStatesError value)? exception,
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
      _$FavoritesRoutesStatesCopyWithImpl<$Res, FavoritesRoutesStates>;
}

/// @nodoc
class _$FavoritesRoutesStatesCopyWithImpl<$Res,
        $Val extends FavoritesRoutesStates>
    implements $FavoritesRoutesStatesCopyWith<$Res> {
  _$FavoritesRoutesStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FavoritesRoutesStatesDataImplCopyWith<$Res> {
  factory _$$FavoritesRoutesStatesDataImplCopyWith(
          _$FavoritesRoutesStatesDataImpl value,
          $Res Function(_$FavoritesRoutesStatesDataImpl) then) =
      __$$FavoritesRoutesStatesDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<LocalRoute> routes});
}

/// @nodoc
class __$$FavoritesRoutesStatesDataImplCopyWithImpl<$Res>
    extends _$FavoritesRoutesStatesCopyWithImpl<$Res,
        _$FavoritesRoutesStatesDataImpl>
    implements _$$FavoritesRoutesStatesDataImplCopyWith<$Res> {
  __$$FavoritesRoutesStatesDataImplCopyWithImpl(
      _$FavoritesRoutesStatesDataImpl _value,
      $Res Function(_$FavoritesRoutesStatesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
  }) {
    return _then(_$FavoritesRoutesStatesDataImpl(
      null == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<LocalRoute>,
    ));
  }
}

/// @nodoc

class _$FavoritesRoutesStatesDataImpl implements FavoritesRoutesStatesData {
  const _$FavoritesRoutesStatesDataImpl(final List<LocalRoute> routes)
      : _routes = routes;

  final List<LocalRoute> _routes;
  @override
  List<LocalRoute> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
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
            other is _$FavoritesRoutesStatesDataImpl &&
            const DeepCollectionEquality().equals(other._routes, _routes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_routes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritesRoutesStatesDataImplCopyWith<_$FavoritesRoutesStatesDataImpl>
      get copyWith => __$$FavoritesRoutesStatesDataImplCopyWithImpl<
          _$FavoritesRoutesStatesDataImpl>(this, _$identity);

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
    TResult? Function(List<LocalRoute> routes)? data,
    TResult? Function()? loading,
    TResult? Function(Exception exception)? exception,
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
    TResult? Function(FavoritesRoutesStatesData value)? data,
    TResult? Function(FavoritesRoutesStatesLoading value)? loading,
    TResult? Function(FavoritesRoutesStatesError value)? exception,
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
      _$FavoritesRoutesStatesDataImpl;

  List<LocalRoute> get routes;
  @JsonKey(ignore: true)
  _$$FavoritesRoutesStatesDataImplCopyWith<_$FavoritesRoutesStatesDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoritesRoutesStatesLoadingImplCopyWith<$Res> {
  factory _$$FavoritesRoutesStatesLoadingImplCopyWith(
          _$FavoritesRoutesStatesLoadingImpl value,
          $Res Function(_$FavoritesRoutesStatesLoadingImpl) then) =
      __$$FavoritesRoutesStatesLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoritesRoutesStatesLoadingImplCopyWithImpl<$Res>
    extends _$FavoritesRoutesStatesCopyWithImpl<$Res,
        _$FavoritesRoutesStatesLoadingImpl>
    implements _$$FavoritesRoutesStatesLoadingImplCopyWith<$Res> {
  __$$FavoritesRoutesStatesLoadingImplCopyWithImpl(
      _$FavoritesRoutesStatesLoadingImpl _value,
      $Res Function(_$FavoritesRoutesStatesLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoritesRoutesStatesLoadingImpl
    implements FavoritesRoutesStatesLoading {
  const _$FavoritesRoutesStatesLoadingImpl();

  @override
  String toString() {
    return 'FavoritesRoutesStates.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesRoutesStatesLoadingImpl);
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
    TResult? Function(List<LocalRoute> routes)? data,
    TResult? Function()? loading,
    TResult? Function(Exception exception)? exception,
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
    TResult? Function(FavoritesRoutesStatesData value)? data,
    TResult? Function(FavoritesRoutesStatesLoading value)? loading,
    TResult? Function(FavoritesRoutesStatesError value)? exception,
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
  const factory FavoritesRoutesStatesLoading() =
      _$FavoritesRoutesStatesLoadingImpl;
}

/// @nodoc
abstract class _$$FavoritesRoutesStatesErrorImplCopyWith<$Res> {
  factory _$$FavoritesRoutesStatesErrorImplCopyWith(
          _$FavoritesRoutesStatesErrorImpl value,
          $Res Function(_$FavoritesRoutesStatesErrorImpl) then) =
      __$$FavoritesRoutesStatesErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception exception});
}

/// @nodoc
class __$$FavoritesRoutesStatesErrorImplCopyWithImpl<$Res>
    extends _$FavoritesRoutesStatesCopyWithImpl<$Res,
        _$FavoritesRoutesStatesErrorImpl>
    implements _$$FavoritesRoutesStatesErrorImplCopyWith<$Res> {
  __$$FavoritesRoutesStatesErrorImplCopyWithImpl(
      _$FavoritesRoutesStatesErrorImpl _value,
      $Res Function(_$FavoritesRoutesStatesErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$FavoritesRoutesStatesErrorImpl(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$FavoritesRoutesStatesErrorImpl implements FavoritesRoutesStatesError {
  const _$FavoritesRoutesStatesErrorImpl(this.exception);

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
            other is _$FavoritesRoutesStatesErrorImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritesRoutesStatesErrorImplCopyWith<_$FavoritesRoutesStatesErrorImpl>
      get copyWith => __$$FavoritesRoutesStatesErrorImplCopyWithImpl<
          _$FavoritesRoutesStatesErrorImpl>(this, _$identity);

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
    TResult? Function(List<LocalRoute> routes)? data,
    TResult? Function()? loading,
    TResult? Function(Exception exception)? exception,
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
    TResult? Function(FavoritesRoutesStatesData value)? data,
    TResult? Function(FavoritesRoutesStatesLoading value)? loading,
    TResult? Function(FavoritesRoutesStatesError value)? exception,
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
      _$FavoritesRoutesStatesErrorImpl;

  Exception get exception;
  @JsonKey(ignore: true)
  _$$FavoritesRoutesStatesErrorImplCopyWith<_$FavoritesRoutesStatesErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
