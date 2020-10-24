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
  RouteStatesData routes(CffRoute routes) {
    return RouteStatesData(
      routes,
    );
  }

// ignore: unused_element
  RouteStatesNetwork network() {
    return const RouteStatesNetwork();
  }

// ignore: unused_element
  RouteStatesException exception(Object exception) {
    return RouteStatesException(
      exception,
    );
  }

// ignore: unused_element
  RouteStatesEmpty empty() {
    return const RouteStatesEmpty();
  }

// ignore: unused_element
  RouteStatesLoading loading() {
    return const RouteStatesLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $RouteStates = _$RouteStatesTearOff();

/// @nodoc
mixin _$RouteStates {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result routes(CffRoute routes),
    @required Result network(),
    @required Result exception(Object exception),
    @required Result empty(),
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result routes(CffRoute routes),
    Result network(),
    Result exception(Object exception),
    Result empty(),
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result routes(RouteStatesData value),
    @required Result network(RouteStatesNetwork value),
    @required Result exception(RouteStatesException value),
    @required Result empty(RouteStatesEmpty value),
    @required Result loading(RouteStatesLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result routes(RouteStatesData value),
    Result network(RouteStatesNetwork value),
    Result exception(RouteStatesException value),
    Result empty(RouteStatesEmpty value),
    Result loading(RouteStatesLoading value),
    @required Result orElse(),
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
abstract class $RouteStatesDataCopyWith<$Res> {
  factory $RouteStatesDataCopyWith(
          RouteStatesData value, $Res Function(RouteStatesData) then) =
      _$RouteStatesDataCopyWithImpl<$Res>;
  $Res call({CffRoute routes});

  $CffRouteCopyWith<$Res> get routes;
}

/// @nodoc
class _$RouteStatesDataCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res>
    implements $RouteStatesDataCopyWith<$Res> {
  _$RouteStatesDataCopyWithImpl(
      RouteStatesData _value, $Res Function(RouteStatesData) _then)
      : super(_value, (v) => _then(v as RouteStatesData));

  @override
  RouteStatesData get _value => super._value as RouteStatesData;

  @override
  $Res call({
    Object routes = freezed,
  }) {
    return _then(RouteStatesData(
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
class _$RouteStatesData implements RouteStatesData {
  const _$RouteStatesData(this.routes) : assert(routes != null);

  @override
  final CffRoute routes;

  @override
  String toString() {
    return 'RouteStates.routes(routes: $routes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RouteStatesData &&
            (identical(other.routes, routes) ||
                const DeepCollectionEquality().equals(other.routes, routes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(routes);

  @override
  $RouteStatesDataCopyWith<RouteStatesData> get copyWith =>
      _$RouteStatesDataCopyWithImpl<RouteStatesData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result routes(CffRoute routes),
    @required Result network(),
    @required Result exception(Object exception),
    @required Result empty(),
    @required Result loading(),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return routes(this.routes);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result routes(CffRoute routes),
    Result network(),
    Result exception(Object exception),
    Result empty(),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (routes != null) {
      return routes(this.routes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result routes(RouteStatesData value),
    @required Result network(RouteStatesNetwork value),
    @required Result exception(RouteStatesException value),
    @required Result empty(RouteStatesEmpty value),
    @required Result loading(RouteStatesLoading value),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return routes(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result routes(RouteStatesData value),
    Result network(RouteStatesNetwork value),
    Result exception(RouteStatesException value),
    Result empty(RouteStatesEmpty value),
    Result loading(RouteStatesLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (routes != null) {
      return routes(this);
    }
    return orElse();
  }
}

abstract class RouteStatesData implements RouteStates {
  const factory RouteStatesData(CffRoute routes) = _$RouteStatesData;

  CffRoute get routes;
  $RouteStatesDataCopyWith<RouteStatesData> get copyWith;
}

/// @nodoc
abstract class $RouteStatesNetworkCopyWith<$Res> {
  factory $RouteStatesNetworkCopyWith(
          RouteStatesNetwork value, $Res Function(RouteStatesNetwork) then) =
      _$RouteStatesNetworkCopyWithImpl<$Res>;
}

/// @nodoc
class _$RouteStatesNetworkCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res>
    implements $RouteStatesNetworkCopyWith<$Res> {
  _$RouteStatesNetworkCopyWithImpl(
      RouteStatesNetwork _value, $Res Function(RouteStatesNetwork) _then)
      : super(_value, (v) => _then(v as RouteStatesNetwork));

  @override
  RouteStatesNetwork get _value => super._value as RouteStatesNetwork;
}

/// @nodoc
class _$RouteStatesNetwork implements RouteStatesNetwork {
  const _$RouteStatesNetwork();

  @override
  String toString() {
    return 'RouteStates.network()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RouteStatesNetwork);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result routes(CffRoute routes),
    @required Result network(),
    @required Result exception(Object exception),
    @required Result empty(),
    @required Result loading(),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return network();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result routes(CffRoute routes),
    Result network(),
    Result exception(Object exception),
    Result empty(),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (network != null) {
      return network();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result routes(RouteStatesData value),
    @required Result network(RouteStatesNetwork value),
    @required Result exception(RouteStatesException value),
    @required Result empty(RouteStatesEmpty value),
    @required Result loading(RouteStatesLoading value),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return network(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result routes(RouteStatesData value),
    Result network(RouteStatesNetwork value),
    Result exception(RouteStatesException value),
    Result empty(RouteStatesEmpty value),
    Result loading(RouteStatesLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class RouteStatesNetwork implements RouteStates {
  const factory RouteStatesNetwork() = _$RouteStatesNetwork;
}

/// @nodoc
abstract class $RouteStatesExceptionCopyWith<$Res> {
  factory $RouteStatesExceptionCopyWith(RouteStatesException value,
          $Res Function(RouteStatesException) then) =
      _$RouteStatesExceptionCopyWithImpl<$Res>;
  $Res call({Object exception});
}

/// @nodoc
class _$RouteStatesExceptionCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res>
    implements $RouteStatesExceptionCopyWith<$Res> {
  _$RouteStatesExceptionCopyWithImpl(
      RouteStatesException _value, $Res Function(RouteStatesException) _then)
      : super(_value, (v) => _then(v as RouteStatesException));

  @override
  RouteStatesException get _value => super._value as RouteStatesException;

  @override
  $Res call({
    Object exception = freezed,
  }) {
    return _then(RouteStatesException(
      exception == freezed ? _value.exception : exception,
    ));
  }
}

/// @nodoc
class _$RouteStatesException implements RouteStatesException {
  const _$RouteStatesException(this.exception) : assert(exception != null);

  @override
  final Object exception;

  @override
  String toString() {
    return 'RouteStates.exception(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RouteStatesException &&
            (identical(other.exception, exception) ||
                const DeepCollectionEquality()
                    .equals(other.exception, exception)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exception);

  @override
  $RouteStatesExceptionCopyWith<RouteStatesException> get copyWith =>
      _$RouteStatesExceptionCopyWithImpl<RouteStatesException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result routes(CffRoute routes),
    @required Result network(),
    @required Result exception(Object exception),
    @required Result empty(),
    @required Result loading(),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return exception(this.exception);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result routes(CffRoute routes),
    Result network(),
    Result exception(Object exception),
    Result empty(),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (exception != null) {
      return exception(this.exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result routes(RouteStatesData value),
    @required Result network(RouteStatesNetwork value),
    @required Result exception(RouteStatesException value),
    @required Result empty(RouteStatesEmpty value),
    @required Result loading(RouteStatesLoading value),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return exception(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result routes(RouteStatesData value),
    Result network(RouteStatesNetwork value),
    Result exception(RouteStatesException value),
    Result empty(RouteStatesEmpty value),
    Result loading(RouteStatesLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class RouteStatesException implements RouteStates {
  const factory RouteStatesException(Object exception) = _$RouteStatesException;

  Object get exception;
  $RouteStatesExceptionCopyWith<RouteStatesException> get copyWith;
}

/// @nodoc
abstract class $RouteStatesEmptyCopyWith<$Res> {
  factory $RouteStatesEmptyCopyWith(
          RouteStatesEmpty value, $Res Function(RouteStatesEmpty) then) =
      _$RouteStatesEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$RouteStatesEmptyCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res>
    implements $RouteStatesEmptyCopyWith<$Res> {
  _$RouteStatesEmptyCopyWithImpl(
      RouteStatesEmpty _value, $Res Function(RouteStatesEmpty) _then)
      : super(_value, (v) => _then(v as RouteStatesEmpty));

  @override
  RouteStatesEmpty get _value => super._value as RouteStatesEmpty;
}

/// @nodoc
class _$RouteStatesEmpty implements RouteStatesEmpty {
  const _$RouteStatesEmpty();

  @override
  String toString() {
    return 'RouteStates.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RouteStatesEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result routes(CffRoute routes),
    @required Result network(),
    @required Result exception(Object exception),
    @required Result empty(),
    @required Result loading(),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return empty();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result routes(CffRoute routes),
    Result network(),
    Result exception(Object exception),
    Result empty(),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result routes(RouteStatesData value),
    @required Result network(RouteStatesNetwork value),
    @required Result exception(RouteStatesException value),
    @required Result empty(RouteStatesEmpty value),
    @required Result loading(RouteStatesLoading value),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result routes(RouteStatesData value),
    Result network(RouteStatesNetwork value),
    Result exception(RouteStatesException value),
    Result empty(RouteStatesEmpty value),
    Result loading(RouteStatesLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class RouteStatesEmpty implements RouteStates {
  const factory RouteStatesEmpty() = _$RouteStatesEmpty;
}

/// @nodoc
abstract class $RouteStatesLoadingCopyWith<$Res> {
  factory $RouteStatesLoadingCopyWith(
          RouteStatesLoading value, $Res Function(RouteStatesLoading) then) =
      _$RouteStatesLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$RouteStatesLoadingCopyWithImpl<$Res>
    extends _$RouteStatesCopyWithImpl<$Res>
    implements $RouteStatesLoadingCopyWith<$Res> {
  _$RouteStatesLoadingCopyWithImpl(
      RouteStatesLoading _value, $Res Function(RouteStatesLoading) _then)
      : super(_value, (v) => _then(v as RouteStatesLoading));

  @override
  RouteStatesLoading get _value => super._value as RouteStatesLoading;
}

/// @nodoc
class _$RouteStatesLoading implements RouteStatesLoading {
  const _$RouteStatesLoading();

  @override
  String toString() {
    return 'RouteStates.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RouteStatesLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result routes(CffRoute routes),
    @required Result network(),
    @required Result exception(Object exception),
    @required Result empty(),
    @required Result loading(),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result routes(CffRoute routes),
    Result network(),
    Result exception(Object exception),
    Result empty(),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result routes(RouteStatesData value),
    @required Result network(RouteStatesNetwork value),
    @required Result exception(RouteStatesException value),
    @required Result empty(RouteStatesEmpty value),
    @required Result loading(RouteStatesLoading value),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(exception != null);
    assert(empty != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result routes(RouteStatesData value),
    Result network(RouteStatesNetwork value),
    Result exception(RouteStatesException value),
    Result empty(RouteStatesEmpty value),
    Result loading(RouteStatesLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RouteStatesLoading implements RouteStates {
  const factory RouteStatesLoading() = _$RouteStatesLoading;
}
