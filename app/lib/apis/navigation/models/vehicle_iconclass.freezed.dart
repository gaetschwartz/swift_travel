// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vehicle_iconclass.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

_VehicleIconclass _$_VehicleIconclassFromJson(Map<String, dynamic> json) {
  return __VehicleIconclass.fromJson(json);
}

/// @nodoc
class _$_VehicleIconclassTearOff {
  const _$_VehicleIconclassTearOff();

  __VehicleIconclass call(TransportationMode v) {
    return __VehicleIconclass(
      v,
    );
  }

  _VehicleIconclass fromJson(Map<String, Object> json) {
    return _VehicleIconclass.fromJson(json);
  }
}

/// @nodoc
const _$VehicleIconclass = _$_VehicleIconclassTearOff();

/// @nodoc
mixin _$_VehicleIconclass {
  TransportationMode get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$VehicleIconclassCopyWith<_VehicleIconclass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$VehicleIconclassCopyWith<$Res> {
  factory _$VehicleIconclassCopyWith(
          _VehicleIconclass value, $Res Function(_VehicleIconclass) then) =
      __$VehicleIconclassCopyWithImpl<$Res>;
  $Res call({TransportationMode v});
}

/// @nodoc
class __$VehicleIconclassCopyWithImpl<$Res>
    implements _$VehicleIconclassCopyWith<$Res> {
  __$VehicleIconclassCopyWithImpl(this._value, this._then);

  final _VehicleIconclass _value;
  // ignore: unused_field
  final $Res Function(_VehicleIconclass) _then;

  @override
  $Res call({
    Object? v = freezed,
  }) {
    return _then(_value.copyWith(
      v: v == freezed
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as TransportationMode,
    ));
  }
}

/// @nodoc
abstract class _$_VehicleIconclassCopyWith<$Res>
    implements _$VehicleIconclassCopyWith<$Res> {
  factory _$_VehicleIconclassCopyWith(
          __VehicleIconclass value, $Res Function(__VehicleIconclass) then) =
      __$_VehicleIconclassCopyWithImpl<$Res>;
  @override
  $Res call({TransportationMode v});
}

/// @nodoc
class __$_VehicleIconclassCopyWithImpl<$Res>
    extends __$VehicleIconclassCopyWithImpl<$Res>
    implements _$_VehicleIconclassCopyWith<$Res> {
  __$_VehicleIconclassCopyWithImpl(
      __VehicleIconclass _value, $Res Function(__VehicleIconclass) _then)
      : super(_value, (v) => _then(v as __VehicleIconclass));

  @override
  __VehicleIconclass get _value => super._value as __VehicleIconclass;

  @override
  $Res call({
    Object? v = freezed,
  }) {
    return _then(__VehicleIconclass(
      v == freezed
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as TransportationMode,
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
  final TransportationMode v;

  @override
  String toString() {
    return '_VehicleIconclass(v: $v)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is __VehicleIconclass &&
            (identical(other.v, v) ||
                const DeepCollectionEquality().equals(other.v, v)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(v);

  @JsonKey(ignore: true)
  @override
  _$_VehicleIconclassCopyWith<__VehicleIconclass> get copyWith =>
      __$_VehicleIconclassCopyWithImpl<__VehicleIconclass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$__VehicleIconclassToJson(this);
  }
}

abstract class __VehicleIconclass implements _VehicleIconclass {
  const factory __VehicleIconclass(TransportationMode v) = _$__VehicleIconclass;

  factory __VehicleIconclass.fromJson(Map<String, dynamic> json) =
      _$__VehicleIconclass.fromJson;

  @override
  TransportationMode get v => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$_VehicleIconclassCopyWith<__VehicleIconclass> get copyWith =>
      throw _privateConstructorUsedError;
}
