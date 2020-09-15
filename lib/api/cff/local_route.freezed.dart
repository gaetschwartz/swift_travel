// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'local_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
LocalRoute _$LocalRouteFromJson(Map<String, dynamic> json) {
  return _LocalRoute.fromJson(json);
}

class _$LocalRouteTearOff {
  const _$LocalRouteTearOff();

// ignore: unused_element
  _LocalRoute call(String from, String to) {
    return _LocalRoute(
      from,
      to,
    );
  }
}

// ignore: unused_element
const $LocalRoute = _$LocalRouteTearOff();

mixin _$LocalRoute {
  String get from;
  String get to;

  Map<String, dynamic> toJson();
  $LocalRouteCopyWith<LocalRoute> get copyWith;
}

abstract class $LocalRouteCopyWith<$Res> {
  factory $LocalRouteCopyWith(
          LocalRoute value, $Res Function(LocalRoute) then) =
      _$LocalRouteCopyWithImpl<$Res>;
  $Res call({String from, String to});
}

class _$LocalRouteCopyWithImpl<$Res> implements $LocalRouteCopyWith<$Res> {
  _$LocalRouteCopyWithImpl(this._value, this._then);

  final LocalRoute _value;
  // ignore: unused_field
  final $Res Function(LocalRoute) _then;

  @override
  $Res call({
    Object from = freezed,
    Object to = freezed,
  }) {
    return _then(_value.copyWith(
      from: from == freezed ? _value.from : from as String,
      to: to == freezed ? _value.to : to as String,
    ));
  }
}

abstract class _$LocalRouteCopyWith<$Res> implements $LocalRouteCopyWith<$Res> {
  factory _$LocalRouteCopyWith(
          _LocalRoute value, $Res Function(_LocalRoute) then) =
      __$LocalRouteCopyWithImpl<$Res>;
  @override
  $Res call({String from, String to});
}

class __$LocalRouteCopyWithImpl<$Res> extends _$LocalRouteCopyWithImpl<$Res>
    implements _$LocalRouteCopyWith<$Res> {
  __$LocalRouteCopyWithImpl(
      _LocalRoute _value, $Res Function(_LocalRoute) _then)
      : super(_value, (v) => _then(v as _LocalRoute));

  @override
  _LocalRoute get _value => super._value as _LocalRoute;

  @override
  $Res call({
    Object from = freezed,
    Object to = freezed,
  }) {
    return _then(_LocalRoute(
      from == freezed ? _value.from : from as String,
      to == freezed ? _value.to : to as String,
    ));
  }
}

@JsonSerializable()
class _$_LocalRoute implements _LocalRoute {
  _$_LocalRoute(this.from, this.to)
      : assert(from != null),
        assert(to != null);

  factory _$_LocalRoute.fromJson(Map<String, dynamic> json) =>
      _$_$_LocalRouteFromJson(json);

  @override
  final String from;
  @override
  final String to;

  @override
  String toString() {
    return 'LocalRoute(from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocalRoute &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to);

  @override
  _$LocalRouteCopyWith<_LocalRoute> get copyWith =>
      __$LocalRouteCopyWithImpl<_LocalRoute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LocalRouteToJson(this);
  }
}

abstract class _LocalRoute implements LocalRoute {
  factory _LocalRoute(String from, String to) = _$_LocalRoute;

  factory _LocalRoute.fromJson(Map<String, dynamic> json) =
      _$_LocalRoute.fromJson;

  @override
  String get from;
  @override
  String get to;
  @override
  _$LocalRouteCopyWith<_LocalRoute> get copyWith;
}
