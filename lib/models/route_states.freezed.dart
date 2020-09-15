// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'route_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RouteStatesTearOff {
  const _$RouteStatesTearOff();

// ignore: unused_element
  Data routes(CffRoute routes) {
    return Data(
      routes,
    );
  }

// ignore: unused_element
  Network network() {
    return const Network();
  }

// ignore: unused_element
  Error error(Object error) {
    return Error(
      error,
    );
  }

// ignore: unused_element
  Empty empty() {
    return const Empty();
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }
}

// ignore: unused_element
const $RouteStates = _$RouteStatesTearOff();

mixin _$RouteStates {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result routes(CffRoute routes),
    @required Result network(),
    @required Result error(Object error),
    @required Result empty(),
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result routes(CffRoute routes),
    Result network(),
    Result error(Object error),
    Result empty(),
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result routes(Data value),
    @required Result network(Network value),
    @required Result error(Error value),
    @required Result empty(Empty value),
    @required Result loading(Loading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result routes(Data value),
    Result network(Network value),
    Result error(Error value),
    Result empty(Empty value),
    Result loading(Loading value),
    @required Result orElse(),
  });
}

abstract class $RouteStatesCopyWith<$Res> {
  factory $RouteStatesCopyWith(
          RouteStates value, $Res Function(RouteStates) then) =
      _$RouteStatesCopyWithImpl<$Res>;
}

class _$RouteStatesCopyWithImpl<$Res> implements $RouteStatesCopyWith<$Res> {
  _$RouteStatesCopyWithImpl(this._value, this._then);

  final RouteStates _value;
  // ignore: unused_field
  final $Res Function(RouteStates) _then;
}

abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  $Res call({CffRoute routes});

  $CffRouteCopyWith<$Res> get routes;
}

