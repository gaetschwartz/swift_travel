// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'geo_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using MyClass._() or by manually adding another constructor. The MyClass._() constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');
GeoResponse _$GeoResponseFromJson(Map<String, dynamic> json) {
  return _GeoResponse.fromJson(json);
}

/// @nodoc
class _$GeoResponseTearOff {
  const _$GeoResponseTearOff();

  _GeoResponse call(List<GeoResult> results) {
    return _GeoResponse(
      results,
    );
  }

  GeoResponse fromJson(Map<String, Object> json) {
    return GeoResponse.fromJson(json);
  }
}

/// @nodoc
const $GeoResponse = _$GeoResponseTearOff();

/// @nodoc
mixin _$GeoResponse {
  List<GeoResult> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoResponseCopyWith<GeoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoResponseCopyWith<$Res> {
  factory $GeoResponseCopyWith(
          GeoResponse value, $Res Function(GeoResponse) then) =
      _$GeoResponseCopyWithImpl<$Res>;
  $Res call({List<GeoResult> results});
}

/// @nodoc
class _$GeoResponseCopyWithImpl<$Res> implements $GeoResponseCopyWith<$Res> {
  _$GeoResponseCopyWithImpl(this._value, this._then);

  final GeoResponse _value;
  // ignore: unused_field
  final $Res Function(GeoResponse) _then;

  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed ? _value.results : results as List<GeoResult>,
    ));
  }
}

/// @nodoc
abstract class _$GeoResponseCopyWith<$Res>
    implements $GeoResponseCopyWith<$Res> {
  factory _$GeoResponseCopyWith(
          _GeoResponse value, $Res Function(_GeoResponse) then) =
      __$GeoResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<GeoResult> results});
}

