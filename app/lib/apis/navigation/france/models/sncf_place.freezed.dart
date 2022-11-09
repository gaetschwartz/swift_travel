// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sncf_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SncfPlace _$SncfPlaceFromJson(Map<String, dynamic> json) {
  return _SncfPlace.fromJson(json);
}

/// @nodoc
mixin _$SncfPlace {
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
      _$SncfPlaceCopyWithImpl<$Res, SncfPlace>;
  @useResult
  $Res call({String name, String? id, String? favoriteName});
}

/// @nodoc
class _$SncfPlaceCopyWithImpl<$Res, $Val extends SncfPlace>
    implements $SncfPlaceCopyWith<$Res> {
  _$SncfPlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = freezed,
    Object? favoriteName = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      favoriteName: freezed == favoriteName
          ? _value.favoriteName
          : favoriteName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SncfPlaceCopyWith<$Res> implements $SncfPlaceCopyWith<$Res> {
  factory _$$_SncfPlaceCopyWith(
          _$_SncfPlace value, $Res Function(_$_SncfPlace) then) =
      __$$_SncfPlaceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? id, String? favoriteName});
}

/// @nodoc
class __$$_SncfPlaceCopyWithImpl<$Res>
    extends _$SncfPlaceCopyWithImpl<$Res, _$_SncfPlace>
    implements _$$_SncfPlaceCopyWith<$Res> {
  __$$_SncfPlaceCopyWithImpl(
      _$_SncfPlace _value, $Res Function(_$_SncfPlace) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = freezed,
    Object? favoriteName = freezed,
  }) {
    return _then(_$_SncfPlace(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      favoriteName: freezed == favoriteName
          ? _value.favoriteName
          : favoriteName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SncfPlace extends _SncfPlace {
  const _$_SncfPlace({required this.name, this.id, this.favoriteName})
      : super._();

  factory _$_SncfPlace.fromJson(Map<String, dynamic> json) =>
      _$$_SncfPlaceFromJson(json);

  @override
  final String name;
  @override
  final String? id;
  @override
  final String? favoriteName;

  @override
  String toString() {
    return 'SncfPlace(name: $name, id: $id, favoriteName: $favoriteName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SncfPlace &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.favoriteName, favoriteName) ||
                other.favoriteName == favoriteName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, favoriteName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SncfPlaceCopyWith<_$_SncfPlace> get copyWith =>
      __$$_SncfPlaceCopyWithImpl<_$_SncfPlace>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfPlaceToJson(
      this,
    );
  }
}

abstract class _SncfPlace extends SncfPlace {
  const factory _SncfPlace(
      {required final String name,
      final String? id,
      final String? favoriteName}) = _$_SncfPlace;
  const _SncfPlace._() : super._();

  factory _SncfPlace.fromJson(Map<String, dynamic> json) =
      _$_SncfPlace.fromJson;

  @override
  String get name;
  @override
  String? get id;
  @override
  String? get favoriteName;
  @override
  @JsonKey(ignore: true)
  _$$_SncfPlaceCopyWith<_$_SncfPlace> get copyWith =>
      throw _privateConstructorUsedError;
}
