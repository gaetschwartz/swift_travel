// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'coordinates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LatLon _$LatLonFromJson(Map<String, dynamic> json) {
  return _LatLon.fromJson(json);
}

/// @nodoc
class _$LatLonTearOff {
  const _$LatLonTearOff();

  _LatLon call(double lat, double lon) {
    return _LatLon(
      lat,
      lon,
    );
  }

  LatLon fromJson(Map<String, Object> json) {
    return LatLon.fromJson(json);
  }
}

/// @nodoc
const $LatLon = _$LatLonTearOff();

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
      _$LatLonCopyWithImpl<$Res>;
  $Res call({double lat, double lon});
}

/// @nodoc
class _$LatLonCopyWithImpl<$Res> implements $LatLonCopyWith<$Res> {
  _$LatLonCopyWithImpl(this._value, this._then);

  final LatLon _value;
  // ignore: unused_field
  final $Res Function(LatLon) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed ? _value.lat : lat as double,
      lon: lon == freezed ? _value.lon : lon as double,
    ));
  }
}

/// @nodoc
abstract class _$LatLonCopyWith<$Res> implements $LatLonCopyWith<$Res> {
  factory _$LatLonCopyWith(_LatLon value, $Res Function(_LatLon) then) =
      __$LatLonCopyWithImpl<$Res>;
  @override
  $Res call({double lat, double lon});
}

/// @nodoc
class __$LatLonCopyWithImpl<$Res> extends _$LatLonCopyWithImpl<$Res>
    implements _$LatLonCopyWith<$Res> {
  __$LatLonCopyWithImpl(_LatLon _value, $Res Function(_LatLon) _then)
      : super(_value, (v) => _then(v as _LatLon));

  @override
  _LatLon get _value => super._value as _LatLon;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_LatLon(
      lat == freezed ? _value.lat : lat as double,
      lon == freezed ? _value.lon : lon as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_LatLon implements _LatLon {
  const _$_LatLon(this.lat, this.lon);

  factory _$_LatLon.fromJson(Map<String, dynamic> json) =>
      _$_$_LatLonFromJson(json);

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
        (other is _LatLon &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lon, lon) ||
                const DeepCollectionEquality().equals(other.lon, lon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon);

  @JsonKey(ignore: true)
  @override
  _$LatLonCopyWith<_LatLon> get copyWith =>
      __$LatLonCopyWithImpl<_LatLon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LatLonToJson(this);
  }
}

abstract class _LatLon implements LatLon {
  const factory _LatLon(double lat, double lon) = _$_LatLon;

  factory _LatLon.fromJson(Map<String, dynamic> json) = _$_LatLon.fromJson;

  @override
  double get lat => throw _privateConstructorUsedError;
  @override
  double get lon => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LatLonCopyWith<_LatLon> get copyWith => throw _privateConstructorUsedError;
}

LV03Coordinates _$LV03CoordinatesFromJson(Map<String, dynamic> json) {
  return _LV03Coordinates.fromJson(json);
}

/// @nodoc
class _$LV03CoordinatesTearOff {
  const _$LV03CoordinatesTearOff();

  _LV03Coordinates call(int x, int y) {
    return _LV03Coordinates(
      x,
      y,
    );
  }

  LV03Coordinates fromJson(Map<String, Object> json) {
    return LV03Coordinates.fromJson(json);
  }
}

/// @nodoc
const $LV03Coordinates = _$LV03CoordinatesTearOff();

/// @nodoc
mixin _$LV03Coordinates {
  int get x => throw _privateConstructorUsedError;
  int get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LV03CoordinatesCopyWith<LV03Coordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LV03CoordinatesCopyWith<$Res> {
  factory $LV03CoordinatesCopyWith(
          LV03Coordinates value, $Res Function(LV03Coordinates) then) =
      _$LV03CoordinatesCopyWithImpl<$Res>;
  $Res call({int x, int y});
}

/// @nodoc
class _$LV03CoordinatesCopyWithImpl<$Res>
    implements $LV03CoordinatesCopyWith<$Res> {
  _$LV03CoordinatesCopyWithImpl(this._value, this._then);

  final LV03Coordinates _value;
  // ignore: unused_field
  final $Res Function(LV03Coordinates) _then;

  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_value.copyWith(
      x: x == freezed ? _value.x : x as int,
      y: y == freezed ? _value.y : y as int,
    ));
  }
}

/// @nodoc
abstract class _$LV03CoordinatesCopyWith<$Res>
    implements $LV03CoordinatesCopyWith<$Res> {
  factory _$LV03CoordinatesCopyWith(
          _LV03Coordinates value, $Res Function(_LV03Coordinates) then) =
      __$LV03CoordinatesCopyWithImpl<$Res>;
  @override
  $Res call({int x, int y});
}

/// @nodoc
class __$LV03CoordinatesCopyWithImpl<$Res>
    extends _$LV03CoordinatesCopyWithImpl<$Res>
    implements _$LV03CoordinatesCopyWith<$Res> {
  __$LV03CoordinatesCopyWithImpl(
      _LV03Coordinates _value, $Res Function(_LV03Coordinates) _then)
      : super(_value, (v) => _then(v as _LV03Coordinates));

  @override
  _LV03Coordinates get _value => super._value as _LV03Coordinates;

  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_LV03Coordinates(
      x == freezed ? _value.x : x as int,
      y == freezed ? _value.y : y as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_LV03Coordinates implements _LV03Coordinates {
  _$_LV03Coordinates(this.x, this.y);

  factory _$_LV03Coordinates.fromJson(Map<String, dynamic> json) =>
      _$_$_LV03CoordinatesFromJson(json);

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
        (other is _LV03Coordinates &&
            (identical(other.x, x) ||
                const DeepCollectionEquality().equals(other.x, x)) &&
            (identical(other.y, y) ||
                const DeepCollectionEquality().equals(other.y, y)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(x) ^
      const DeepCollectionEquality().hash(y);

  @JsonKey(ignore: true)
  @override
  _$LV03CoordinatesCopyWith<_LV03Coordinates> get copyWith =>
      __$LV03CoordinatesCopyWithImpl<_LV03Coordinates>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LV03CoordinatesToJson(this);
  }
}

abstract class _LV03Coordinates implements LV03Coordinates {
  factory _LV03Coordinates(int x, int y) = _$_LV03Coordinates;

  factory _LV03Coordinates.fromJson(Map<String, dynamic> json) =
      _$_LV03Coordinates.fromJson;

  @override
  int get x => throw _privateConstructorUsedError;
  @override
  int get y => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LV03CoordinatesCopyWith<_LV03Coordinates> get copyWith =>
      throw _privateConstructorUsedError;
}
