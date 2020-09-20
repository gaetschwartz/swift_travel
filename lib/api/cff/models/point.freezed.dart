// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Point _$PointFromJson(Map<String, dynamic> json) {
  return _Point.fromJson(json);
}

class _$PointTearOff {
  const _$PointTearOff();

// ignore: unused_element
  _Point call(
      {String text,
      String url,
      String id,
      int x,
      int y,
      double lat,
      double lon}) {
    return _Point(
      text: text,
      url: url,
      id: id,
      x: x,
      y: y,
      lat: lat,
      lon: lon,
    );
  }
}

// ignore: unused_element
const $Point = _$PointTearOff();

mixin _$Point {
  String get text;
  String get url;
  String get id;
  int get x;
  int get y;
  double get lat;
  double get lon;

  Map<String, dynamic> toJson();
  $PointCopyWith<Point> get copyWith;
}

abstract class $PointCopyWith<$Res> {
  factory $PointCopyWith(Point value, $Res Function(Point) then) =
      _$PointCopyWithImpl<$Res>;
  $Res call(
      {String text,
      String url,
      String id,
      int x,
      int y,
      double lat,
      double lon});
}

class _$PointCopyWithImpl<$Res> implements $PointCopyWith<$Res> {
  _$PointCopyWithImpl(this._value, this._then);

  final Point _value;
  // ignore: unused_field
  final $Res Function(Point) _then;

  @override
  $Res call({
    Object text = freezed,
    Object url = freezed,
    Object id = freezed,
    Object x = freezed,
    Object y = freezed,
    Object lat = freezed,
    Object lon = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed ? _value.text : text as String,
      url: url == freezed ? _value.url : url as String,
      id: id == freezed ? _value.id : id as String,
      x: x == freezed ? _value.x : x as int,
      y: y == freezed ? _value.y : y as int,
      lat: lat == freezed ? _value.lat : lat as double,
      lon: lon == freezed ? _value.lon : lon as double,
    ));
  }
}

abstract class _$PointCopyWith<$Res> implements $PointCopyWith<$Res> {
  factory _$PointCopyWith(_Point value, $Res Function(_Point) then) =
      __$PointCopyWithImpl<$Res>;
  @override
  $Res call(
      {String text,
      String url,
      String id,
      int x,
      int y,
      double lat,
      double lon});
}

class __$PointCopyWithImpl<$Res> extends _$PointCopyWithImpl<$Res>
    implements _$PointCopyWith<$Res> {
  __$PointCopyWithImpl(_Point _value, $Res Function(_Point) _then)
      : super(_value, (v) => _then(v as _Point));

  @override
  _Point get _value => super._value as _Point;

  @override
  $Res call({
    Object text = freezed,
    Object url = freezed,
    Object id = freezed,
    Object x = freezed,
    Object y = freezed,
    Object lat = freezed,
    Object lon = freezed,
  }) {
    return _then(_Point(
      text: text == freezed ? _value.text : text as String,
      url: url == freezed ? _value.url : url as String,
      id: id == freezed ? _value.id : id as String,
      x: x == freezed ? _value.x : x as int,
      y: y == freezed ? _value.y : y as int,
      lat: lat == freezed ? _value.lat : lat as double,
      lon: lon == freezed ? _value.lon : lon as double,
    ));
  }
}

@JsonSerializable()
class _$_Point implements _Point {
  _$_Point({this.text, this.url, this.id, this.x, this.y, this.lat, this.lon});

  factory _$_Point.fromJson(Map<String, dynamic> json) =>
      _$_$_PointFromJson(json);

  @override
  final String text;
  @override
  final String url;
  @override
  final String id;
  @override
  final int x;
  @override
  final int y;
  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'Point(text: $text, url: $url, id: $id, x: $x, y: $y, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Point &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.x, x) ||
                const DeepCollectionEquality().equals(other.x, x)) &&
            (identical(other.y, y) ||
                const DeepCollectionEquality().equals(other.y, y)) &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lon, lon) ||
                const DeepCollectionEquality().equals(other.lon, lon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(x) ^
      const DeepCollectionEquality().hash(y) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon);

  @override
  _$PointCopyWith<_Point> get copyWith =>
      __$PointCopyWithImpl<_Point>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PointToJson(this);
  }
}

abstract class _Point implements Point {
  factory _Point(
      {String text,
      String url,
      String id,
      int x,
      int y,
      double lat,
      double lon}) = _$_Point;

  factory _Point.fromJson(Map<String, dynamic> json) = _$_Point.fromJson;

  @override
  String get text;
  @override
  String get url;
  @override
  String get id;
  @override
  int get x;
  @override
  int get y;
  @override
  double get lat;
  @override
  double get lon;
  @override
  _$PointCopyWith<_Point> get copyWith;
}
