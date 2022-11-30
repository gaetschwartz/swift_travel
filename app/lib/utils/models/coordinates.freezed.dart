// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coordinates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LatLon _$LatLonFromJson(Map<String, dynamic> json) {
  return _LatLon.fromJson(json);
}

/// @nodoc
mixin _$LatLon {
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatLonCopyWith<LatLon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatLonCopyWith<$Res> {
  factory $LatLonCopyWith(LatLon value, $Res Function(LatLon) then) =
      _$LatLonCopyWithImpl<$Res, LatLon>;
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class _$LatLonCopyWithImpl<$Res, $Val extends LatLon>
    implements $LatLonCopyWith<$Res> {
  _$LatLonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LatLonCopyWith<$Res> implements $LatLonCopyWith<$Res> {
  factory _$$_LatLonCopyWith(_$_LatLon value, $Res Function(_$_LatLon) then) =
      __$$_LatLonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class __$$_LatLonCopyWithImpl<$Res>
    extends _$LatLonCopyWithImpl<$Res, _$_LatLon>
    implements _$$_LatLonCopyWith<$Res> {
  __$$_LatLonCopyWithImpl(_$_LatLon _value, $Res Function(_$_LatLon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_$_LatLon(
      null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LatLon extends _LatLon {
  const _$_LatLon(this.lat, this.lon) : super._();

  factory _$_LatLon.fromJson(Map<String, dynamic> json) =>
      _$$_LatLonFromJson(json);

  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'LatLon(lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LatLon &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LatLonCopyWith<_$_LatLon> get copyWith =>
      __$$_LatLonCopyWithImpl<_$_LatLon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LatLonToJson(
      this,
    );
  }
}

abstract class _LatLon extends LatLon {
  const factory _LatLon(final double lat, final double lon) = _$_LatLon;
  const _LatLon._() : super._();

  factory _LatLon.fromJson(Map<String, dynamic> json) = _$_LatLon.fromJson;

  @override
  double get lat;
  @override
  double get lon;
  @override
  @JsonKey(ignore: true)
  _$$_LatLonCopyWith<_$_LatLon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LV03Coordinates {
  int get x => throw _privateConstructorUsedError;
  int get y => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LV03CoordinatesCopyWith<LV03Coordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LV03CoordinatesCopyWith<$Res> {
  factory $LV03CoordinatesCopyWith(
          LV03Coordinates value, $Res Function(LV03Coordinates) then) =
      _$LV03CoordinatesCopyWithImpl<$Res, LV03Coordinates>;
  @useResult
  $Res call({int x, int y});
}

/// @nodoc
class _$LV03CoordinatesCopyWithImpl<$Res, $Val extends LV03Coordinates>
    implements $LV03CoordinatesCopyWith<$Res> {
  _$LV03CoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LV03CoordinatesCopyWith<$Res>
    implements $LV03CoordinatesCopyWith<$Res> {
  factory _$$_LV03CoordinatesCopyWith(
          _$_LV03Coordinates value, $Res Function(_$_LV03Coordinates) then) =
      __$$_LV03CoordinatesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int x, int y});
}

/// @nodoc
class __$$_LV03CoordinatesCopyWithImpl<$Res>
    extends _$LV03CoordinatesCopyWithImpl<$Res, _$_LV03Coordinates>
    implements _$$_LV03CoordinatesCopyWith<$Res> {
  __$$_LV03CoordinatesCopyWithImpl(
      _$_LV03Coordinates _value, $Res Function(_$_LV03Coordinates) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$_LV03Coordinates(
      null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LV03Coordinates extends _LV03Coordinates {
  const _$_LV03Coordinates(this.x, this.y) : super._();

  @override
  final int x;
  @override
  final int y;

  @override
  String toString() {
    return 'LV03Coordinates(x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LV03Coordinates &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LV03CoordinatesCopyWith<_$_LV03Coordinates> get copyWith =>
      __$$_LV03CoordinatesCopyWithImpl<_$_LV03Coordinates>(this, _$identity);
}

abstract class _LV03Coordinates extends LV03Coordinates {
  const factory _LV03Coordinates(final int x, final int y) = _$_LV03Coordinates;
  const _LV03Coordinates._() : super._();

  @override
  int get x;
  @override
  int get y;
  @override
  @JsonKey(ignore: true)
  _$$_LV03CoordinatesCopyWith<_$_LV03Coordinates> get copyWith =>
      throw _privateConstructorUsedError;
}
