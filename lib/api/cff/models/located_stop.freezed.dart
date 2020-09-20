// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'located_stop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
LocatedStop _$LocatedStopFromJson(Map<String, dynamic> json) {
  return _LocatedStop.fromJson(json);
}

class _$LocatedStopTearOff {
  const _$LocatedStopTearOff();

// ignore: unused_element
  _LocatedStop call(String id, String name, String x, String y) {
    return _LocatedStop(
      id,
      name,
      x,
      y,
    );
  }
}

// ignore: unused_element
const $LocatedStop = _$LocatedStopTearOff();

mixin _$LocatedStop {
  String get id;
  String get name;
  String get x;
  String get y;

  Map<String, dynamic> toJson();
  $LocatedStopCopyWith<LocatedStop> get copyWith;
}

abstract class $LocatedStopCopyWith<$Res> {
  factory $LocatedStopCopyWith(
          LocatedStop value, $Res Function(LocatedStop) then) =
      _$LocatedStopCopyWithImpl<$Res>;
  $Res call({String id, String name, String x, String y});
}

class _$LocatedStopCopyWithImpl<$Res> implements $LocatedStopCopyWith<$Res> {
  _$LocatedStopCopyWithImpl(this._value, this._then);

  final LocatedStop _value;
  // ignore: unused_field
  final $Res Function(LocatedStop) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object x = freezed,
    Object y = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      x: x == freezed ? _value.x : x as String,
      y: y == freezed ? _value.y : y as String,
    ));
  }
}

abstract class _$LocatedStopCopyWith<$Res>
    implements $LocatedStopCopyWith<$Res> {
  factory _$LocatedStopCopyWith(
          _LocatedStop value, $Res Function(_LocatedStop) then) =
      __$LocatedStopCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String x, String y});
}

class __$LocatedStopCopyWithImpl<$Res> extends _$LocatedStopCopyWithImpl<$Res>
    implements _$LocatedStopCopyWith<$Res> {
  __$LocatedStopCopyWithImpl(
      _LocatedStop _value, $Res Function(_LocatedStop) _then)
      : super(_value, (v) => _then(v as _LocatedStop));

  @override
  _LocatedStop get _value => super._value as _LocatedStop;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object x = freezed,
    Object y = freezed,
  }) {
    return _then(_LocatedStop(
      id == freezed ? _value.id : id as String,
      name == freezed ? _value.name : name as String,
      x == freezed ? _value.x : x as String,
      y == freezed ? _value.y : y as String,
    ));
  }
}

@JsonSerializable()
class _$_LocatedStop implements _LocatedStop {
  _$_LocatedStop(this.id, this.name, this.x, this.y)
      : assert(id != null),
        assert(name != null),
        assert(x != null),
        assert(y != null);

  factory _$_LocatedStop.fromJson(Map<String, dynamic> json) =>
      _$_$_LocatedStopFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String x;
  @override
  final String y;

  @override
  String toString() {
    return 'LocatedStop(id: $id, name: $name, x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocatedStop &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.x, x) ||
                const DeepCollectionEquality().equals(other.x, x)) &&
            (identical(other.y, y) ||
                const DeepCollectionEquality().equals(other.y, y)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(x) ^
      const DeepCollectionEquality().hash(y);

  @override
  _$LocatedStopCopyWith<_LocatedStop> get copyWith =>
      __$LocatedStopCopyWithImpl<_LocatedStop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LocatedStopToJson(this);
  }
}

abstract class _LocatedStop implements LocatedStop {
  factory _LocatedStop(String id, String name, String x, String y) =
      _$_LocatedStop;

  factory _LocatedStop.fromJson(Map<String, dynamic> json) =
      _$_LocatedStop.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get x;
  @override
  String get y;
  @override
  _$LocatedStopCopyWith<_LocatedStop> get copyWith;
}
