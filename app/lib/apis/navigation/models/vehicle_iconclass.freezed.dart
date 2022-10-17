// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vehicle_iconclass.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

_VehicleIconclass _$_VehicleIconclassFromJson(Map<String, dynamic> json) {
  return __VehicleIconclass.fromJson(json);
}

/// @nodoc
mixin _$_VehicleIconclass {
  PlaceType get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$VehicleIconclassCopyWith<_VehicleIconclass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$VehicleIconclassCopyWith<$Res> {
  factory _$VehicleIconclassCopyWith(
          _VehicleIconclass value, $Res Function(_VehicleIconclass) then) =
      __$VehicleIconclassCopyWithImpl<$Res, _VehicleIconclass>;
  @useResult
  $Res call({PlaceType v});
}

/// @nodoc
class __$VehicleIconclassCopyWithImpl<$Res, $Val extends _VehicleIconclass>
    implements _$VehicleIconclassCopyWith<$Res> {
  __$VehicleIconclassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_value.copyWith(
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as PlaceType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$__VehicleIconclassCopyWith<$Res>
    implements _$VehicleIconclassCopyWith<$Res> {
  factory _$$__VehicleIconclassCopyWith(_$__VehicleIconclass value,
          $Res Function(_$__VehicleIconclass) then) =
      __$$__VehicleIconclassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlaceType v});
}

/// @nodoc
class __$$__VehicleIconclassCopyWithImpl<$Res>
    extends __$VehicleIconclassCopyWithImpl<$Res, _$__VehicleIconclass>
    implements _$$__VehicleIconclassCopyWith<$Res> {
  __$$__VehicleIconclassCopyWithImpl(
      _$__VehicleIconclass _value, $Res Function(_$__VehicleIconclass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$__VehicleIconclass(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as PlaceType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$__VehicleIconclass implements __VehicleIconclass {
  const _$__VehicleIconclass(this.v);

  factory _$__VehicleIconclass.fromJson(Map<String, dynamic> json) =>
      _$$__VehicleIconclassFromJson(json);

  @override
  final PlaceType v;

  @override
  String toString() {
    return '_VehicleIconclass(v: $v)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$__VehicleIconclass &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$__VehicleIconclassCopyWith<_$__VehicleIconclass> get copyWith =>
      __$$__VehicleIconclassCopyWithImpl<_$__VehicleIconclass>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$__VehicleIconclassToJson(
      this,
    );
  }
}

abstract class __VehicleIconclass implements _VehicleIconclass {
  const factory __VehicleIconclass(final PlaceType v) = _$__VehicleIconclass;

  factory __VehicleIconclass.fromJson(Map<String, dynamic> json) =
      _$__VehicleIconclass.fromJson;

  @override
  PlaceType get v;
  @override
  @JsonKey(ignore: true)
  _$$__VehicleIconclassCopyWith<_$__VehicleIconclass> get copyWith =>
      throw _privateConstructorUsedError;
}
