// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'route_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RouteStatesTearOff {
  const _$RouteStatesTearOff();

// ignore: unused_element
  RSData routes(CffRoute routes) {
    return RSData(
      routes,
    );
  }

// ignore: unused_element
  RSNetworkException networkException() {
    return const RSNetworkException();
  }

// ignore: unused_element
  RSLocationPermissionNotGranted locationPermissionNotGranted() {
    return const RSLocationPermissionNotGranted();
  }

// ignore: unused_element
  RSMissingPluginException missingPluginException() {
    return const RSMissingPluginException();
  }

// ignore: unused_element
  RSException exception(Object exception) {
    return RSException(
      exception,
    );
  }

// ignore: unused_element
  RSEmpty empty() {
    return const RSEmpty();
  }

// ignore: unused_element
  RSLoading loading() {
    return const RSLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $RouteStates = _$RouteStatesTearOff();

/// @nodoc
mixin _$RouteStates {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult routes(CffRoute routes),
    @required TResult networkException(),
    @required TResult locationPermissionNotGranted(),
    @required TResult missingPluginException(),
    @required TResult exception(Object exception),
    @required TResult empty(),
    @required TResult loading(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult routes(CffRoute routes),
    TResult networkException(),
    TResult locationPermissionNotGranted(),
    TResult missingPluginException(),
    TResult exception(Object exception),
    TResult empty(),
    TResult loading(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult routes(RSData value),
    @required TResult networkException(RSNetworkException value),
    @required
        TResult locationPermissionNotGranted(
            RSLocationPermissionNotGranted value),
    @required TResult missingPluginException(RSMissingPluginException value),
    @required TResult exception(RSException value),
    @required TResult empty(RSEmpty value),
    @required TResult loading(RSLoading value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult routes(RSData value),
    TResult networkException(RSNetworkException value),
    TResult locationPermissionNotGranted(RSLocationPermissionNotGranted value),
    TResult missingPluginException(RSMissingPluginException value),
    TResult exception(RSException value),
    TResult empty(RSEmpty value),
    TResult loading(RSLoading value),
    @required TResult orElse(),
  });
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
  $Res call({CffRoute routes});

  $CffRouteCopyWith<$Res> get routes;
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
    Object routes = freezed,
  }) {
    return _then(RSData(
      routes == freezed ? _value.routes : routes as CffRoute,
    ));
  }

  @override
  $CffRouteCopyWith<$Res> get routes {
    if (_value.routes == null) {
      return null;
    }
    return $CffRouteCopyWith<$Res>(_value.routes, (value) {
      return _then(_value.copyWith(routes: value));
    });
  }
}

/// @nodoc
class _$RSData implements RSData {
  const _$RSData(this.routes) : assert(routes != null);

  @override
  final CffRoute routes;

