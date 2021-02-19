// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sncf_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using MyClass._() or by manually adding another constructor. The MyClass._() constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');
SncfPlace _$SncfPlaceFromJson(Map<String, dynamic> json) {
  return _SncfPlace.fromJson(json);
}

/// @nodoc
class _$SncfPlaceTearOff {
  const _$SncfPlaceTearOff();

  _SncfPlace call(
      {String? embeddedType,
      int? quality,
      SncfAdministrativeRegion? administrativeRegion,
      required String name,
      String? id,
      String? favoriteName}) {
    return _SncfPlace(
      embeddedType: embeddedType,
      quality: quality,
      administrativeRegion: administrativeRegion,
      name: name,
      id: id,
      favoriteName: favoriteName,
    );
  }

  SncfPlace fromJson(Map<String, Object> json) {
    return SncfPlace.fromJson(json);
  }
}

/// @nodoc
const $SncfPlace = _$SncfPlaceTearOff();

/// @nodoc
mixin _$SncfPlace {
  String? get embeddedType => throw _privateConstructorUsedError;
  int? get quality => throw _privateConstructorUsedError;
  SncfAdministrativeRegion? get administrativeRegion =>
      throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get favoriteName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SncfPlaceCopyWith<SncfPlace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SncfPlaceCopyWith<$Res> {
  factory $SncfPlaceCopyWith(SncfPlace value, $Res Function(SncfPlace) then) =
      _$SncfPlaceCopyWithImpl<$Res>;
  $Res call(
      {String? embeddedType,
      int? quality,
      SncfAdministrativeRegion? administrativeRegion,
      String name,
      String? id,
      String? favoriteName});

  $SncfAdministrativeRegionCopyWith<$Res>? get administrativeRegion;
}

/// @nodoc
class _$SncfPlaceCopyWithImpl<$Res> implements $SncfPlaceCopyWith<$Res> {
  _$SncfPlaceCopyWithImpl(this._value, this._then);

  final SncfPlace _value;
  // ignore: unused_field
  final $Res Function(SncfPlace) _then;

  @override
  $Res call({
    Object? embeddedType = freezed,
    Object? quality = freezed,
    Object? administrativeRegion = freezed,
    Object? name = freezed,
    Object? id = freezed,
    Object? favoriteName = freezed,
  }) {
    return _then(_value.copyWith(
      embeddedType: embeddedType == freezed
          ? _value.embeddedType
          : embeddedType as String?,
      quality: quality == freezed ? _value.quality : quality as int?,
      administrativeRegion: administrativeRegion == freezed
          ? _value.administrativeRegion
          : administrativeRegion as SncfAdministrativeRegion?,
      name: name == freezed ? _value.name : name as String,
      id: id == freezed ? _value.id : id as String?,
      favoriteName: favoriteName == freezed
          ? _value.favoriteName
          : favoriteName as String?,
    ));
  }

  @override
  $SncfAdministrativeRegionCopyWith<$Res>? get administrativeRegion {
    if (_value.administrativeRegion == null) {
      return null;
    }

    return $SncfAdministrativeRegionCopyWith<$Res>(_value.administrativeRegion!,
        (value) {
      return _then(_value.copyWith(administrativeRegion: value));
    });
  }
}

/// @nodoc
abstract class _$SncfPlaceCopyWith<$Res> implements $SncfPlaceCopyWith<$Res> {
  factory _$SncfPlaceCopyWith(
          _SncfPlace value, $Res Function(_SncfPlace) then) =
      __$SncfPlaceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? embeddedType,
      int? quality,
      SncfAdministrativeRegion? administrativeRegion,
      String name,
      String? id,
      String? favoriteName});

  @override
  $SncfAdministrativeRegionCopyWith<$Res>? get administrativeRegion;
}

/// @nodoc
class __$SncfPlaceCopyWithImpl<$Res> extends _$SncfPlaceCopyWithImpl<$Res>
    implements _$SncfPlaceCopyWith<$Res> {
  __$SncfPlaceCopyWithImpl(_SncfPlace _value, $Res Function(_SncfPlace) _then)
      : super(_value, (v) => _then(v as _SncfPlace));

  @override
  _SncfPlace get _value => super._value as _SncfPlace;

  @override
  $Res call({
    Object? embeddedType = freezed,
    Object? quality = freezed,
    Object? administrativeRegion = freezed,
    Object? name = freezed,
    Object? id = freezed,
    Object? favoriteName = freezed,
  }) {
    return _then(_SncfPlace(
      embeddedType: embeddedType == freezed
          ? _value.embeddedType
          : embeddedType as String?,
      quality: quality == freezed ? _value.quality : quality as int?,
      administrativeRegion: administrativeRegion == freezed
          ? _value.administrativeRegion
          : administrativeRegion as SncfAdministrativeRegion?,
      name: name == freezed ? _value.name : name as String,
      id: id == freezed ? _value.id : id as String?,
      favoriteName: favoriteName == freezed
          ? _value.favoriteName
          : favoriteName as String?,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_SncfPlace extends _SncfPlace {
  const _$_SncfPlace(
      {this.embeddedType,
      this.quality,
      this.administrativeRegion,
      required this.name,
      this.id,
      this.favoriteName})
      : super._();

  factory _$_SncfPlace.fromJson(Map<String, dynamic> json) =>
      _$_$_SncfPlaceFromJson(json);

  @override
  final String? embeddedType;
  @override
  final int? quality;
  @override
  final SncfAdministrativeRegion? administrativeRegion;
  @override
  final String name;
  @override
  final String? id;
  @override
  final String? favoriteName;

  @override
  String toString() {
    return 'SncfPlace(embeddedType: $embeddedType, quality: $quality, administrativeRegion: $administrativeRegion, name: $name, id: $id, favoriteName: $favoriteName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SncfPlace &&
            (identical(other.embeddedType, embeddedType) ||
                const DeepCollectionEquality()
                    .equals(other.embeddedType, embeddedType)) &&
            (identical(other.quality, quality) ||
                const DeepCollectionEquality()
                    .equals(other.quality, quality)) &&
            (identical(other.administrativeRegion, administrativeRegion) ||
                const DeepCollectionEquality().equals(
                    other.administrativeRegion, administrativeRegion)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.favoriteName, favoriteName) ||
                const DeepCollectionEquality()
                    .equals(other.favoriteName, favoriteName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(embeddedType) ^
      const DeepCollectionEquality().hash(quality) ^
      const DeepCollectionEquality().hash(administrativeRegion) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(favoriteName);

  @JsonKey(ignore: true)
  @override
  _$SncfPlaceCopyWith<_SncfPlace> get copyWith =>
      __$SncfPlaceCopyWithImpl<_SncfPlace>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SncfPlaceToJson(this);
  }
}

abstract class _SncfPlace extends SncfPlace {
  const _SncfPlace._() : super._();
  const factory _SncfPlace(
      {String? embeddedType,
      int? quality,
      SncfAdministrativeRegion? administrativeRegion,
      required String name,
      String? id,
      String? favoriteName}) = _$_SncfPlace;

  factory _SncfPlace.fromJson(Map<String, dynamic> json) =
      _$_SncfPlace.fromJson;

  @override
  String? get embeddedType => throw _privateConstructorUsedError;
  @override
  int? get quality => throw _privateConstructorUsedError;
  @override
  SncfAdministrativeRegion? get administrativeRegion =>
      throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get favoriteName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SncfPlaceCopyWith<_SncfPlace> get copyWith =>
      throw _privateConstructorUsedError;
}
