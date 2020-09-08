// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'route_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RouteConnection _$RouteConnectionFromJson(Map<String, dynamic> json) {
  return _RouteConnection.fromJson(json);
}

class _$RouteConnectionTearOff {
  const _$RouteConnectionTearOff();

// ignore: unused_element
  _RouteConnection call(
      {String from,
      DateTime arrival,
      List<Leg> legs,
      int duration,
      String to,
      DateTime departure}) {
    return _RouteConnection(
      from: from,
      arrival: arrival,
      legs: legs,
      duration: duration,
      to: to,
      departure: departure,
    );
  }
}

// ignore: unused_element
const $RouteConnection = _$RouteConnectionTearOff();

mixin _$RouteConnection {
  String get from;
  DateTime get arrival;
  List<Leg> get legs;
  int get duration;
  String get to;
  DateTime get departure;

  Map<String, dynamic> toJson();
  $RouteConnectionCopyWith<RouteConnection> get copyWith;
}

abstract class $RouteConnectionCopyWith<$Res> {
  factory $RouteConnectionCopyWith(
          RouteConnection value, $Res Function(RouteConnection) then) =
      _$RouteConnectionCopyWithImpl<$Res>;
  $Res call(
      {String from,
      DateTime arrival,
      List<Leg> legs,
      int duration,
      String to,
      DateTime departure});
}

class _$RouteConnectionCopyWithImpl<$Res>
    implements $RouteConnectionCopyWith<$Res> {
  _$RouteConnectionCopyWithImpl(this._value, this._then);

  final RouteConnection _value;
  // ignore: unused_field
  final $Res Function(RouteConnection) _then;

  @override
  $Res call({
    Object from = freezed,
    Object arrival = freezed,
    Object legs = freezed,
    Object duration = freezed,
    Object to = freezed,
    Object departure = freezed,
  }) {
    return _then(_value.copyWith(
      from: from == freezed ? _value.from : from as String,
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime,
      legs: legs == freezed ? _value.legs : legs as List<Leg>,
      duration: duration == freezed ? _value.duration : duration as int,
      to: to == freezed ? _value.to : to as String,
      departure:
          departure == freezed ? _value.departure : departure as DateTime,
    ));
  }
}

abstract class _$RouteConnectionCopyWith<$Res>
    implements $RouteConnectionCopyWith<$Res> {
  factory _$RouteConnectionCopyWith(
          _RouteConnection value, $Res Function(_RouteConnection) then) =
      __$RouteConnectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String from,
      DateTime arrival,
      List<Leg> legs,
      int duration,
      String to,
      DateTime departure});
}

class __$RouteConnectionCopyWithImpl<$Res>
    extends _$RouteConnectionCopyWithImpl<$Res>
    implements _$RouteConnectionCopyWith<$Res> {
  __$RouteConnectionCopyWithImpl(
      _RouteConnection _value, $Res Function(_RouteConnection) _then)
      : super(_value, (v) => _then(v as _RouteConnection));

  @override
  _RouteConnection get _value => super._value as _RouteConnection;

  @override
  $Res call({
    Object from = freezed,
    Object arrival = freezed,
    Object legs = freezed,
    Object duration = freezed,
    Object to = freezed,
    Object departure = freezed,
  }) {
    return _then(_RouteConnection(
      from: from == freezed ? _value.from : from as String,
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime,
      legs: legs == freezed ? _value.legs : legs as List<Leg>,
      duration: duration == freezed ? _value.duration : duration as int,
      to: to == freezed ? _value.to : to as String,
      departure:
          departure == freezed ? _value.departure : departure as DateTime,
    ));
  }
}

@JsonSerializable(explicitToJson: true)
class _$_RouteConnection implements _RouteConnection {
  _$_RouteConnection(
      {this.from,
      this.arrival,
      this.legs,
      this.duration,
      this.to,
      this.departure});

  factory _$_RouteConnection.fromJson(Map<String, dynamic> json) =>
      _$_$_RouteConnectionFromJson(json);

  @override
  final String from;
  @override
  final DateTime arrival;
  @override
  final List<Leg> legs;
  @override
  final int duration;
  @override
  final String to;
  @override
  final DateTime departure;

  @override
  String toString() {
    return 'RouteConnection(from: $from, arrival: $arrival, legs: $legs, duration: $duration, to: $to, departure: $departure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RouteConnection &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.arrival, arrival) ||
                const DeepCollectionEquality()
                    .equals(other.arrival, arrival)) &&
            (identical(other.legs, legs) ||
                const DeepCollectionEquality().equals(other.legs, legs)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.departure, departure) ||
                const DeepCollectionEquality()
                    .equals(other.departure, departure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(arrival) ^
      const DeepCollectionEquality().hash(legs) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(departure);

  @override
  _$RouteConnectionCopyWith<_RouteConnection> get copyWith =>
      __$RouteConnectionCopyWithImpl<_RouteConnection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RouteConnectionToJson(this);
  }
}

abstract class _RouteConnection implements RouteConnection {
  factory _RouteConnection(
      {String from,
      DateTime arrival,
      List<Leg> legs,
      int duration,
      String to,
      DateTime departure}) = _$_RouteConnection;

  factory _RouteConnection.fromJson(Map<String, dynamic> json) =
      _$_RouteConnection.fromJson;

  @override
  String get from;
  @override
  DateTime get arrival;
  @override
  List<Leg> get legs;
  @override
  int get duration;
  @override
  String get to;
  @override
  DateTime get departure;
  @override
  _$RouteConnectionCopyWith<_RouteConnection> get copyWith;
}
