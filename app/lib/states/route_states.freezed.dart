// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
abstract class _$$RSDataCopyWith<$Res> {
  factory _$$RSDataCopyWith(_$RSData value, $Res Function(_$RSData) then) =
      __$$RSDataCopyWithImpl<$Res>;
  @useResult
  $Res call({NavRoute routes});
}

/// @nodoc
class __$$RSDataCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res, _$RSData>
    implements _$$RSDataCopyWith<$Res> {
  __$$RSDataCopyWithImpl(_$RSData _value, $Res Function(_$RSData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
  }) {
    return _then(_$RSData(
      null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as NavRoute,
    ));
  }
}

/// @nodoc

class _$RSData implements RSData {
  const _$RSData(this.routes);

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
            other is _$RSData &&
            (identical(other.routes, routes) || other.routes == routes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, routes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RSDataCopyWith<_$RSData> get copyWith =>
      __$$RSDataCopyWithImpl<_$RSData>(this, _$identity);

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
  const factory RSData(final NavRoute routes) = _$RSData;

  NavRoute get routes;
  @JsonKey(ignore: true)
  _$$RSDataCopyWith<_$RSData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RSNetworkExceptionCopyWith<$Res> {
  factory _$$RSNetworkExceptionCopyWith(_$RSNetworkException value,
          $Res Function(_$RSNetworkException) then) =
      __$$RSNetworkExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RSNetworkExceptionCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res, _$RSNetworkException>
    implements _$$RSNetworkExceptionCopyWith<$Res> {
  __$$RSNetworkExceptionCopyWithImpl(
      _$RSNetworkException _value, $Res Function(_$RSNetworkException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RSNetworkException implements RSNetworkException {
  const _$RSNetworkException();

  @override
  String toString() {
    return 'RouteStates.networkException()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RSNetworkException);
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
  const factory RSNetworkException() = _$RSNetworkException;
}

/// @nodoc
abstract class _$$RSLocationPermissionNotGrantedCopyWith<$Res> {
  factory _$$RSLocationPermissionNotGrantedCopyWith(
          _$RSLocationPermissionNotGranted value,
          $Res Function(_$RSLocationPermissionNotGranted) then) =
      __$$RSLocationPermissionNotGrantedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RSLocationPermissionNotGrantedCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res, _$RSLocationPermissionNotGranted>
    implements _$$RSLocationPermissionNotGrantedCopyWith<$Res> {
  __$$RSLocationPermissionNotGrantedCopyWithImpl(
      _$RSLocationPermissionNotGranted _value,
      $Res Function(_$RSLocationPermissionNotGranted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RSLocationPermissionNotGranted
    implements RSLocationPermissionNotGranted {
  const _$RSLocationPermissionNotGranted();

  @override
  String toString() {
    return 'RouteStates.locationPermissionNotGranted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RSLocationPermissionNotGranted);
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
      _$RSLocationPermissionNotGranted;
}

/// @nodoc
abstract class _$$RSMissingPluginExceptionCopyWith<$Res> {
  factory _$$RSMissingPluginExceptionCopyWith(_$RSMissingPluginException value,
          $Res Function(_$RSMissingPluginException) then) =
      __$$RSMissingPluginExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RSMissingPluginExceptionCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res, _$RSMissingPluginException>
    implements _$$RSMissingPluginExceptionCopyWith<$Res> {
  __$$RSMissingPluginExceptionCopyWithImpl(_$RSMissingPluginException _value,
      $Res Function(_$RSMissingPluginException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RSMissingPluginException implements RSMissingPluginException {
  const _$RSMissingPluginException();

  @override
  String toString() {
    return 'RouteStates.missingPluginException()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RSMissingPluginException);
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
  const factory RSMissingPluginException() = _$RSMissingPluginException;
}

/// @nodoc
abstract class _$$RSExceptionCopyWith<$Res> {
  factory _$$RSExceptionCopyWith(
          _$RSException value, $Res Function(_$RSException) then) =
      __$$RSExceptionCopyWithImpl<$Res>;
  @useResult
  $Res call({Object exception});
}

/// @nodoc
class __$$RSExceptionCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res, _$RSException>
    implements _$$RSExceptionCopyWith<$Res> {
  __$$RSExceptionCopyWithImpl(
      _$RSException _value, $Res Function(_$RSException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$RSException(
      null == exception ? _value.exception : exception,
    ));
  }
}

/// @nodoc

class _$RSException implements RSException {
  const _$RSException(this.exception);

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
            other is _$RSException &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RSExceptionCopyWith<_$RSException> get copyWith =>
      __$$RSExceptionCopyWithImpl<_$RSException>(this, _$identity);

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
  const factory RSException(final Object exception) = _$RSException;

  Object get exception;
  @JsonKey(ignore: true)
  _$$RSExceptionCopyWith<_$RSException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RSEmptyCopyWith<$Res> {
  factory _$$RSEmptyCopyWith(_$RSEmpty value, $Res Function(_$RSEmpty) then) =
      __$$RSEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RSEmptyCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res, _$RSEmpty>
    implements _$$RSEmptyCopyWith<$Res> {
  __$$RSEmptyCopyWithImpl(_$RSEmpty _value, $Res Function(_$RSEmpty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RSEmpty implements RSEmpty {
  const _$RSEmpty();

  @override
  String toString() {
    return 'RouteStates.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RSEmpty);
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
  const factory RSEmpty() = _$RSEmpty;
}

/// @nodoc
abstract class _$$RSLoadingCopyWith<$Res> {
  factory _$$RSLoadingCopyWith(
          _$RSLoading value, $Res Function(_$RSLoading) then) =
      __$$RSLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RSLoadingCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res, _$RSLoading>
    implements _$$RSLoadingCopyWith<$Res> {
  __$$RSLoadingCopyWithImpl(
      _$RSLoading _value, $Res Function(_$RSLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RSLoading implements RSLoading {
  const _$RSLoading();

  @override
  String toString() {
    return 'RouteStates.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RSLoading);
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
  const factory RSLoading() = _$RSLoading;
}