/// @nodoc
class __$GeoResponseCopyWithImpl<$Res> extends _$GeoResponseCopyWithImpl<$Res>
    implements _$GeoResponseCopyWith<$Res> {
  __$GeoResponseCopyWithImpl(
      _GeoResponse _value, $Res Function(_GeoResponse) _then)
      : super(_value, (v) => _then(v as _GeoResponse));

  @override
  _GeoResponse get _value => super._value as _GeoResponse;

  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_GeoResponse(
      results == freezed ? _value.results : results as List<GeoResult>,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_GeoResponse implements _GeoResponse {
  const _$_GeoResponse(this.results);

  factory _$_GeoResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_GeoResponseFromJson(json);

  @override
  final List<GeoResult> results;

  @override
  String toString() {
    return 'GeoResponse(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GeoResponse &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(results);

  @JsonKey(ignore: true)
  @override
  _$GeoResponseCopyWith<_GeoResponse> get copyWith =>
      __$GeoResponseCopyWithImpl<_GeoResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GeoResponseToJson(this);
  }
}

abstract class _GeoResponse implements GeoResponse {
  const factory _GeoResponse(List<GeoResult> results) = _$_GeoResponse;

  factory _GeoResponse.fromJson(Map<String, dynamic> json) =
      _$_GeoResponse.fromJson;

  @override
  List<GeoResult> get results => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GeoResponseCopyWith<_GeoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoAttr _$GeoAttrFromJson(Map<String, dynamic> json) {
  return _GeoAttr.fromJson(json);
}

/// @nodoc
class _$GeoAttrTearOff {
  const _$GeoAttrTearOff();

  _GeoAttr call(
      {String? origin,
      String? geomQuadindex,
      int? zoomlevel,
      String? featureId,
      double? lon,
      String? detail,
      int? rank,
      String? geomStBox2d,
      double? lat,
      @JsonKey(name: 'num') int? number,
      double? y,
      double? x,
      String? label}) {
    return _GeoAttr(
      origin: origin,
      geomQuadindex: geomQuadindex,
      zoomlevel: zoomlevel,
      featureId: featureId,
      lon: lon,
      detail: detail,
      rank: rank,
      geomStBox2d: geomStBox2d,
      lat: lat,
      number: number,
      y: y,
      x: x,
      label: label,
    );
  }

  GeoAttr fromJson(Map<String, Object> json) {
    return GeoAttr.fromJson(json);
  }
}

/// @nodoc
const $GeoAttr = _$GeoAttrTearOff();

/// @nodoc
mixin _$GeoAttr {
  String? get origin => throw _privateConstructorUsedError;
  String? get geomQuadindex => throw _privateConstructorUsedError;
  int? get zoomlevel => throw _privateConstructorUsedError;
  String? get featureId => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  String? get geomStBox2d => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'num')
  int? get number => throw _privateConstructorUsedError;
  double? get y => throw _privateConstructorUsedError;
  double? get x => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoAttrCopyWith<GeoAttr> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoAttrCopyWith<$Res> {
  factory $GeoAttrCopyWith(GeoAttr value, $Res Function(GeoAttr) then) =
      _$GeoAttrCopyWithImpl<$Res>;
  $Res call(
      {String? origin,
      String? geomQuadindex,
      int? zoomlevel,
      String? featureId,
      double? lon,
      String? detail,
      int? rank,
      String? geomStBox2d,
      double? lat,
      @JsonKey(name: 'num') int? number,
      double? y,
      double? x,
      String? label});
}

/// @nodoc
class _$GeoAttrCopyWithImpl<$Res> implements $GeoAttrCopyWith<$Res> {
  _$GeoAttrCopyWithImpl(this._value, this._then);

  final GeoAttr _value;
  // ignore: unused_field
  final $Res Function(GeoAttr) _then;

  @override
  $Res call({
    Object? origin = freezed,
    Object? geomQuadindex = freezed,
    Object? zoomlevel = freezed,
    Object? featureId = freezed,
    Object? lon = freezed,
    Object? detail = freezed,
    Object? rank = freezed,
    Object? geomStBox2d = freezed,
    Object? lat = freezed,
    Object? number = freezed,
    Object? y = freezed,
    Object? x = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      origin: origin == freezed ? _value.origin : origin as String?,
      geomQuadindex: geomQuadindex == freezed
          ? _value.geomQuadindex
          : geomQuadindex as String?,
      zoomlevel: zoomlevel == freezed ? _value.zoomlevel : zoomlevel as int?,
      featureId: featureId == freezed ? _value.featureId : featureId as String?,
      lon: lon == freezed ? _value.lon : lon as double?,
      detail: detail == freezed ? _value.detail : detail as String?,
      rank: rank == freezed ? _value.rank : rank as int?,
      geomStBox2d:
          geomStBox2d == freezed ? _value.geomStBox2d : geomStBox2d as String?,
      lat: lat == freezed ? _value.lat : lat as double?,
      number: number == freezed ? _value.number : number as int?,
      y: y == freezed ? _value.y : y as double?,
      x: x == freezed ? _value.x : x as double?,
      label: label == freezed ? _value.label : label as String?,
    ));
  }
}

/// @nodoc
abstract class _$GeoAttrCopyWith<$Res> implements $GeoAttrCopyWith<$Res> {
  factory _$GeoAttrCopyWith(_GeoAttr value, $Res Function(_GeoAttr) then) =
      __$GeoAttrCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? origin,
      String? geomQuadindex,
      int? zoomlevel,
      String? featureId,
      double? lon,
      String? detail,
      int? rank,
      String? geomStBox2d,
      double? lat,
      @JsonKey(name: 'num') int? number,
      double? y,
      double? x,
      String? label});
}

