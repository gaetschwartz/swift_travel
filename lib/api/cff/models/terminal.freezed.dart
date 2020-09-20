// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'terminal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Terminal _$TerminalFromJson(Map<String, dynamic> json) {
  return _Terminal.fromJson(json);
}

/// @nodoc
class _$TerminalTearOff {
  const _$TerminalTearOff();

// ignore: unused_element
  _Terminal call({String id, String name, int x, int y}) {
    return _Terminal(
      id: id,
      name: name,
      x: x,
      y: y,
    );
  }

// ignore: unused_element
  Terminal fromJson(Map<String, Object> json) {
    return Terminal.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Terminal = _$TerminalTearOff();

/// @nodoc
mixin _$Terminal {
  String get id;
  String get name;
  int get x;
  int get y;

  Map<String, dynamic> toJson();
  $TerminalCopyWith<Terminal> get copyWith;
}

/// @nodoc
abstract class $TerminalCopyWith<$Res> {
  factory $TerminalCopyWith(Terminal value, $Res Function(Terminal) then) =
      _$TerminalCopyWithImpl<$Res>;
  $Res call({String id, String name, int x, int y});
}

/// @nodoc
class _$TerminalCopyWithImpl<$Res> implements $TerminalCopyWith<$Res> {
  _$TerminalCopyWithImpl(this._value, this._then);

  final Terminal _value;
  // ignore: unused_field
  final $Res Function(Terminal) _then;

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
      x: x == freezed ? _value.x : x as int,
      y: y == freezed ? _value.y : y as int,
    ));
  }
}

/// @nodoc
abstract class _$TerminalCopyWith<$Res> implements $TerminalCopyWith<$Res> {
  factory _$TerminalCopyWith(_Terminal value, $Res Function(_Terminal) then) =
      __$TerminalCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, int x, int y});
}

/// @nodoc
class __$TerminalCopyWithImpl<$Res> extends _$TerminalCopyWithImpl<$Res>
    implements _$TerminalCopyWith<$Res> {
  __$TerminalCopyWithImpl(_Terminal _value, $Res Function(_Terminal) _then)
      : super(_value, (v) => _then(v as _Terminal));

  @override
  _Terminal get _value => super._value as _Terminal;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object x = freezed,
    Object y = freezed,
  }) {
    return _then(_Terminal(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      x: x == freezed ? _value.x : x as int,
      y: y == freezed ? _value.y : y as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Terminal implements _Terminal {
  _$_Terminal({this.id, this.name, this.x, this.y});

  factory _$_Terminal.fromJson(Map<String, dynamic> json) =>
      _$_$_TerminalFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int x;
  @override
  final int y;

  @override
  String toString() {
    return 'Terminal(id: $id, name: $name, x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Terminal &&
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
  _$TerminalCopyWith<_Terminal> get copyWith =>
      __$TerminalCopyWithImpl<_Terminal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TerminalToJson(this);
  }
}

abstract class _Terminal implements Terminal {
  factory _Terminal({String id, String name, int x, int y}) = _$_Terminal;

  factory _Terminal.fromJson(Map<String, dynamic> json) = _$_Terminal.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get x;
  @override
  int get y;
  @override
  _$TerminalCopyWith<_Terminal> get copyWith;
}
