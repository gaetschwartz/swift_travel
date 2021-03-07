// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
class _$LocationTearOff {
  const _$LocationTearOff();

  _Location call(
      {required double latitude,
      required double longitude,
      double? accuracy,
      double? altitude,
      double? heading,
      double? speed,
      double? speedAccuracy,
      DateTime? timestamp}) {
    return _Location(
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

  Location fromJson(Map<String, Object> json) {
    return Location.fromJson(json);
  }
}

/// @nodoc
const $Location = _$LocationTearOff();

/// @nodoc
mixin _$Location {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;
  double? get altitude => throw _privateConstructorUsedError;
  double? get heading => throw _privateConstructorUsedError;
  double? get speed => throw _privateConstructorUsedError;
  double? get speedAccuracy => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call(
      {double latitude,
      double longitude,
      double? accuracy,
      double? altitude,
      double? heading,
      double? speed,
      double? speedAccuracy,
      DateTime? timestamp});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? accuracy = freezed,
    Object? altitude = freezed,
    Object? heading = freezed,
    Object? speed = freezed,
    Object? speedAccuracy = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      accuracy: accuracy == freezed
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      altitude: altitude == freezed
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double?,
      heading: heading == freezed
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      speedAccuracy: speedAccuracy == freezed
          ? _value.speedAccuracy
          : speedAccuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) then) =
      __$LocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {double latitude,
      double longitude,
      double? accuracy,
      double? altitude,
      double? heading,
      double? speed,
      double? speedAccuracy,
      DateTime? timestamp});
}

/// @nodoc
class __$LocationCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(_Location _value, $Res Function(_Location) _then)
      : super(_value, (v) => _then(v as _Location));

  @override
  _Location get _value => super._value as _Location;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? accuracy = freezed,
    Object? altitude = freezed,
    Object? heading = freezed,
    Object? speed = freezed,
    Object? speedAccuracy = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_Location(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      accuracy: accuracy == freezed
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      altitude: altitude == freezed
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double?,
      heading: heading == freezed
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      speedAccuracy: speedAccuracy == freezed
          ? _value.speedAccuracy
          : speedAccuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Location implements _Location {
  const _$_Location(
      {required this.latitude,
      required this.longitude,
      this.accuracy,
      this.altitude,
      this.heading,
      this.speed,
      this.speedAccuracy,
      this.timestamp});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$_$_LocationFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double? accuracy;
  @override
  final double? altitude;
  @override
  final double? heading;
  @override
  final double? speed;
  @override
  final double? speedAccuracy;
  @override
  final DateTime? timestamp;

  @override
  String toString() {
    return 'Location(latitude: $latitude, longitude: $longitude, accuracy: $accuracy, altitude: $altitude, heading: $heading, speed: $speed, speedAccuracy: $speedAccuracy, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Location &&
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
  _$LocationCopyWith<_Location> get copyWith =>
      __$LocationCopyWithImpl<_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LocationToJson(this);
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {required double latitude,
      required double longitude,
      double? accuracy,
      double? altitude,
      double? heading,
      double? speed,
      double? speedAccuracy,
      DateTime? timestamp}) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  double get latitude => throw _privateConstructorUsedError;
  @override
  double get longitude => throw _privateConstructorUsedError;
  @override
  double? get accuracy => throw _privateConstructorUsedError;
  @override
  double? get altitude => throw _privateConstructorUsedError;
  @override
  double? get heading => throw _privateConstructorUsedError;
  @override
  double? get speed => throw _privateConstructorUsedError;
  @override
  double? get speedAccuracy => throw _privateConstructorUsedError;
  @override
  DateTime? get timestamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocationCopyWith<_Location> get copyWith =>
      throw _privateConstructorUsedError;
}
