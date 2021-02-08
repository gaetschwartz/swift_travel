// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Position _$PositionFromJson(Map<String, dynamic> json) {
  return _Position.fromJson(json);
}

/// @nodoc
class _$PositionTearOff {
  const _$PositionTearOff();

// ignore: unused_element
  _Position call(
      {@required double latitude,
      @required double longitude,
      double accuracy,
      double altitude,
      double heading,
      double speed,
      double speedAccuracy,
      DateTime timestamp}) {
    return _Position(
      latitude: latitude,
      longitude: longitude,
      accuracy: accuracy,
      altitude: altitude,
      heading: heading,
      speed: speed,
      speedAccuracy: speedAccuracy,
      timestamp: timestamp,
    );
  }

// ignore: unused_element
  Position fromJson(Map<String, Object> json) {
    return Position.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Position = _$PositionTearOff();

/// @nodoc
mixin _$Position {
  double get latitude;
  double get longitude;
  double get accuracy;
  double get altitude;
  double get heading;
  double get speed;
  double get speedAccuracy;
  DateTime get timestamp;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $PositionCopyWith<Position> get copyWith;
}

/// @nodoc
abstract class $PositionCopyWith<$Res> {
  factory $PositionCopyWith(Position value, $Res Function(Position) then) =
      _$PositionCopyWithImpl<$Res>;
  $Res call(
      {double latitude,
      double longitude,
      double accuracy,
      double altitude,
      double heading,
      double speed,
      double speedAccuracy,
      DateTime timestamp});
}

/// @nodoc
class _$PositionCopyWithImpl<$Res> implements $PositionCopyWith<$Res> {
  _$PositionCopyWithImpl(this._value, this._then);

  final Position _value;
  // ignore: unused_field
  final $Res Function(Position) _then;

  @override
  $Res call({
    Object latitude = freezed,
    Object longitude = freezed,
    Object accuracy = freezed,
    Object altitude = freezed,
    Object heading = freezed,
    Object speed = freezed,
    Object speedAccuracy = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      accuracy: accuracy == freezed ? _value.accuracy : accuracy as double,
      altitude: altitude == freezed ? _value.altitude : altitude as double,
      heading: heading == freezed ? _value.heading : heading as double,
      speed: speed == freezed ? _value.speed : speed as double,
      speedAccuracy: speedAccuracy == freezed
          ? _value.speedAccuracy
          : speedAccuracy as double,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$PositionCopyWith<$Res> implements $PositionCopyWith<$Res> {
  factory _$PositionCopyWith(_Position value, $Res Function(_Position) then) =
      __$PositionCopyWithImpl<$Res>;
  @override
  $Res call(
      {double latitude,
      double longitude,
      double accuracy,
      double altitude,
      double heading,
      double speed,
      double speedAccuracy,
      DateTime timestamp});
}

/// @nodoc
class __$PositionCopyWithImpl<$Res> extends _$PositionCopyWithImpl<$Res>
    implements _$PositionCopyWith<$Res> {
  __$PositionCopyWithImpl(_Position _value, $Res Function(_Position) _then)
      : super(_value, (v) => _then(v as _Position));

  @override
  _Position get _value => super._value as _Position;

  @override
  $Res call({
    Object latitude = freezed,
    Object longitude = freezed,
    Object accuracy = freezed,
    Object altitude = freezed,
    Object heading = freezed,
    Object speed = freezed,
    Object speedAccuracy = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_Position(
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      accuracy: accuracy == freezed ? _value.accuracy : accuracy as double,
      altitude: altitude == freezed ? _value.altitude : altitude as double,
      heading: heading == freezed ? _value.heading : heading as double,
      speed: speed == freezed ? _value.speed : speed as double,
      speedAccuracy: speedAccuracy == freezed
          ? _value.speedAccuracy
          : speedAccuracy as double,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Position implements _Position {
  const _$_Position(
      {@required this.latitude,
      @required this.longitude,
      this.accuracy,
      this.altitude,
      this.heading,
      this.speed,
      this.speedAccuracy,
      this.timestamp})
      : assert(latitude != null),
        assert(longitude != null);

  factory _$_Position.fromJson(Map<String, dynamic> json) =>
      _$_$_PositionFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double accuracy;
  @override
  final double altitude;
  @override
  final double heading;
  @override
  final double speed;
  @override
  final double speedAccuracy;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'Position(latitude: $latitude, longitude: $longitude, accuracy: $accuracy, altitude: $altitude, heading: $heading, speed: $speed, speedAccuracy: $speedAccuracy, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Position &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.accuracy, accuracy) ||
                const DeepCollectionEquality()
                    .equals(other.accuracy, accuracy)) &&
            (identical(other.altitude, altitude) ||
                const DeepCollectionEquality()
                    .equals(other.altitude, altitude)) &&
            (identical(other.heading, heading) ||
                const DeepCollectionEquality()
                    .equals(other.heading, heading)) &&
            (identical(other.speed, speed) ||
                const DeepCollectionEquality().equals(other.speed, speed)) &&
            (identical(other.speedAccuracy, speedAccuracy) ||
                const DeepCollectionEquality()
                    .equals(other.speedAccuracy, speedAccuracy)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(accuracy) ^
      const DeepCollectionEquality().hash(altitude) ^
      const DeepCollectionEquality().hash(heading) ^
      const DeepCollectionEquality().hash(speed) ^
      const DeepCollectionEquality().hash(speedAccuracy) ^
      const DeepCollectionEquality().hash(timestamp);

  @JsonKey(ignore: true)
  @override
  _$PositionCopyWith<_Position> get copyWith =>
      __$PositionCopyWithImpl<_Position>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PositionToJson(this);
  }
}

abstract class _Position implements Position {
  const factory _Position(
      {@required double latitude,
      @required double longitude,
      double accuracy,
      double altitude,
      double heading,
      double speed,
      double speedAccuracy,
      DateTime timestamp}) = _$_Position;

  factory _Position.fromJson(Map<String, dynamic> json) = _$_Position.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get accuracy;
  @override
  double get altitude;
  @override
  double get heading;
  @override
  double get speed;
  @override
  double get speedAccuracy;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$PositionCopyWith<_Position> get copyWith;
}
