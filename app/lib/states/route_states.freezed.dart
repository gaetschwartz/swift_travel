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
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
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
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
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
      _$RouteStatesCopyWithImpl<$Res>;
}

/// @nodoc
class _$RouteStatesCopyWithImpl<$Res> implements $RouteStatesCopyWith<$Res> {
  _$RouteStatesCopyWithImpl(this._value, this._then);

  final RouteStates _value;
  // ignore: unused_field
  final $Res Function(RouteStates) _then;
}

/// @nodoc
abstract class $RSDataCopyWith<$Res> {
  factory $RSDataCopyWith(RSData value, $Res Function(RSData) then) =
      _$RSDataCopyWithImpl<$Res>;
  $Res call({NavRoute routes});
}

/// @nodoc
class _$RSDataCopyWithImpl<$Res> extends _$RouteStatesCopyWithImpl<$Res>
    implements $RSDataCopyWith<$Res> {
  _$RSDataCopyWithImpl(RSData _value, $Res Function(RSData) _then)
      : super(_value, (v) => _then(v as RSData));

  @override
  RSData get _value => super._value as RSData;

  @override
  $Res call({
    Object? routes = freezed,
  }) {
    return _then(RSData(
      routes == freezed
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
            other is RSData &&
            const DeepCollectionEquality().equals(other.routes, routes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(routes));

  @JsonKey(ignore: true)
  @override
  $RSDataCopyWith<RSData> get copyWith =>
      _$RSDataCopyWithImpl<RSData>(this, _$identity);

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
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
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
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
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

  NavRoute get routes => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RSDataCopyWith<RSData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RSNetworkExceptionCopyWith<$Res> {
  factory $RSNetworkExceptionCopyWith(
          RSNetworkException value, $Res Function(RSNetworkException) then) =
      _$RSNetworkExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$RSNetworkExceptionCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res>
    implements $RSNetworkExceptionCopyWith<$Res> {
  _$RSNetworkExceptionCopyWithImpl(
      RSNetworkException _value, $Res Function(RSNetworkException) _then)
      : super(_value, (v) => _then(v as RSNetworkException));

  @override
  RSNetworkException get _value => super._value as RSNetworkException;
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
        (other.runtimeType == runtimeType && other is RSNetworkException);
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
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
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
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
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
abstract class $RSLocationPermissionNotGrantedCopyWith<$Res> {
  factory $RSLocationPermissionNotGrantedCopyWith(
          RSLocationPermissionNotGranted value,
          $Res Function(RSLocationPermissionNotGranted) then) =
      _$RSLocationPermissionNotGrantedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RSLocationPermissionNotGrantedCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res>
    implements $RSLocationPermissionNotGrantedCopyWith<$Res> {
  _$RSLocationPermissionNotGrantedCopyWithImpl(
      RSLocationPermissionNotGranted _value,
      $Res Function(RSLocationPermissionNotGranted) _then)
      : super(_value, (v) => _then(v as RSLocationPermissionNotGranted));

  @override
  RSLocationPermissionNotGranted get _value =>
      super._value as RSLocationPermissionNotGranted;
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
            other is RSLocationPermissionNotGranted);
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
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
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
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
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
abstract class $RSMissingPluginExceptionCopyWith<$Res> {
  factory $RSMissingPluginExceptionCopyWith(RSMissingPluginException value,
          $Res Function(RSMissingPluginException) then) =
      _$RSMissingPluginExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$RSMissingPluginExceptionCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res>
    implements $RSMissingPluginExceptionCopyWith<$Res> {
  _$RSMissingPluginExceptionCopyWithImpl(RSMissingPluginException _value,
      $Res Function(RSMissingPluginException) _then)
      : super(_value, (v) => _then(v as RSMissingPluginException));

  @override
  RSMissingPluginException get _value =>
      super._value as RSMissingPluginException;
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
        (other.runtimeType == runtimeType && other is RSMissingPluginException);
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
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
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
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
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
abstract class $RSExceptionCopyWith<$Res> {
  factory $RSExceptionCopyWith(
          RSException value, $Res Function(RSException) then) =
      _$RSExceptionCopyWithImpl<$Res>;
  $Res call({Object exception});
}

/// @nodoc
class _$RSExceptionCopyWithImpl<$Res> extends _$RouteStatesCopyWithImpl<$Res>
    implements $RSExceptionCopyWith<$Res> {
  _$RSExceptionCopyWithImpl(
      RSException _value, $Res Function(RSException) _then)
      : super(_value, (v) => _then(v as RSException));

  @override
  RSException get _value => super._value as RSException;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(RSException(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Object,
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
            other is RSException &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  $RSExceptionCopyWith<RSException> get copyWith =>
      _$RSExceptionCopyWithImpl<RSException>(this, _$identity);

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
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
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
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
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

  Object get exception => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RSExceptionCopyWith<RSException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RSEmptyCopyWith<$Res> {
  factory $RSEmptyCopyWith(RSEmpty value, $Res Function(RSEmpty) then) =
      _$RSEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$RSEmptyCopyWithImpl<$Res> extends _$RouteStatesCopyWithImpl<$Res>
    implements $RSEmptyCopyWith<$Res> {
  _$RSEmptyCopyWithImpl(RSEmpty _value, $Res Function(RSEmpty) _then)
      : super(_value, (v) => _then(v as RSEmpty));

  @override
  RSEmpty get _value => super._value as RSEmpty;
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
        (other.runtimeType == runtimeType && other is RSEmpty);
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
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
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
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
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
abstract class $RSLoadingCopyWith<$Res> {
  factory $RSLoadingCopyWith(RSLoading value, $Res Function(RSLoading) then) =
      _$RSLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$RSLoadingCopyWithImpl<$Res> extends _$RouteStatesCopyWithImpl<$Res>
    implements $RSLoadingCopyWith<$Res> {
  _$RSLoadingCopyWithImpl(RSLoading _value, $Res Function(RSLoading) _then)
      : super(_value, (v) => _then(v as RSLoading));

  @override
  RSLoading get _value => super._value as RSLoading;
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
        (other.runtimeType == runtimeType && other is RSLoading);
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
    TResult Function(NavRoute routes)? $default, {
    TResult Function()? networkException,
    TResult Function()? locationPermissionNotGranted,
    TResult Function()? missingPluginException,
    TResult Function(Object exception)? exception,
    TResult Function()? empty,
    TResult Function()? loading,
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
    TResult Function(RSData value)? $default, {
    TResult Function(RSNetworkException value)? networkException,
    TResult Function(RSLocationPermissionNotGranted value)?
        locationPermissionNotGranted,
    TResult Function(RSMissingPluginException value)? missingPluginException,
    TResult Function(RSException value)? exception,
    TResult Function(RSEmpty value)? empty,
    TResult Function(RSLoading value)? loading,
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
