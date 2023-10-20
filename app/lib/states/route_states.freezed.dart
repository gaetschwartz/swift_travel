// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RouteStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(NavRoute routes) $default, {
    required TResult Function() networkException,
    required TResult Function() locationPermissionNotGranted,
    required TResult Function() missingPluginException,
    required TResult Function(Object exception) exception,
    required TResult Function() empty,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(NavRoute routes)? $default, {
    TResult? Function()? networkException,
    TResult? Function()? locationPermissionNotGranted,
    TResult? Function()? missingPluginException,
    TResult? Function(Object exception)? exception,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(RSData value) $default, {
    required TResult Function(RSNetworkException value) networkException,
    required TResult Function(RSLocationPermissionNotGranted value)
        locationPermissionNotGranted,
    required TResult Function(RSMissingPluginException value)
        missingPluginException,
    required TResult Function(RSException value) exception,
    required TResult Function(RSEmpty value) empty,
    required TResult Function(RSLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(RSData value)? $default, {
    TResult? Function(RSNetworkException value)? networkException,
    TResult? Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult? Function(RSMissingPluginException value)? missingPluginException,
    TResult? Function(RSException value)? exception,
    TResult? Function(RSEmpty value)? empty,
    TResult? Function(RSLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteStatesCopyWith<$Res> {
  factory $RouteStatesCopyWith(
          RouteStates value, $Res Function(RouteStates) then) =
      _$RouteStatesCopyWithImpl<$Res, RouteStates>;
}

/// @nodoc
class _$RouteStatesCopyWithImpl<$Res, $Val extends RouteStates>
    implements $RouteStatesCopyWith<$Res> {
  _$RouteStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RSDataImplCopyWith<$Res> {
  factory _$$RSDataImplCopyWith(
          _$RSDataImpl value, $Res Function(_$RSDataImpl) then) =
      __$$RSDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NavRoute routes});
}

/// @nodoc
class __$$RSDataImplCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res, _$RSDataImpl>
    implements _$$RSDataImplCopyWith<$Res> {
  __$$RSDataImplCopyWithImpl(
      _$RSDataImpl _value, $Res Function(_$RSDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
  }) {
    return _then(_$RSDataImpl(
      null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as NavRoute,
    ));
  }
}

/// @nodoc

class _$RSDataImpl implements RSData {
  const _$RSDataImpl(this.routes);

  @override
  final NavRoute routes;

  @override
  String toString() {
    return 'RouteStates(routes: $routes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RSDataImpl &&
            (identical(other.routes, routes) || other.routes == routes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, routes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RSDataImplCopyWith<_$RSDataImpl> get copyWith =>
      __$$RSDataImplCopyWithImpl<_$RSDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(NavRoute routes) $default, {
    required TResult Function() networkException,
    required TResult Function() locationPermissionNotGranted,
    required TResult Function() missingPluginException,
    required TResult Function(Object exception) exception,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return $default(routes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(NavRoute routes)? $default, {
    TResult? Function()? networkException,
    TResult? Function()? locationPermissionNotGranted,
    TResult? Function()? missingPluginException,
    TResult? Function(Object exception)? exception,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return $default?.call(routes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(routes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(RSData value) $default, {
    required TResult Function(RSNetworkException value) networkException,
    required TResult Function(RSLocationPermissionNotGranted value)
        locationPermissionNotGranted,
    required TResult Function(RSMissingPluginException value)
        missingPluginException,
    required TResult Function(RSException value) exception,
    required TResult Function(RSEmpty value) empty,
    required TResult Function(RSLoading value) loading,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(RSData value)? $default, {
    TResult? Function(RSNetworkException value)? networkException,
    TResult? Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult? Function(RSMissingPluginException value)? missingPluginException,
    TResult? Function(RSException value)? exception,
    TResult? Function(RSEmpty value)? empty,
    TResult? Function(RSLoading value)? loading,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class RSData implements RouteStates {
  const factory RSData(final NavRoute routes) = _$RSDataImpl;

  NavRoute get routes;
  @JsonKey(ignore: true)
  _$$RSDataImplCopyWith<_$RSDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RSNetworkExceptionImplCopyWith<$Res> {
  factory _$$RSNetworkExceptionImplCopyWith(_$RSNetworkExceptionImpl value,
          $Res Function(_$RSNetworkExceptionImpl) then) =
      __$$RSNetworkExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RSNetworkExceptionImplCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res, _$RSNetworkExceptionImpl>
    implements _$$RSNetworkExceptionImplCopyWith<$Res> {
  __$$RSNetworkExceptionImplCopyWithImpl(_$RSNetworkExceptionImpl _value,
      $Res Function(_$RSNetworkExceptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RSNetworkExceptionImpl implements RSNetworkException {
  const _$RSNetworkExceptionImpl();

  @override
  String toString() {
    return 'RouteStates.networkException()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RSNetworkExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(NavRoute routes) $default, {
    required TResult Function() networkException,
    required TResult Function() locationPermissionNotGranted,
    required TResult Function() missingPluginException,
    required TResult Function(Object exception) exception,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return networkException();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(NavRoute routes)? $default, {
    TResult? Function()? networkException,
    TResult? Function()? locationPermissionNotGranted,
    TResult? Function()? missingPluginException,
    TResult? Function(Object exception)? exception,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return networkException?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (networkException != null) {
      return networkException();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(RSData value) $default, {
    required TResult Function(RSNetworkException value) networkException,
    required TResult Function(RSLocationPermissionNotGranted value)
        locationPermissionNotGranted,
    required TResult Function(RSMissingPluginException value)
        missingPluginException,
    required TResult Function(RSException value) exception,
    required TResult Function(RSEmpty value) empty,
    required TResult Function(RSLoading value) loading,
  }) {
    return networkException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(RSData value)? $default, {
    TResult? Function(RSNetworkException value)? networkException,
    TResult? Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult? Function(RSMissingPluginException value)? missingPluginException,
    TResult? Function(RSException value)? exception,
    TResult? Function(RSEmpty value)? empty,
    TResult? Function(RSLoading value)? loading,
  }) {
    return networkException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
    required TResult orElse(),
  }) {
    if (networkException != null) {
      return networkException(this);
    }
    return orElse();
  }
}

abstract class RSNetworkException implements RouteStates {
  const factory RSNetworkException() = _$RSNetworkExceptionImpl;
}

/// @nodoc
abstract class _$$RSLocationPermissionNotGrantedImplCopyWith<$Res> {
  factory _$$RSLocationPermissionNotGrantedImplCopyWith(
          _$RSLocationPermissionNotGrantedImpl value,
          $Res Function(_$RSLocationPermissionNotGrantedImpl) then) =
      __$$RSLocationPermissionNotGrantedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RSLocationPermissionNotGrantedImplCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res,
        _$RSLocationPermissionNotGrantedImpl>
    implements _$$RSLocationPermissionNotGrantedImplCopyWith<$Res> {
  __$$RSLocationPermissionNotGrantedImplCopyWithImpl(
      _$RSLocationPermissionNotGrantedImpl _value,
      $Res Function(_$RSLocationPermissionNotGrantedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RSLocationPermissionNotGrantedImpl
    implements RSLocationPermissionNotGranted {
  const _$RSLocationPermissionNotGrantedImpl();

  @override
  String toString() {
    return 'RouteStates.locationPermissionNotGranted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RSLocationPermissionNotGrantedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(NavRoute routes) $default, {
    required TResult Function() networkException,
    required TResult Function() locationPermissionNotGranted,
    required TResult Function() missingPluginException,
    required TResult Function(Object exception) exception,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return locationPermissionNotGranted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(NavRoute routes)? $default, {
    TResult? Function()? networkException,
    TResult? Function()? locationPermissionNotGranted,
    TResult? Function()? missingPluginException,
    TResult? Function(Object exception)? exception,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return locationPermissionNotGranted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (locationPermissionNotGranted != null) {
      return locationPermissionNotGranted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(RSData value) $default, {
    required TResult Function(RSNetworkException value) networkException,
    required TResult Function(RSLocationPermissionNotGranted value)
        locationPermissionNotGranted,
    required TResult Function(RSMissingPluginException value)
        missingPluginException,
    required TResult Function(RSException value) exception,
    required TResult Function(RSEmpty value) empty,
    required TResult Function(RSLoading value) loading,
  }) {
    return locationPermissionNotGranted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(RSData value)? $default, {
    TResult? Function(RSNetworkException value)? networkException,
    TResult? Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult? Function(RSMissingPluginException value)? missingPluginException,
    TResult? Function(RSException value)? exception,
    TResult? Function(RSEmpty value)? empty,
    TResult? Function(RSLoading value)? loading,
  }) {
    return locationPermissionNotGranted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
    required TResult orElse(),
  }) {
    if (locationPermissionNotGranted != null) {
      return locationPermissionNotGranted(this);
    }
    return orElse();
  }
}

abstract class RSLocationPermissionNotGranted implements RouteStates {
  const factory RSLocationPermissionNotGranted() =
      _$RSLocationPermissionNotGrantedImpl;
}

/// @nodoc
abstract class _$$RSMissingPluginExceptionImplCopyWith<$Res> {
  factory _$$RSMissingPluginExceptionImplCopyWith(
          _$RSMissingPluginExceptionImpl value,
          $Res Function(_$RSMissingPluginExceptionImpl) then) =
      __$$RSMissingPluginExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RSMissingPluginExceptionImplCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res, _$RSMissingPluginExceptionImpl>
    implements _$$RSMissingPluginExceptionImplCopyWith<$Res> {
  __$$RSMissingPluginExceptionImplCopyWithImpl(
      _$RSMissingPluginExceptionImpl _value,
      $Res Function(_$RSMissingPluginExceptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RSMissingPluginExceptionImpl implements RSMissingPluginException {
  const _$RSMissingPluginExceptionImpl();

  @override
  String toString() {
    return 'RouteStates.missingPluginException()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RSMissingPluginExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(NavRoute routes) $default, {
    required TResult Function() networkException,
    required TResult Function() locationPermissionNotGranted,
    required TResult Function() missingPluginException,
    required TResult Function(Object exception) exception,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return missingPluginException();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(NavRoute routes)? $default, {
    TResult? Function()? networkException,
    TResult? Function()? locationPermissionNotGranted,
    TResult? Function()? missingPluginException,
    TResult? Function(Object exception)? exception,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return missingPluginException?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (missingPluginException != null) {
      return missingPluginException();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(RSData value) $default, {
    required TResult Function(RSNetworkException value) networkException,
    required TResult Function(RSLocationPermissionNotGranted value)
        locationPermissionNotGranted,
    required TResult Function(RSMissingPluginException value)
        missingPluginException,
    required TResult Function(RSException value) exception,
    required TResult Function(RSEmpty value) empty,
    required TResult Function(RSLoading value) loading,
  }) {
    return missingPluginException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(RSData value)? $default, {
    TResult? Function(RSNetworkException value)? networkException,
    TResult? Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult? Function(RSMissingPluginException value)? missingPluginException,
    TResult? Function(RSException value)? exception,
    TResult? Function(RSEmpty value)? empty,
    TResult? Function(RSLoading value)? loading,
  }) {
    return missingPluginException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
    required TResult orElse(),
  }) {
    if (missingPluginException != null) {
      return missingPluginException(this);
    }
    return orElse();
  }
}

abstract class RSMissingPluginException implements RouteStates {
  const factory RSMissingPluginException() = _$RSMissingPluginExceptionImpl;
}

/// @nodoc
abstract class _$$RSExceptionImplCopyWith<$Res> {
  factory _$$RSExceptionImplCopyWith(
          _$RSExceptionImpl value, $Res Function(_$RSExceptionImpl) then) =
      __$$RSExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object exception});
}

/// @nodoc
class __$$RSExceptionImplCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res, _$RSExceptionImpl>
    implements _$$RSExceptionImplCopyWith<$Res> {
  __$$RSExceptionImplCopyWithImpl(
      _$RSExceptionImpl _value, $Res Function(_$RSExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$RSExceptionImpl(
      null == exception ? _value.exception : exception,
    ));
  }
}

/// @nodoc

class _$RSExceptionImpl implements RSException {
  const _$RSExceptionImpl(this.exception);

  @override
  final Object exception;

  @override
  String toString() {
    return 'RouteStates.exception(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RSExceptionImpl &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RSExceptionImplCopyWith<_$RSExceptionImpl> get copyWith =>
      __$$RSExceptionImplCopyWithImpl<_$RSExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(NavRoute routes) $default, {
    required TResult Function() networkException,
    required TResult Function() locationPermissionNotGranted,
    required TResult Function() missingPluginException,
    required TResult Function(Object exception) exception,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return exception(this.exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(NavRoute routes)? $default, {
    TResult? Function()? networkException,
    TResult? Function()? locationPermissionNotGranted,
    TResult? Function()? missingPluginException,
    TResult? Function(Object exception)? exception,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return exception?.call(this.exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this.exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(RSData value) $default, {
    required TResult Function(RSNetworkException value) networkException,
    required TResult Function(RSLocationPermissionNotGranted value)
        locationPermissionNotGranted,
    required TResult Function(RSMissingPluginException value)
        missingPluginException,
    required TResult Function(RSException value) exception,
    required TResult Function(RSEmpty value) empty,
    required TResult Function(RSLoading value) loading,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(RSData value)? $default, {
    TResult? Function(RSNetworkException value)? networkException,
    TResult? Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult? Function(RSMissingPluginException value)? missingPluginException,
    TResult? Function(RSException value)? exception,
    TResult? Function(RSEmpty value)? empty,
    TResult? Function(RSLoading value)? loading,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class RSException implements RouteStates {
  const factory RSException(final Object exception) = _$RSExceptionImpl;

  Object get exception;
  @JsonKey(ignore: true)
  _$$RSExceptionImplCopyWith<_$RSExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RSEmptyImplCopyWith<$Res> {
  factory _$$RSEmptyImplCopyWith(
          _$RSEmptyImpl value, $Res Function(_$RSEmptyImpl) then) =
      __$$RSEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RSEmptyImplCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res, _$RSEmptyImpl>
    implements _$$RSEmptyImplCopyWith<$Res> {
  __$$RSEmptyImplCopyWithImpl(
      _$RSEmptyImpl _value, $Res Function(_$RSEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RSEmptyImpl implements RSEmpty {
  const _$RSEmptyImpl();

  @override
  String toString() {
    return 'RouteStates.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RSEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(NavRoute routes) $default, {
    required TResult Function() networkException,
    required TResult Function() locationPermissionNotGranted,
    required TResult Function() missingPluginException,
    required TResult Function(Object exception) exception,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(NavRoute routes)? $default, {
    TResult? Function()? networkException,
    TResult? Function()? locationPermissionNotGranted,
    TResult? Function()? missingPluginException,
    TResult? Function(Object exception)? exception,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(RSData value) $default, {
    required TResult Function(RSNetworkException value) networkException,
    required TResult Function(RSLocationPermissionNotGranted value)
        locationPermissionNotGranted,
    required TResult Function(RSMissingPluginException value)
        missingPluginException,
    required TResult Function(RSException value) exception,
    required TResult Function(RSEmpty value) empty,
    required TResult Function(RSLoading value) loading,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(RSData value)? $default, {
    TResult? Function(RSNetworkException value)? networkException,
    TResult? Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult? Function(RSMissingPluginException value)? missingPluginException,
    TResult? Function(RSException value)? exception,
    TResult? Function(RSEmpty value)? empty,
    TResult? Function(RSLoading value)? loading,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class RSEmpty implements RouteStates {
  const factory RSEmpty() = _$RSEmptyImpl;
}

/// @nodoc
abstract class _$$RSLoadingImplCopyWith<$Res> {
  factory _$$RSLoadingImplCopyWith(
          _$RSLoadingImpl value, $Res Function(_$RSLoadingImpl) then) =
      __$$RSLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RSLoadingImplCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res, _$RSLoadingImpl>
    implements _$$RSLoadingImplCopyWith<$Res> {
  __$$RSLoadingImplCopyWithImpl(
      _$RSLoadingImpl _value, $Res Function(_$RSLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RSLoadingImpl implements RSLoading {
  const _$RSLoadingImpl();

  @override
  String toString() {
    return 'RouteStates.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RSLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(NavRoute routes) $default, {
    required TResult Function() networkException,
    required TResult Function() locationPermissionNotGranted,
    required TResult Function() missingPluginException,
    required TResult Function(Object exception) exception,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(NavRoute routes)? $default, {
    TResult? Function()? networkException,
    TResult? Function()? locationPermissionNotGranted,
    TResult? Function()? missingPluginException,
    TResult? Function(Object exception)? exception,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(RSData value) $default, {
    required TResult Function(RSNetworkException value) networkException,
    required TResult Function(RSLocationPermissionNotGranted value)
        locationPermissionNotGranted,
    required TResult Function(RSMissingPluginException value)
        missingPluginException,
    required TResult Function(RSException value) exception,
    required TResult Function(RSEmpty value) empty,
    required TResult Function(RSLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(RSData value)? $default, {
    TResult? Function(RSNetworkException value)? networkException,
    TResult? Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult? Function(RSMissingPluginException value)? missingPluginException,
    TResult? Function(RSException value)? exception,
    TResult? Function(RSEmpty value)? empty,
    TResult? Function(RSLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RSLoading implements RouteStates {
  const factory RSLoading() = _$RSLoadingImpl;
}
