// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sncf_administrative_region.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SncfAdministrativeRegion _$SncfAdministrativeRegionFromJson(
    Map<String, dynamic> json) {
  return _SncfAdministrativeRegion.fromJson(json);
}

/// @nodoc
class _$SncfAdministrativeRegionTearOff {
  const _$SncfAdministrativeRegionTearOff();

// ignore: unused_element
  _SncfAdministrativeRegion call(
      {String insee,
      String name,
      int level,
      Coord coord,
      String label,
      String id,
      String zipCode}) {
    return _SncfAdministrativeRegion(
      insee: insee,
      name: name,
      level: level,
      coord: coord,
      label: label,
      id: id,
      zipCode: zipCode,
    );
  }

// ignore: unused_element
  SncfAdministrativeRegion fromJson(Map<String, Object> json) {
    return SncfAdministrativeRegion.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SncfAdministrativeRegion = _$SncfAdministrativeRegionTearOff();

/// @nodoc
mixin _$SncfAdministrativeRegion {
  String get insee;
  String get name;
  int get level;
  Coord get coord;
  String get label;
  String get id;
  String get zipCode;

  Map<String, dynamic> toJson();
  $SncfAdministrativeRegionCopyWith<SncfAdministrativeRegion> get copyWith;
}

/// @nodoc
abstract class $SncfAdministrativeRegionCopyWith<$Res> {
  factory $SncfAdministrativeRegionCopyWith(SncfAdministrativeRegion value,
          $Res Function(SncfAdministrativeRegion) then) =
      _$SncfAdministrativeRegionCopyWithImpl<$Res>;
  $Res call(
      {String insee,
      String name,
      int level,
      Coord coord,
      String label,
      String id,
      String zipCode});

  $CoordCopyWith<$Res> get coord;
}

/// @nodoc
class _$SncfAdministrativeRegionCopyWithImpl<$Res>
    implements $SncfAdministrativeRegionCopyWith<$Res> {
  _$SncfAdministrativeRegionCopyWithImpl(this._value, this._then);

  final SncfAdministrativeRegion _value;
  // ignore: unused_field
  final $Res Function(SncfAdministrativeRegion) _then;

  @override
  $Res call({
    Object insee = freezed,
    Object name = freezed,
    Object level = freezed,
    Object coord = freezed,
    Object label = freezed,
    Object id = freezed,
    Object zipCode = freezed,
  }) {
    return _then(_value.copyWith(
      insee: insee == freezed ? _value.insee : insee as String,
      name: name == freezed ? _value.name : name as String,
      level: level == freezed ? _value.level : level as int,
      coord: coord == freezed ? _value.coord : coord as Coord,
      label: label == freezed ? _value.label : label as String,
      id: id == freezed ? _value.id : id as String,
      zipCode: zipCode == freezed ? _value.zipCode : zipCode as String,
    ));
  }

  @override
  $CoordCopyWith<$Res> get coord {
    if (_value.coord == null) {
      return null;
    }
    return $CoordCopyWith<$Res>(_value.coord, (value) {
      return _then(_value.copyWith(coord: value));
    });
  }
}

/// @nodoc
abstract class _$SncfAdministrativeRegionCopyWith<$Res>
    implements $SncfAdministrativeRegionCopyWith<$Res> {
  factory _$SncfAdministrativeRegionCopyWith(_SncfAdministrativeRegion value,
          $Res Function(_SncfAdministrativeRegion) then) =
      __$SncfAdministrativeRegionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String insee,
      String name,
      int level,
      Coord coord,
      String label,
      String id,
      String zipCode});

  @override
  $CoordCopyWith<$Res> get coord;
}

/// @nodoc
class __$SncfAdministrativeRegionCopyWithImpl<$Res>
    extends _$SncfAdministrativeRegionCopyWithImpl<$Res>
    implements _$SncfAdministrativeRegionCopyWith<$Res> {
  __$SncfAdministrativeRegionCopyWithImpl(_SncfAdministrativeRegion _value,
      $Res Function(_SncfAdministrativeRegion) _then)
      : super(_value, (v) => _then(v as _SncfAdministrativeRegion));

  @override
  _SncfAdministrativeRegion get _value =>
      super._value as _SncfAdministrativeRegion;

  @override
  $Res call({
    Object insee = freezed,
    Object name = freezed,
    Object level = freezed,
    Object coord = freezed,
    Object label = freezed,
    Object id = freezed,
    Object zipCode = freezed,
  }) {
    return _then(_SncfAdministrativeRegion(
      insee: insee == freezed ? _value.insee : insee as String,
      name: name == freezed ? _value.name : name as String,
      level: level == freezed ? _value.level : level as int,
      coord: coord == freezed ? _value.coord : coord as Coord,
      label: label == freezed ? _value.label : label as String,
      id: id == freezed ? _value.id : id as String,
      zipCode: zipCode == freezed ? _value.zipCode : zipCode as String,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_SncfAdministrativeRegion extends _SncfAdministrativeRegion {
  _$_SncfAdministrativeRegion(
      {this.insee,
      this.name,
      this.level,
      this.coord,
      this.label,
      this.id,
      this.zipCode})
      : super._();

  factory _$_SncfAdministrativeRegion.fromJson(Map<String, dynamic> json) =>
      _$_$_SncfAdministrativeRegionFromJson(json);

  @override
  final String insee;
  @override
  final String name;
  @override
  final int level;
  @override
  final Coord coord;
  @override
  final String label;
  @override
  final String id;
  @override
  final String zipCode;

  @override
  String toString() {
    return 'SncfAdministrativeRegion(insee: $insee, name: $name, level: $level, coord: $coord, label: $label, id: $id, zipCode: $zipCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SncfAdministrativeRegion &&
            (identical(other.insee, insee) ||
                const DeepCollectionEquality().equals(other.insee, insee)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.coord, coord) ||
                const DeepCollectionEquality().equals(other.coord, coord)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.zipCode, zipCode) ||
                const DeepCollectionEquality().equals(other.zipCode, zipCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(insee) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(coord) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(zipCode);

  @override
  _$SncfAdministrativeRegionCopyWith<_SncfAdministrativeRegion> get copyWith =>
      __$SncfAdministrativeRegionCopyWithImpl<_SncfAdministrativeRegion>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SncfAdministrativeRegionToJson(this);
  }
}

abstract class _SncfAdministrativeRegion extends SncfAdministrativeRegion {
  _SncfAdministrativeRegion._() : super._();
  factory _SncfAdministrativeRegion(
      {String insee,
      String name,
      int level,
      Coord coord,
      String label,
      String id,
      String zipCode}) = _$_SncfAdministrativeRegion;

  factory _SncfAdministrativeRegion.fromJson(Map<String, dynamic> json) =
      _$_SncfAdministrativeRegion.fromJson;

  @override
  String get insee;
  @override
  String get name;
  @override
  int get level;
  @override
  Coord get coord;
  @override
  String get label;
  @override
  String get id;
  @override
  String get zipCode;
  @override
  _$SncfAdministrativeRegionCopyWith<_SncfAdministrativeRegion> get copyWith;
}
