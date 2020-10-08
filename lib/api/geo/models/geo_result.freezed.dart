// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'geo_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GeoResult _$GeoResultFromJson(Map<String, dynamic> json) {
  return _GeoResult.fromJson(json);
}

/// @nodoc
class _$GeoResultTearOff {
  const _$GeoResultTearOff();

// ignore: unused_element
  _GeoResult call({int id, int weight, GeoAttr attrs}) {
    return _GeoResult(
      id: id,
      weight: weight,
      attrs: attrs,
    );
  }

// ignore: unused_element
  GeoResult fromJson(Map<String, Object> json) {
    return GeoResult.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GeoResult = _$GeoResultTearOff();

/// @nodoc
mixin _$GeoResult {
  int get id;
  int get weight;
  GeoAttr get attrs;

  Map<String, dynamic> toJson();
  $GeoResultCopyWith<GeoResult> get copyWith;
}

/// @nodoc
abstract class $GeoResultCopyWith<$Res> {
  factory $GeoResultCopyWith(GeoResult value, $Res Function(GeoResult) then) =
      _$GeoResultCopyWithImpl<$Res>;
  $Res call({int id, int weight, GeoAttr attrs});

  $GeoAttrCopyWith<$Res> get attrs;
}

/// @nodoc
class _$GeoResultCopyWithImpl<$Res> implements $GeoResultCopyWith<$Res> {
  _$GeoResultCopyWithImpl(this._value, this._then);

  final GeoResult _value;
  // ignore: unused_field
  final $Res Function(GeoResult) _then;

  @override
  $Res call({
    Object id = freezed,
    Object weight = freezed,
    Object attrs = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      weight: weight == freezed ? _value.weight : weight as int,
      attrs: attrs == freezed ? _value.attrs : attrs as GeoAttr,
    ));
  }

  @override
  $GeoAttrCopyWith<$Res> get attrs {
    if (_value.attrs == null) {
      return null;
    }
    return $GeoAttrCopyWith<$Res>(_value.attrs, (value) {
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
  $Res call({int id, int weight, GeoAttr attrs});

  @override
  $GeoAttrCopyWith<$Res> get attrs;
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
    Object id = freezed,
    Object weight = freezed,
    Object attrs = freezed,
  }) {
    return _then(_GeoResult(
      id: id == freezed ? _value.id : id as int,
      weight: weight == freezed ? _value.weight : weight as int,
      attrs: attrs == freezed ? _value.attrs : attrs as GeoAttr,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_GeoResult implements _GeoResult {
  _$_GeoResult({this.id, this.weight, this.attrs});

  factory _$_GeoResult.fromJson(Map<String, dynamic> json) =>
      _$_$_GeoResultFromJson(json);

  @override
  final int id;
  @override
  final int weight;
  @override
  final GeoAttr attrs;

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

  @override
  _$GeoResultCopyWith<_GeoResult> get copyWith =>
      __$GeoResultCopyWithImpl<_GeoResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GeoResultToJson(this);
  }
}

abstract class _GeoResult implements GeoResult {
  factory _GeoResult({int id, int weight, GeoAttr attrs}) = _$_GeoResult;

  factory _GeoResult.fromJson(Map<String, dynamic> json) =
      _$_GeoResult.fromJson;

  @override
  int get id;
  @override
  int get weight;
  @override
  GeoAttr get attrs;
  @override
  _$GeoResultCopyWith<_GeoResult> get copyWith;
}
