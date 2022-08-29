// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeoLocation _$GeoLocationFromJson(Map<String, dynamic> json) {
  return _GeoLocation.fromJson(json);
}

/// @nodoc
mixin _$GeoLocation {
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
  $GeoLocationCopyWith<GeoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoLocationCopyWith<$Res> {
  factory $GeoLocationCopyWith(
          GeoLocation value, $Res Function(GeoLocation) then) =
      _$GeoLocationCopyWithImpl<$Res>;
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
class _$GeoLocationCopyWithImpl<$Res> implements $GeoLocationCopyWith<$Res> {
  _$GeoLocationCopyWithImpl(this._value, this._then);

  final GeoLocation _value;
  // ignore: unused_field
  final $Res Function(GeoLocation) _then;

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
abstract class _$$_GeoLocationCopyWith<$Res>
    implements $GeoLocationCopyWith<$Res> {
  factory _$$_GeoLocationCopyWith(
          _$_GeoLocation value, $Res Function(_$_GeoLocation) then) =
      __$$_GeoLocationCopyWithImpl<$Res>;
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
class __$$_GeoLocationCopyWithImpl<$Res> extends _$GeoLocationCopyWithImpl<$Res>
    implements _$$_GeoLocationCopyWith<$Res> {
  __$$_GeoLocationCopyWithImpl(
      _$_GeoLocation _value, $Res Function(_$_GeoLocation) _then)
      : super(_value, (v) => _then(v as _$_GeoLocation));

  @override
  _$_GeoLocation get _value => super._value as _$_GeoLocation;

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
    return _then(_$_GeoLocation(
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
@JsonSerializable()
class _$_GeoLocation implements _GeoLocation {
  const _$_GeoLocation(
      {required this.latitude,
      required this.longitude,
      this.accuracy,
      this.altitude,
      this.heading,
      this.speed,
      this.speedAccuracy,
      this.timestamp});

  factory _$_GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$$_GeoLocationFromJson(json);

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
    return 'GeoLocation(latitude: $latitude, longitude: $longitude, accuracy: $accuracy, altitude: $altitude, heading: $heading, speed: $speed, speedAccuracy: $speedAccuracy, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeoLocation &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.accuracy, accuracy) &&
            const DeepCollectionEquality().equals(other.altitude, altitude) &&
            const DeepCollectionEquality().equals(other.heading, heading) &&
            const DeepCollectionEquality().equals(other.speed, speed) &&
            const DeepCollectionEquality()
                .equals(other.speedAccuracy, speedAccuracy) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(accuracy),
      const DeepCollectionEquality().hash(altitude),
      const DeepCollectionEquality().hash(heading),
      const DeepCollectionEquality().hash(speed),
      const DeepCollectionEquality().hash(speedAccuracy),
      const DeepCollectionEquality().hash(timestamp));

  @JsonKey(ignore: true)
  @override
  _$$_GeoLocationCopyWith<_$_GeoLocation> get copyWith =>
      __$$_GeoLocationCopyWithImpl<_$_GeoLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoLocationToJson(
      this,
    );
  }
}

abstract class _GeoLocation implements GeoLocation {
  const factory _GeoLocation(
      {required final double latitude,
      required final double longitude,
      final double? accuracy,
      final double? altitude,
      final double? heading,
      final double? speed,
      final double? speedAccuracy,
      final DateTime? timestamp}) = _$_GeoLocation;

  factory _GeoLocation.fromJson(Map<String, dynamic> json) =
      _$_GeoLocation.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double? get accuracy;
  @override
  double? get altitude;
  @override
  double? get heading;
  @override
  double? get speed;
  @override
  double? get speedAccuracy;
  @override
  DateTime? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$_GeoLocationCopyWith<_$_GeoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
