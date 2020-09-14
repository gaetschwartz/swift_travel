// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'cff_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CffRoute _$CffRouteFromJson(Map<String, dynamic> json) {
  return _CffRoute.fromJson(json);
}

class _$CffRouteTearOff {
  const _$CffRouteTearOff();

// ignore: unused_element
  _CffRoute call(
      {int count,
      @JsonKey(name: 'min_duration') int minDuration,
      @JsonKey(name: 'max_duration') int maxDuration,
      List<RouteConnection> connections = const []}) {
    return _CffRoute(
      count: count,
      minDuration: minDuration,
      maxDuration: maxDuration,
      connections: connections,
    );
  }
}

// ignore: unused_element
const $CffRoute = _$CffRouteTearOff();

mixin _$CffRoute {
  int get count;
  @JsonKey(name: 'min_duration')
  int get minDuration;
  @JsonKey(name: 'max_duration')
  int get maxDuration;
  List<RouteConnection> get connections;

  Map<String, dynamic> toJson();
  $CffRouteCopyWith<CffRoute> get copyWith;
}

abstract class $CffRouteCopyWith<$Res> {
  factory $CffRouteCopyWith(CffRoute value, $Res Function(CffRoute) then) =
      _$CffRouteCopyWithImpl<$Res>;
  $Res call(
      {int count,
      @JsonKey(name: 'min_duration') int minDuration,
      @JsonKey(name: 'max_duration') int maxDuration,
      List<RouteConnection> connections});
}

class _$CffRouteCopyWithImpl<$Res> implements $CffRouteCopyWith<$Res> {
  _$CffRouteCopyWithImpl(this._value, this._then);

  final CffRoute _value;
  // ignore: unused_field
  final $Res Function(CffRoute) _then;

  @override
  $Res call({
    Object count = freezed,
    Object minDuration = freezed,
    Object maxDuration = freezed,
    Object connections = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed ? _value.count : count as int,
      minDuration:
          minDuration == freezed ? _value.minDuration : minDuration as int,
      maxDuration:
          maxDuration == freezed ? _value.maxDuration : maxDuration as int,
      connections: connections == freezed
          ? _value.connections
          : connections as List<RouteConnection>,
    ));
  }
}

abstract class _$CffRouteCopyWith<$Res> implements $CffRouteCopyWith<$Res> {
  factory _$CffRouteCopyWith(_CffRoute value, $Res Function(_CffRoute) then) =
      __$CffRouteCopyWithImpl<$Res>;
  @override
  $Res call(
      {int count,
      @JsonKey(name: 'min_duration') int minDuration,
      @JsonKey(name: 'max_duration') int maxDuration,
      List<RouteConnection> connections});
}

class __$CffRouteCopyWithImpl<$Res> extends _$CffRouteCopyWithImpl<$Res>
    implements _$CffRouteCopyWith<$Res> {
  __$CffRouteCopyWithImpl(_CffRoute _value, $Res Function(_CffRoute) _then)
      : super(_value, (v) => _then(v as _CffRoute));

  @override
  _CffRoute get _value => super._value as _CffRoute;

  @override
  $Res call({
    Object count = freezed,
    Object minDuration = freezed,
    Object maxDuration = freezed,
    Object connections = freezed,
  }) {
    return _then(_CffRoute(
      count: count == freezed ? _value.count : count as int,
      minDuration:
          minDuration == freezed ? _value.minDuration : minDuration as int,
      maxDuration:
          maxDuration == freezed ? _value.maxDuration : maxDuration as int,
      connections: connections == freezed
          ? _value.connections
          : connections as List<RouteConnection>,
    ));
  }
}

@JsonSerializable(explicitToJson: true)
class _$_CffRoute implements _CffRoute {
  _$_CffRoute(
      {this.count,
      @JsonKey(name: 'min_duration') this.minDuration,
      @JsonKey(name: 'max_duration') this.maxDuration,
      this.connections = const []})
      : assert(connections != null);

  factory _$_CffRoute.fromJson(Map<String, dynamic> json) =>
      _$_$_CffRouteFromJson(json);

  @override
  final int count;
  @override
  @JsonKey(name: 'min_duration')
  final int minDuration;
  @override
  @JsonKey(name: 'max_duration')
  final int maxDuration;
  @JsonKey(defaultValue: const [])
  @override
  final List<RouteConnection> connections;

  @override
  String toString() {
    return 'CffRoute(count: $count, minDuration: $minDuration, maxDuration: $maxDuration, connections: $connections)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CffRoute &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.minDuration, minDuration) ||
                const DeepCollectionEquality()
                    .equals(other.minDuration, minDuration)) &&
            (identical(other.maxDuration, maxDuration) ||
                const DeepCollectionEquality()
                    .equals(other.maxDuration, maxDuration)) &&
            (identical(other.connections, connections) ||
                const DeepCollectionEquality()
                    .equals(other.connections, connections)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(minDuration) ^
      const DeepCollectionEquality().hash(maxDuration) ^
      const DeepCollectionEquality().hash(connections);

  @override
  _$CffRouteCopyWith<_CffRoute> get copyWith =>
      __$CffRouteCopyWithImpl<_CffRoute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CffRouteToJson(this);
  }
}

abstract class _CffRoute implements CffRoute {
  factory _CffRoute(
      {int count,
      @JsonKey(name: 'min_duration') int minDuration,
      @JsonKey(name: 'max_duration') int maxDuration,
      List<RouteConnection> connections}) = _$_CffRoute;

  factory _CffRoute.fromJson(Map<String, dynamic> json) = _$_CffRoute.fromJson;

  @override
  int get count;
  @override
  @JsonKey(name: 'min_duration')
  int get minDuration;
  @override
  @JsonKey(name: 'max_duration')
  int get maxDuration;
  @override
  List<RouteConnection> get connections;
  @override
  _$CffRouteCopyWith<_CffRoute> get copyWith;
}