  @override
  String toString() {
    return 'RouteStates.routes(routes: $routes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RSData &&
            (identical(other.routes, routes) ||
                const DeepCollectionEquality().equals(other.routes, routes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(routes);

  @JsonKey(ignore: true)
  @override
  $RSDataCopyWith<RSData> get copyWith =>
      _$RSDataCopyWithImpl<RSData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult routes(CffRoute routes),
    @required TResult networkException(),
    @required TResult locationPermissionNotGranted(),
    @required TResult missingPluginException(),
    @required TResult exception(Object exception),
    @required TResult empty(),
    @required TResult loading(),
  }) {
    assert(routes != null);
    assert(networkException != null);
    assert(locationPermissionNotGranted != null);
    assert(missingPluginException != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return routes(this.routes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult routes(CffRoute routes),
    TResult networkException(),
    TResult locationPermissionNotGranted(),
    TResult missingPluginException(),
    TResult exception(Object exception),
    TResult empty(),
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (routes != null) {
      return routes(this.routes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult routes(RSData value),
    @required TResult networkException(RSNetworkException value),
    @required
        TResult locationPermissionNotGranted(
            RSLocationPermissionNotGranted value),
    @required TResult missingPluginException(RSMissingPluginException value),
    @required TResult exception(RSException value),
    @required TResult empty(RSEmpty value),
    @required TResult loading(RSLoading value),
  }) {
    assert(routes != null);
    assert(networkException != null);
    assert(locationPermissionNotGranted != null);
    assert(missingPluginException != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return routes(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult routes(RSData value),
    TResult networkException(RSNetworkException value),
    TResult locationPermissionNotGranted(RSLocationPermissionNotGranted value),
    TResult missingPluginException(RSMissingPluginException value),
    TResult exception(RSException value),
    TResult empty(RSEmpty value),
    TResult loading(RSLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (routes != null) {
      return routes(this);
    }
    return orElse();
  }
}

abstract class RSData implements RouteStates {
  const factory RSData(CffRoute routes) = _$RSData;

  CffRoute get routes;
  @JsonKey(ignore: true)
  $RSDataCopyWith<RSData> get copyWith;
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
    return identical(this, other) || (other is RSNetworkException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult routes(CffRoute routes),
    @required TResult networkException(),
    @required TResult locationPermissionNotGranted(),
    @required TResult missingPluginException(),
    @required TResult exception(Object exception),
    @required TResult empty(),
    @required TResult loading(),
  }) {
    assert(routes != null);
    assert(networkException != null);
    assert(locationPermissionNotGranted != null);
    assert(missingPluginException != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return networkException();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult routes(CffRoute routes),
    TResult networkException(),
    TResult locationPermissionNotGranted(),
    TResult missingPluginException(),
    TResult exception(Object exception),
    TResult empty(),
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (networkException != null) {
      return networkException();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult routes(RSData value),
    @required TResult networkException(RSNetworkException value),
    @required
        TResult locationPermissionNotGranted(
            RSLocationPermissionNotGranted value),
    @required TResult missingPluginException(RSMissingPluginException value),
    @required TResult exception(RSException value),
    @required TResult empty(RSEmpty value),
    @required TResult loading(RSLoading value),
  }) {
    assert(routes != null);
    assert(networkException != null);
    assert(locationPermissionNotGranted != null);
    assert(missingPluginException != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return networkException(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult routes(RSData value),
    TResult networkException(RSNetworkException value),
    TResult locationPermissionNotGranted(RSLocationPermissionNotGranted value),
    TResult missingPluginException(RSMissingPluginException value),
    TResult exception(RSException value),
    TResult empty(RSEmpty value),
    TResult loading(RSLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
    return identical(this, other) || (other is RSLocationPermissionNotGranted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult routes(CffRoute routes),
    @required TResult networkException(),
    @required TResult locationPermissionNotGranted(),
    @required TResult missingPluginException(),
    @required TResult exception(Object exception),
    @required TResult empty(),
    @required TResult loading(),
  }) {
    assert(routes != null);
    assert(networkException != null);
    assert(locationPermissionNotGranted != null);
    assert(missingPluginException != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return locationPermissionNotGranted();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult routes(CffRoute routes),
    TResult networkException(),
    TResult locationPermissionNotGranted(),
    TResult missingPluginException(),
    TResult exception(Object exception),
    TResult empty(),
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (locationPermissionNotGranted != null) {
      return locationPermissionNotGranted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult routes(RSData value),
    @required TResult networkException(RSNetworkException value),
    @required
        TResult locationPermissionNotGranted(
            RSLocationPermissionNotGranted value),
    @required TResult missingPluginException(RSMissingPluginException value),
    @required TResult exception(RSException value),
    @required TResult empty(RSEmpty value),
    @required TResult loading(RSLoading value),
  }) {
    assert(routes != null);
    assert(networkException != null);
    assert(locationPermissionNotGranted != null);
    assert(missingPluginException != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return locationPermissionNotGranted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult routes(RSData value),
    TResult networkException(RSNetworkException value),
    TResult locationPermissionNotGranted(RSLocationPermissionNotGranted value),
    TResult missingPluginException(RSMissingPluginException value),
    TResult exception(RSException value),
    TResult empty(RSEmpty value),
    TResult loading(RSLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
    return identical(this, other) || (other is RSMissingPluginException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult routes(CffRoute routes),
    @required TResult networkException(),
    @required TResult locationPermissionNotGranted(),
    @required TResult missingPluginException(),
    @required TResult exception(Object exception),
    @required TResult empty(),
    @required TResult loading(),
  }) {
    assert(routes != null);
    assert(networkException != null);
    assert(locationPermissionNotGranted != null);
    assert(missingPluginException != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return missingPluginException();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult routes(CffRoute routes),
    TResult networkException(),
    TResult locationPermissionNotGranted(),
    TResult missingPluginException(),
    TResult exception(Object exception),
    TResult empty(),
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (missingPluginException != null) {
      return missingPluginException();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult routes(RSData value),
    @required TResult networkException(RSNetworkException value),
    @required
        TResult locationPermissionNotGranted(
            RSLocationPermissionNotGranted value),
    @required TResult missingPluginException(RSMissingPluginException value),
    @required TResult exception(RSException value),
    @required TResult empty(RSEmpty value),
    @required TResult loading(RSLoading value),
  }) {
    assert(routes != null);
    assert(networkException != null);
    assert(locationPermissionNotGranted != null);
    assert(missingPluginException != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return missingPluginException(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult routes(RSData value),
    TResult networkException(RSNetworkException value),
    TResult locationPermissionNotGranted(RSLocationPermissionNotGranted value),
    TResult missingPluginException(RSMissingPluginException value),
    TResult exception(RSException value),
    TResult empty(RSEmpty value),
    TResult loading(RSLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
    Object exception = freezed,
  }) {
    return _then(RSException(
      exception == freezed ? _value.exception : exception,
    ));
  }
}

/// @nodoc
class _$RSException implements RSException {
  const _$RSException(this.exception) : assert(exception != null);

  @override
  final Object exception;

  @override
  String toString() {
    return 'RouteStates.exception(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RSException &&
            (identical(other.exception, exception) ||
                const DeepCollectionEquality()
                    .equals(other.exception, exception)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exception);

  @JsonKey(ignore: true)
  @override
  $RSExceptionCopyWith<RSException> get copyWith =>
      _$RSExceptionCopyWithImpl<RSException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult routes(CffRoute routes),
    @required TResult networkException(),
    @required TResult locationPermissionNotGranted(),
    @required TResult missingPluginException(),
    @required TResult exception(Object exception),
    @required TResult empty(),
    @required TResult loading(),
  }) {
    assert(routes != null);
    assert(networkException != null);
    assert(locationPermissionNotGranted != null);
    assert(missingPluginException != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return exception(this.exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult routes(CffRoute routes),
    TResult networkException(),
    TResult locationPermissionNotGranted(),
    TResult missingPluginException(),
    TResult exception(Object exception),
    TResult empty(),
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (exception != null) {
      return exception(this.exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult routes(RSData value),
    @required TResult networkException(RSNetworkException value),
    @required
        TResult locationPermissionNotGranted(
            RSLocationPermissionNotGranted value),
    @required TResult missingPluginException(RSMissingPluginException value),
    @required TResult exception(RSException value),
    @required TResult empty(RSEmpty value),
    @required TResult loading(RSLoading value),
  }) {
    assert(routes != null);
    assert(networkException != null);
    assert(locationPermissionNotGranted != null);
    assert(missingPluginException != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult routes(RSData value),
    TResult networkException(RSNetworkException value),
    TResult locationPermissionNotGranted(RSLocationPermissionNotGranted value),
    TResult missingPluginException(RSMissingPluginException value),
    TResult exception(RSException value),
    TResult empty(RSEmpty value),
    TResult loading(RSLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class RSException implements RouteStates {
  const factory RSException(Object exception) = _$RSException;

  Object get exception;
  @JsonKey(ignore: true)
  $RSExceptionCopyWith<RSException> get copyWith;
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
    return identical(this, other) || (other is RSEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult routes(CffRoute routes),
    @required TResult networkException(),
    @required TResult locationPermissionNotGranted(),
    @required TResult missingPluginException(),
    @required TResult exception(Object exception),
    @required TResult empty(),
    @required TResult loading(),
  }) {
    assert(routes != null);
    assert(networkException != null);
    assert(locationPermissionNotGranted != null);
    assert(missingPluginException != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult routes(CffRoute routes),
    TResult networkException(),
    TResult locationPermissionNotGranted(),
    TResult missingPluginException(),
    TResult exception(Object exception),
    TResult empty(),
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult routes(RSData value),
    @required TResult networkException(RSNetworkException value),
    @required
        TResult locationPermissionNotGranted(
            RSLocationPermissionNotGranted value),
    @required TResult missingPluginException(RSMissingPluginException value),
    @required TResult exception(RSException value),
    @required TResult empty(RSEmpty value),
    @required TResult loading(RSLoading value),
  }) {
    assert(routes != null);
    assert(networkException != null);
    assert(locationPermissionNotGranted != null);
    assert(missingPluginException != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult routes(RSData value),
    TResult networkException(RSNetworkException value),
    TResult locationPermissionNotGranted(RSLocationPermissionNotGranted value),
    TResult missingPluginException(RSMissingPluginException value),
    TResult exception(RSException value),
    TResult empty(RSEmpty value),
    TResult loading(RSLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
    return identical(this, other) || (other is RSLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult routes(CffRoute routes),
    @required TResult networkException(),
    @required TResult locationPermissionNotGranted(),
    @required TResult missingPluginException(),
    @required TResult exception(Object exception),
    @required TResult empty(),
    @required TResult loading(),
  }) {
    assert(routes != null);
    assert(networkException != null);
    assert(locationPermissionNotGranted != null);
    assert(missingPluginException != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult routes(CffRoute routes),
    TResult networkException(),
    TResult locationPermissionNotGranted(),
    TResult missingPluginException(),
    TResult exception(Object exception),
    TResult empty(),
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult routes(RSData value),
    @required TResult networkException(RSNetworkException value),
    @required
        TResult locationPermissionNotGranted(
            RSLocationPermissionNotGranted value),
    @required TResult missingPluginException(RSMissingPluginException value),
    @required TResult exception(RSException value),
    @required TResult empty(RSEmpty value),
    @required TResult loading(RSLoading value),
  }) {
    assert(routes != null);
    assert(networkException != null);
    assert(locationPermissionNotGranted != null);
    assert(missingPluginException != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult routes(RSData value),
    TResult networkException(RSNetworkException value),
    TResult locationPermissionNotGranted(RSLocationPermissionNotGranted value),
    TResult missingPluginException(RSMissingPluginException value),
    TResult exception(RSException value),
    TResult empty(RSEmpty value),
    TResult loading(RSLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RSLoading implements RouteStates {
  const factory RSLoading() = _$RSLoading;
}