class _$DataCopyWithImpl<$Res> extends _$RouteStatesCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(Data _value, $Res Function(Data) _then)
      : super(_value, (v) => _then(v as Data));

  @override
  Data get _value => super._value as Data;

  @override
  $Res call({
    Object routes = freezed,
  }) {
    return _then(Data(
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

class _$Data implements Data {
  const _$Data(this.routes) : assert(routes != null);

  @override
  final CffRoute routes;

  @override
  String toString() {
    return 'RouteStates.routes(routes: $routes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Data &&
            (identical(other.routes, routes) ||
                const DeepCollectionEquality().equals(other.routes, routes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(routes);

  @override
  $DataCopyWith<Data> get copyWith =>
      _$DataCopyWithImpl<Data>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result routes(CffRoute routes),
    @required Result network(),
    @required Result error(Object error),
    @required Result empty(),
    @required Result loading(),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(error != null);
    assert(empty != null);
    assert(loading != null);
    return routes(this.routes);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result routes(CffRoute routes),
    Result network(),
    Result error(Object error),
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
    @required Result routes(Data value),
    @required Result network(Network value),
    @required Result error(Error value),
    @required Result empty(Empty value),
    @required Result loading(Loading value),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(error != null);
    assert(empty != null);
    assert(loading != null);
    return routes(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result routes(Data value),
    Result network(Network value),
    Result error(Error value),
    Result empty(Empty value),
    Result loading(Loading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (routes != null) {
      return routes(this);
    }
    return orElse();
  }
}

abstract class Data implements RouteStates {
  const factory Data(CffRoute routes) = _$Data;

  CffRoute get routes;
  $DataCopyWith<Data> get copyWith;
}

abstract class $NetworkCopyWith<$Res> {
  factory $NetworkCopyWith(Network value, $Res Function(Network) then) =
      _$NetworkCopyWithImpl<$Res>;
}

class _$NetworkCopyWithImpl<$Res> extends _$RouteStatesCopyWithImpl<$Res>
    implements $NetworkCopyWith<$Res> {
  _$NetworkCopyWithImpl(Network _value, $Res Function(Network) _then)
      : super(_value, (v) => _then(v as Network));

  @override
  Network get _value => super._value as Network;
}

class _$Network implements Network {
  const _$Network();

  @override
  String toString() {
    return 'RouteStates.network()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Network);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result routes(CffRoute routes),
    @required Result network(),
    @required Result error(Object error),
    @required Result empty(),
    @required Result loading(),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(error != null);
    assert(empty != null);
    assert(loading != null);
    return network();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result routes(CffRoute routes),
    Result network(),
    Result error(Object error),
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
    @required Result routes(Data value),
    @required Result network(Network value),
    @required Result error(Error value),
    @required Result empty(Empty value),
    @required Result loading(Loading value),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(error != null);
    assert(empty != null);
    assert(loading != null);
    return network(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result routes(Data value),
    Result network(Network value),
    Result error(Error value),
    Result empty(Empty value),
    Result loading(Loading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class Network implements RouteStates {
  const factory Network() = _$Network;
}

abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({Object error});
}

class _$ErrorCopyWithImpl<$Res> extends _$RouteStatesCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(Error(
      error == freezed ? _value.error : error,
    ));
  }
}

class _$Error implements Error {
  const _$Error(this.error) : assert(error != null);

  @override
  final Object error;

  @override
  String toString() {
    return 'RouteStates.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result routes(CffRoute routes),
    @required Result network(),
    @required Result error(Object error),
    @required Result empty(),
    @required Result loading(),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(error != null);
    assert(empty != null);
    assert(loading != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result routes(CffRoute routes),
    Result network(),
    Result error(Object error),
    Result empty(),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result routes(Data value),
    @required Result network(Network value),
    @required Result error(Error value),
    @required Result empty(Empty value),
    @required Result loading(Loading value),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(error != null);
    assert(empty != null);
    assert(loading != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result routes(Data value),
    Result network(Network value),
    Result error(Error value),
    Result empty(Empty value),
    Result loading(Loading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements RouteStates {
  const factory Error(Object error) = _$Error;

  Object get error;
  $ErrorCopyWith<Error> get copyWith;
}

abstract class $EmptyCopyWith<$Res> {
  factory $EmptyCopyWith(Empty value, $Res Function(Empty) then) =
      _$EmptyCopyWithImpl<$Res>;
}

class _$EmptyCopyWithImpl<$Res> extends _$RouteStatesCopyWithImpl<$Res>
    implements $EmptyCopyWith<$Res> {
  _$EmptyCopyWithImpl(Empty _value, $Res Function(Empty) _then)
      : super(_value, (v) => _then(v as Empty));

  @override
  Empty get _value => super._value as Empty;
}

class _$Empty implements Empty {
  const _$Empty();

  @override
  String toString() {
    return 'RouteStates.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result routes(CffRoute routes),
    @required Result network(),
    @required Result error(Object error),
    @required Result empty(),
    @required Result loading(),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(error != null);
    assert(empty != null);
    assert(loading != null);
    return empty();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result routes(CffRoute routes),
    Result network(),
    Result error(Object error),
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
    @required Result routes(Data value),
    @required Result network(Network value),
    @required Result error(Error value),
    @required Result empty(Empty value),
    @required Result loading(Loading value),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(error != null);
    assert(empty != null);
    assert(loading != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result routes(Data value),
    Result network(Network value),
    Result error(Error value),
    Result empty(Empty value),
    Result loading(Loading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty implements RouteStates {
  const factory Empty() = _$Empty;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$RouteStatesCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'RouteStates.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result routes(CffRoute routes),
    @required Result network(),
    @required Result error(Object error),
    @required Result empty(),
    @required Result loading(),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(error != null);
    assert(empty != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result routes(CffRoute routes),
    Result network(),
    Result error(Object error),
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
    @required Result routes(Data value),
    @required Result network(Network value),
    @required Result error(Error value),
    @required Result empty(Empty value),
    @required Result loading(Loading value),
  }) {
    assert(routes != null);
    assert(network != null);
    assert(error != null);
    assert(empty != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result routes(Data value),
    Result network(Network value),
    Result error(Error value),
    Result empty(Empty value),
    Result loading(Loading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements RouteStates {
  const factory Loading() = _$Loading;
}
