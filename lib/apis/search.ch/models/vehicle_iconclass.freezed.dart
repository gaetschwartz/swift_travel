// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'vehicle_iconclass.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
VehicleIconclass _$VehicleIconclassFromJson(Map<String, dynamic> json) {
  return _VehicleIconclass.fromJson(json);
}

/// @nodoc
class _$VehicleIconclassTearOff {
  const _$VehicleIconclassTearOff();

// ignore: unused_element
  _VehicleIconclass call(@nullable Vehicle v) {
    return _VehicleIconclass(
      v,
    );
  }

// ignore: unused_element
  VehicleIconclass fromJson(Map<String, Object> json) {
    return VehicleIconclass.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $VehicleIconclass = _$VehicleIconclassTearOff();

/// @nodoc
mixin _$VehicleIconclass {
  @nullable
  Vehicle get v;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $VehicleIconclassCopyWith<VehicleIconclass> get copyWith;
}

/// @nodoc
abstract class $VehicleIconclassCopyWith<$Res> {
  factory $VehicleIconclassCopyWith(
          VehicleIconclass value, $Res Function(VehicleIconclass) then) =
      _$VehicleIconclassCopyWithImpl<$Res>;
  $Res call({@nullable Vehicle v});
}

/// @nodoc
class _$VehicleIconclassCopyWithImpl<$Res>
    implements $VehicleIconclassCopyWith<$Res> {
  _$VehicleIconclassCopyWithImpl(this._value, this._then);

  final VehicleIconclass _value;
  // ignore: unused_field
  final $Res Function(VehicleIconclass) _then;

  @override
  $Res call({
    Object v = freezed,
  }) {
    return _then(_value.copyWith(
      v: v == freezed ? _value.v : v as Vehicle,
    ));
  }
}

/// @nodoc
abstract class _$VehicleIconclassCopyWith<$Res>
    implements $VehicleIconclassCopyWith<$Res> {
  factory _$VehicleIconclassCopyWith(
          _VehicleIconclass value, $Res Function(_VehicleIconclass) then) =
      __$VehicleIconclassCopyWithImpl<$Res>;
  @override
  $Res call({@nullable Vehicle v});
}

/// @nodoc
class __$VehicleIconclassCopyWithImpl<$Res>
    extends _$VehicleIconclassCopyWithImpl<$Res>
    implements _$VehicleIconclassCopyWith<$Res> {
  __$VehicleIconclassCopyWithImpl(
      _VehicleIconclass _value, $Res Function(_VehicleIconclass) _then)
      : super(_value, (v) => _then(v as _VehicleIconclass));

  @override
  _VehicleIconclass get _value => super._value as _VehicleIconclass;

  @override
  $Res call({
    Object v = freezed,
  }) {
    return _then(_VehicleIconclass(
      v == freezed ? _value.v : v as Vehicle,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_VehicleIconclass implements _VehicleIconclass {
  _$_VehicleIconclass(@nullable this.v);

  factory _$_VehicleIconclass.fromJson(Map<String, dynamic> json) =>
      _$_$_VehicleIconclassFromJson(json);

  @override
  @nullable
  final Vehicle v;

  @override
  String toString() {
    return 'VehicleIconclass(v: $v)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VehicleIconclass &&
            (identical(other.v, v) ||
                const DeepCollectionEquality().equals(other.v, v)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(v);

  @JsonKey(ignore: true)
  @override
  _$VehicleIconclassCopyWith<_VehicleIconclass> get copyWith =>
      __$VehicleIconclassCopyWithImpl<_VehicleIconclass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_VehicleIconclassToJson(this);
  }
}

abstract class _VehicleIconclass implements VehicleIconclass {
  factory _VehicleIconclass(@nullable Vehicle v) = _$_VehicleIconclass;

  factory _VehicleIconclass.fromJson(Map<String, dynamic> json) =
      _$_VehicleIconclass.fromJson;

  @override
  @nullable
  Vehicle get v;
  @override
  @JsonKey(ignore: true)
  _$VehicleIconclassCopyWith<_VehicleIconclass> get copyWith;
}
