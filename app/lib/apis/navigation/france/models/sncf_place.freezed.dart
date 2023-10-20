// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
abstract class _$$SncfPlaceImplCopyWith<$Res>
    implements $SncfPlaceCopyWith<$Res> {
  factory _$$SncfPlaceImplCopyWith(
          _$SncfPlaceImpl value, $Res Function(_$SncfPlaceImpl) then) =
      __$$SncfPlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? id, String? favoriteName});
}

/// @nodoc
class __$$SncfPlaceImplCopyWithImpl<$Res>
    extends _$SncfPlaceCopyWithImpl<$Res, _$SncfPlaceImpl>
    implements _$$SncfPlaceImplCopyWith<$Res> {
  __$$SncfPlaceImplCopyWithImpl(
      _$SncfPlaceImpl _value, $Res Function(_$SncfPlaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = freezed,
    Object? favoriteName = freezed,
  }) {
    return _then(_$SncfPlaceImpl(
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
class _$SncfPlaceImpl extends _SncfPlace {
  const _$SncfPlaceImpl({required this.name, this.id, this.favoriteName})
      : super._();

  factory _$SncfPlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SncfPlaceImplFromJson(json);

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
            other is _$SncfPlaceImpl &&
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
  _$$SncfPlaceImplCopyWith<_$SncfPlaceImpl> get copyWith =>
      __$$SncfPlaceImplCopyWithImpl<_$SncfPlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SncfPlaceImplToJson(
      this,
    );
  }
}

abstract class _SncfPlace extends SncfPlace {
  const factory _SncfPlace(
      {required final String name,
      final String? id,
      final String? favoriteName}) = _$SncfPlaceImpl;
  const _SncfPlace._() : super._();

  factory _SncfPlace.fromJson(Map<String, dynamic> json) =
      _$SncfPlaceImpl.fromJson;

  @override
  String get name;
  @override
  String? get id;
  @override
  String? get favoriteName;
  @override
  @JsonKey(ignore: true)
  _$$SncfPlaceImplCopyWith<_$SncfPlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