/// @nodoc
class __$GeoAttrCopyWithImpl<$Res> extends _$GeoAttrCopyWithImpl<$Res>
    implements _$GeoAttrCopyWith<$Res> {
  __$GeoAttrCopyWithImpl(_GeoAttr _value, $Res Function(_GeoAttr) _then)
      : super(_value, (v) => _then(v as _GeoAttr));

  @override
  _GeoAttr get _value => super._value as _GeoAttr;

  @override
  $Res call({
    Object? origin = freezed,
    Object? geomQuadindex = freezed,
    Object? zoomlevel = freezed,
    Object? featureId = freezed,
    Object? lon = freezed,
    Object? detail = freezed,
    Object? rank = freezed,
    Object? geomStBox2d = freezed,
    Object? lat = freezed,
    Object? number = freezed,
    Object? y = freezed,
    Object? x = freezed,
    Object? label = freezed,
  }) {
    return _then(_GeoAttr(
      origin: origin == freezed ? _value.origin : origin as String?,
      geomQuadindex: geomQuadindex == freezed
          ? _value.geomQuadindex
          : geomQuadindex as String?,
      zoomlevel: zoomlevel == freezed ? _value.zoomlevel : zoomlevel as int?,
      featureId: featureId == freezed ? _value.featureId : featureId as String?,
      lon: lon == freezed ? _value.lon : lon as double?,
      detail: detail == freezed ? _value.detail : detail as String?,
      rank: rank == freezed ? _value.rank : rank as int?,
      geomStBox2d:
          geomStBox2d == freezed ? _value.geomStBox2d : geomStBox2d as String?,
      lat: lat == freezed ? _value.lat : lat as double?,
      number: number == freezed ? _value.number : number as int?,
      y: y == freezed ? _value.y : y as double?,
      x: x == freezed ? _value.x : x as double?,
      label: label == freezed ? _value.label : label as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GeoAttr implements _GeoAttr {
  const _$_GeoAttr(
      {this.origin,
      this.geomQuadindex,
      this.zoomlevel,
      this.featureId,
      this.lon,
      this.detail,
      this.rank,
      this.geomStBox2d,
      this.lat,
      @JsonKey(name: 'num') this.number,
      this.y,
      this.x,
      this.label});

  factory _$_GeoAttr.fromJson(Map<String, dynamic> json) =>
      _$_$_GeoAttrFromJson(json);

  @override
  final String? origin;
  @override
  final String? geomQuadindex;
  @override
  final int? zoomlevel;
  @override
  final String? featureId;
  @override
  final double? lon;
  @override
  final String? detail;
  @override
  final int? rank;
  @override
  final String? geomStBox2d;
  @override
  final double? lat;
  @override
  @JsonKey(name: 'num')
  final int? number;
  @override
  final double? y;
  @override
  final double? x;
  @override
  final String? label;

  @override
  String toString() {
    return 'GeoAttr(origin: $origin, geomQuadindex: $geomQuadindex, zoomlevel: $zoomlevel, featureId: $featureId, lon: $lon, detail: $detail, rank: $rank, geomStBox2d: $geomStBox2d, lat: $lat, number: $number, y: $y, x: $x, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GeoAttr &&
            (identical(other.origin, origin) ||
                const DeepCollectionEquality().equals(other.origin, origin)) &&
            (identical(other.geomQuadindex, geomQuadindex) ||
                const DeepCollectionEquality()
                    .equals(other.geomQuadindex, geomQuadindex)) &&
            (identical(other.zoomlevel, zoomlevel) ||
                const DeepCollectionEquality()
                    .equals(other.zoomlevel, zoomlevel)) &&
            (identical(other.featureId, featureId) ||
                const DeepCollectionEquality()
                    .equals(other.featureId, featureId)) &&
            (identical(other.lon, lon) ||
                const DeepCollectionEquality().equals(other.lon, lon)) &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)) &&
            (identical(other.rank, rank) ||
                const DeepCollectionEquality().equals(other.rank, rank)) &&
            (identical(other.geomStBox2d, geomStBox2d) ||
                const DeepCollectionEquality()
                    .equals(other.geomStBox2d, geomStBox2d)) &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.y, y) ||
                const DeepCollectionEquality().equals(other.y, y)) &&
            (identical(other.x, x) ||
                const DeepCollectionEquality().equals(other.x, x)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(origin) ^
      const DeepCollectionEquality().hash(geomQuadindex) ^
      const DeepCollectionEquality().hash(zoomlevel) ^
      const DeepCollectionEquality().hash(featureId) ^
      const DeepCollectionEquality().hash(lon) ^
      const DeepCollectionEquality().hash(detail) ^
      const DeepCollectionEquality().hash(rank) ^
      const DeepCollectionEquality().hash(geomStBox2d) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(y) ^
      const DeepCollectionEquality().hash(x) ^
      const DeepCollectionEquality().hash(label);

  @JsonKey(ignore: true)
  @override
  _$GeoAttrCopyWith<_GeoAttr> get copyWith =>
      __$GeoAttrCopyWithImpl<_GeoAttr>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GeoAttrToJson(this);
  }
}

abstract class _GeoAttr implements GeoAttr {
  const factory _GeoAttr(
      {String? origin,
      String? geomQuadindex,
      int? zoomlevel,
      String? featureId,
      double? lon,
      String? detail,
      int? rank,
      String? geomStBox2d,
      double? lat,
      @JsonKey(name: 'num') int? number,
      double? y,
      double? x,
      String? label}) = _$_GeoAttr;

  factory _GeoAttr.fromJson(Map<String, dynamic> json) = _$_GeoAttr.fromJson;

  @override
  String? get origin => throw _privateConstructorUsedError;
  @override
  String? get geomQuadindex => throw _privateConstructorUsedError;
  @override
  int? get zoomlevel => throw _privateConstructorUsedError;
  @override
  String? get featureId => throw _privateConstructorUsedError;
  @override
  double? get lon => throw _privateConstructorUsedError;
  @override
  String? get detail => throw _privateConstructorUsedError;
  @override
  int? get rank => throw _privateConstructorUsedError;
  @override
  String? get geomStBox2d => throw _privateConstructorUsedError;
  @override
  double? get lat => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'num')
  int? get number => throw _privateConstructorUsedError;
  @override
  double? get y => throw _privateConstructorUsedError;
  @override
  double? get x => throw _privateConstructorUsedError;
  @override
  String? get label => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GeoAttrCopyWith<_GeoAttr> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoResult _$GeoResultFromJson(Map<String, dynamic> json) {
  return _GeoResult.fromJson(json);
}

/// @nodoc
class _$GeoResultTearOff {
  const _$GeoResultTearOff();

  _GeoResult call({int? id, int? weight, GeoAttr? attrs}) {
    return _GeoResult(
      id: id,
      weight: weight,
      attrs: attrs,
    );
  }

  GeoResult fromJson(Map<String, Object> json) {
    return GeoResult.fromJson(json);
  }
}

/// @nodoc
const $GeoResult = _$GeoResultTearOff();

/// @nodoc
mixin _$GeoResult {
  int? get id => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;
  GeoAttr? get attrs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoResultCopyWith<GeoResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoResultCopyWith<$Res> {
  factory $GeoResultCopyWith(GeoResult value, $Res Function(GeoResult) then) =
      _$GeoResultCopyWithImpl<$Res>;
  $Res call({int? id, int? weight, GeoAttr? attrs});

  $GeoAttrCopyWith<$Res>? get attrs;
}

/// @nodoc
class _$GeoResultCopyWithImpl<$Res> implements $GeoResultCopyWith<$Res> {
  _$GeoResultCopyWithImpl(this._value, this._then);

  final GeoResult _value;
  // ignore: unused_field
  final $Res Function(GeoResult) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? weight = freezed,
    Object? attrs = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int?,
      weight: weight == freezed ? _value.weight : weight as int?,
      attrs: attrs == freezed ? _value.attrs : attrs as GeoAttr?,
    ));
  }

  @override
  $GeoAttrCopyWith<$Res>? get attrs {
    if (_value.attrs == null) {
      return null;
    }

    return $GeoAttrCopyWith<$Res>(_value.attrs!, (value) {
      return _then(_value.copyWith(attrs: value));
    });
  }
}

