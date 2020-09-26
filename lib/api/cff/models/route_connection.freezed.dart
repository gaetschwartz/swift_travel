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

/// @nodoc
class _$RouteConnectionTearOff {
  const _$RouteConnectionTearOff();

// ignore: unused_element
  _RouteConnection call(
      {String from,
      DateTime departure,
      String to,
      DateTime arrival,
      double duration,
      List<Leg> legs = const []}) {
    return _RouteConnection(
      from: from,
      departure: departure,
      to: to,
      arrival: arrival,
      duration: duration,
      legs: legs,
    );
  }

// ignore: unused_element
  RouteConnection fromJson(Map<String, Object> json) {
    return RouteConnection.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RouteConnection = _$RouteConnectionTearOff();

/// @nodoc
mixin _$RouteConnection {
  String get from;
  DateTime get departure;
  String get to;
  DateTime get arrival;
  double get duration;
  List<Leg> get legs;

  Map<String, dynamic> toJson();
  $RouteConnectionCopyWith<RouteConnection> get copyWith;
}

/// @nodoc
abstract class $RouteConnectionCopyWith<$Res> {
  factory $RouteConnectionCopyWith(
          RouteConnection value, $Res Function(RouteConnection) then) =
      _$RouteConnectionCopyWithImpl<$Res>;
  $Res call(
      {String from,
      DateTime departure,
      String to,
      DateTime arrival,
      double duration,
      List<Leg> legs});
}

/// @nodoc
class _$RouteConnectionCopyWithImpl<$Res>
    implements $RouteConnectionCopyWith<$Res> {
  _$RouteConnectionCopyWithImpl(this._value, this._then);

  final RouteConnection _value;
  // ignore: unused_field
  final $Res Function(RouteConnection) _then;

  @override
  $Res call({
    Object from = freezed,
    Object departure = freezed,
    Object to = freezed,
    Object arrival = freezed,
    Object duration = freezed,
    Object legs = freezed,
  }) {
    return _then(_value.copyWith(
      from: from == freezed ? _value.from : from as String,
      departure:
          departure == freezed ? _value.departure : departure as DateTime,
      to: to == freezed ? _value.to : to as String,
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime,
      duration: duration == freezed ? _value.duration : duration as double,
      legs: legs == freezed ? _value.legs : legs as List<Leg>,
    ));
  }
}

/// @nodoc
abstract class _$RouteConnectionCopyWith<$Res>
    implements $RouteConnectionCopyWith<$Res> {
  factory _$RouteConnectionCopyWith(
          _RouteConnection value, $Res Function(_RouteConnection) then) =
      __$RouteConnectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String from,
      DateTime departure,
      String to,
      DateTime arrival,
      double duration,
      List<Leg> legs});
}

/// @nodoc
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
    Object departure = freezed,
    Object to = freezed,
    Object arrival = freezed,
    Object duration = freezed,
    Object legs = freezed,
  }) {
    return _then(_RouteConnection(
      from: from == freezed ? _value.from : from as String,
      departure:
          departure == freezed ? _value.departure : departure as DateTime,
      to: to == freezed ? _value.to : to as String,
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime,
      duration: duration == freezed ? _value.duration : duration as double,
      legs: legs == freezed ? _value.legs : legs as List<Leg>,
    ));
  }
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)

/// @nodoc
class _$_RouteConnection implements _RouteConnection {
  _$_RouteConnection(
      {this.from,
      this.departure,
      this.to,
      this.arrival,
      this.duration,
      this.legs = const []})
      : assert(legs != null);

  factory _$_RouteConnection.fromJson(Map<String, dynamic> json) =>
      _$_$_RouteConnectionFromJson(json);

  @override
  final String from;
  @override
  final DateTime departure;
  @override
  final String to;
  @override
  final DateTime arrival;
  @override
  final double duration;
  @JsonKey(defaultValue: const [])
  @override
  final List<Leg> legs;

  @override
  String toString() {
    return 'RouteConnection(from: $from, departure: $departure, to: $to, arrival: $arrival, duration: $duration, legs: $legs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RouteConnection &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.departure, departure) ||
                const DeepCollectionEquality()
                    .equals(other.departure, departure)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.arrival, arrival) ||
                const DeepCollectionEquality()
                    .equals(other.arrival, arrival)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.legs, legs) ||
                const DeepCollectionEquality().equals(other.legs, legs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(departure) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(arrival) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(legs);

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
      DateTime departure,
      String to,
      DateTime arrival,
      double duration,
      List<Leg> legs}) = _$_RouteConnection;

  factory _RouteConnection.fromJson(Map<String, dynamic> json) =
      _$_RouteConnection.fromJson;

  @override
  String get from;
  @override
  DateTime get departure;
  @override
  String get to;
  @override
  DateTime get arrival;
  @override
  double get duration;
  @override
  List<Leg> get legs;
  @override
  _$RouteConnectionCopyWith<_RouteConnection> get copyWith;
}
