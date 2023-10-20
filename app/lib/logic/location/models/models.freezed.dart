// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$GeoLocationCopyWithImpl<$Res, GeoLocation>;
  @useResult
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
class _$GeoLocationCopyWithImpl<$Res, $Val extends GeoLocation>
    implements $GeoLocationCopyWith<$Res> {
  _$GeoLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? accuracy = freezed,
    Object? altitude = freezed,
    Object? heading = freezed,
    Object? speed = freezed,
    Object? speedAccuracy = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      altitude: freezed == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      speedAccuracy: freezed == speedAccuracy
          ? _value.speedAccuracy
          : speedAccuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoLocationImplCopyWith<$Res>
    implements $GeoLocationCopyWith<$Res> {
  factory _$$GeoLocationImplCopyWith(
          _$GeoLocationImpl value, $Res Function(_$GeoLocationImpl) then) =
      __$$GeoLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$GeoLocationImplCopyWithImpl<$Res>
    extends _$GeoLocationCopyWithImpl<$Res, _$GeoLocationImpl>
    implements _$$GeoLocationImplCopyWith<$Res> {
  __$$GeoLocationImplCopyWithImpl(
      _$GeoLocationImpl _value, $Res Function(_$GeoLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? accuracy = freezed,
    Object? altitude = freezed,
    Object? heading = freezed,
    Object? speed = freezed,
    Object? speedAccuracy = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$GeoLocationImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      altitude: freezed == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      speedAccuracy: freezed == speedAccuracy
          ? _value.speedAccuracy
          : speedAccuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoLocationImpl implements _GeoLocation {
  const _$GeoLocationImpl(
      {required this.latitude,
      required this.longitude,
      this.accuracy,
      this.altitude,
      this.heading,
      this.speed,
      this.speedAccuracy,
      this.timestamp});

  factory _$GeoLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoLocationImplFromJson(json);

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
            other is _$GeoLocationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.altitude, altitude) ||
                other.altitude == altitude) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.speedAccuracy, speedAccuracy) ||
                other.speedAccuracy == speedAccuracy) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, accuracy,
      altitude, heading, speed, speedAccuracy, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoLocationImplCopyWith<_$GeoLocationImpl> get copyWith =>
      __$$GeoLocationImplCopyWithImpl<_$GeoLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoLocationImplToJson(
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
      final DateTime? timestamp}) = _$GeoLocationImpl;

  factory _GeoLocation.fromJson(Map<String, dynamic> json) =
      _$GeoLocationImpl.fromJson;

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
  _$$GeoLocationImplCopyWith<_$GeoLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