/// @nodoc
abstract class _$GeoResultCopyWith<$Res> implements $GeoResultCopyWith<$Res> {
  factory _$GeoResultCopyWith(
          _GeoResult value, $Res Function(_GeoResult) then) =
      __$GeoResultCopyWithImpl<$Res>;
  @override
  $Res call({int? id, int? weight, GeoAttr? attrs});

  @override
  $GeoAttrCopyWith<$Res>? get attrs;
}

/// @nodoc
class __$GeoResultCopyWithImpl<$Res> extends _$GeoResultCopyWithImpl<$Res>
    implements _$GeoResultCopyWith<$Res> {
  __$GeoResultCopyWithImpl(_GeoResult _value, $Res Function(_GeoResult) _then)
      : super(_value, (v) => _then(v as _GeoResult));

  @override
  _GeoResult get _value => super._value as _GeoResult;

  @override
  $Res call({
    Object? id = freezed,
    Object? weight = freezed,
    Object? attrs = freezed,
  }) {
    return _then(_GeoResult(
      id: id == freezed ? _value.id : id as int?,
      weight: weight == freezed ? _value.weight : weight as int?,
      attrs: attrs == freezed ? _value.attrs : attrs as GeoAttr?,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_GeoResult implements _GeoResult {
  const _$_GeoResult({this.id, this.weight, this.attrs});

  factory _$_GeoResult.fromJson(Map<String, dynamic> json) =>
      _$_$_GeoResultFromJson(json);

  @override
  final int? id;
  @override
  final int? weight;
  @override
  final GeoAttr? attrs;

  @override
  String toString() {
    return 'GeoResult(id: $id, weight: $weight, attrs: $attrs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GeoResult &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)) &&
            (identical(other.attrs, attrs) ||
                const DeepCollectionEquality().equals(other.attrs, attrs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(weight) ^
      const DeepCollectionEquality().hash(attrs);

  @JsonKey(ignore: true)
  @override
  _$GeoResultCopyWith<_GeoResult> get copyWith =>
      __$GeoResultCopyWithImpl<_GeoResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GeoResultToJson(this);
  }
}

abstract class _GeoResult implements GeoResult {
  const factory _GeoResult({int? id, int? weight, GeoAttr? attrs}) =
      _$_GeoResult;

  factory _GeoResult.fromJson(Map<String, dynamic> json) =
      _$_GeoResult.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  int? get weight => throw _privateConstructorUsedError;
  @override
  GeoAttr? get attrs => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GeoResultCopyWith<_GeoResult> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoError _$GeoErrorFromJson(Map<String, dynamic> json) {
  return _GeoError.fromJson(json);
}

/// @nodoc
class _$GeoErrorTearOff {
  const _$GeoErrorTearOff();

  _GeoError call({String? status, String? detail, int? code}) {
    return _GeoError(
      status: status,
      detail: detail,
      code: code,
    );
  }

  GeoError fromJson(Map<String, Object> json) {
    return GeoError.fromJson(json);
  }
}

/// @nodoc
const $GeoError = _$GeoErrorTearOff();

/// @nodoc
mixin _$GeoError {
  String? get status => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoErrorCopyWith<GeoError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoErrorCopyWith<$Res> {
  factory $GeoErrorCopyWith(GeoError value, $Res Function(GeoError) then) =
      _$GeoErrorCopyWithImpl<$Res>;
  $Res call({String? status, String? detail, int? code});
}

/// @nodoc
class _$GeoErrorCopyWithImpl<$Res> implements $GeoErrorCopyWith<$Res> {
  _$GeoErrorCopyWithImpl(this._value, this._then);

  final GeoError _value;
  // ignore: unused_field
  final $Res Function(GeoError) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? detail = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed ? _value.status : status as String?,
      detail: detail == freezed ? _value.detail : detail as String?,
      code: code == freezed ? _value.code : code as int?,
    ));
  }
}

/// @nodoc
abstract class _$GeoErrorCopyWith<$Res> implements $GeoErrorCopyWith<$Res> {
  factory _$GeoErrorCopyWith(_GeoError value, $Res Function(_GeoError) then) =
      __$GeoErrorCopyWithImpl<$Res>;
  @override
  $Res call({String? status, String? detail, int? code});
}

/// @nodoc
class __$GeoErrorCopyWithImpl<$Res> extends _$GeoErrorCopyWithImpl<$Res>
    implements _$GeoErrorCopyWith<$Res> {
  __$GeoErrorCopyWithImpl(_GeoError _value, $Res Function(_GeoError) _then)
      : super(_value, (v) => _then(v as _GeoError));

  @override
  _GeoError get _value => super._value as _GeoError;

  @override
  $Res call({
    Object? status = freezed,
    Object? detail = freezed,
    Object? code = freezed,
  }) {
    return _then(_GeoError(
      status: status == freezed ? _value.status : status as String?,
      detail: detail == freezed ? _value.detail : detail as String?,
      code: code == freezed ? _value.code : code as int?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GeoError implements _GeoError {
  const _$_GeoError({this.status, this.detail, this.code});

  factory _$_GeoError.fromJson(Map<String, dynamic> json) =>
      _$_$_GeoErrorFromJson(json);

  @override
  final String? status;
  @override
  final String? detail;
  @override
  final int? code;

  @override
  String toString() {
    return 'GeoError(status: $status, detail: $detail, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GeoError &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(detail) ^
      const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$GeoErrorCopyWith<_GeoError> get copyWith =>
      __$GeoErrorCopyWithImpl<_GeoError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GeoErrorToJson(this);
  }
}

abstract class _GeoError implements GeoError {
  const factory _GeoError({String? status, String? detail, int? code}) =
      _$_GeoError;

  factory _GeoError.fromJson(Map<String, dynamic> json) = _$_GeoError.fromJson;

  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get detail => throw _privateConstructorUsedError;
  @override
  int? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GeoErrorCopyWith<_GeoError> get copyWith =>
      throw _privateConstructorUsedError;
}
