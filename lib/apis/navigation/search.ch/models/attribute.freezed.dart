// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'attribute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using MyClass._() or by manually adding another constructor. The MyClass._() constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AttributeTearOff {
  const _$AttributeTearOff();

  _Attribute call(
      {required String code,
      Widget? icon,
      String? message,
      bool ignore = false}) {
    return _Attribute(
      code: code,
      icon: icon,
      message: message,
      ignore: ignore,
    );
  }
}

/// @nodoc
const $Attribute = _$AttributeTearOff();

/// @nodoc
mixin _$Attribute {
  String get code => throw _privateConstructorUsedError;
  Widget? get icon => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool get ignore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttributeCopyWith<Attribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributeCopyWith<$Res> {
  factory $AttributeCopyWith(Attribute value, $Res Function(Attribute) then) =
      _$AttributeCopyWithImpl<$Res>;
  $Res call({String code, Widget? icon, String? message, bool ignore});
}

/// @nodoc
class _$AttributeCopyWithImpl<$Res> implements $AttributeCopyWith<$Res> {
  _$AttributeCopyWithImpl(this._value, this._then);

  final Attribute _value;
  // ignore: unused_field
  final $Res Function(Attribute) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? icon = freezed,
    Object? message = freezed,
    Object? ignore = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed ? _value.code : code as String,
      icon: icon == freezed ? _value.icon : icon as Widget?,
      message: message == freezed ? _value.message : message as String?,
      ignore: ignore == freezed ? _value.ignore : ignore as bool,
    ));
  }
}

/// @nodoc
abstract class _$AttributeCopyWith<$Res> implements $AttributeCopyWith<$Res> {
  factory _$AttributeCopyWith(
          _Attribute value, $Res Function(_Attribute) then) =
      __$AttributeCopyWithImpl<$Res>;
  @override
  $Res call({String code, Widget? icon, String? message, bool ignore});
}

/// @nodoc
class __$AttributeCopyWithImpl<$Res> extends _$AttributeCopyWithImpl<$Res>
    implements _$AttributeCopyWith<$Res> {
  __$AttributeCopyWithImpl(_Attribute _value, $Res Function(_Attribute) _then)
      : super(_value, (v) => _then(v as _Attribute));

  @override
  _Attribute get _value => super._value as _Attribute;

  @override
  $Res call({
    Object? code = freezed,
    Object? icon = freezed,
    Object? message = freezed,
    Object? ignore = freezed,
  }) {
    return _then(_Attribute(
      code: code == freezed ? _value.code : code as String,
      icon: icon == freezed ? _value.icon : icon as Widget?,
      message: message == freezed ? _value.message : message as String?,
      ignore: ignore == freezed ? _value.ignore : ignore as bool,
    ));
  }
}

/// @nodoc
class _$_Attribute implements _Attribute {
  const _$_Attribute(
      {required this.code, this.icon, this.message, this.ignore = false});

  @override
  final String code;
  @override
  final Widget? icon;
  @override
  final String? message;
  @JsonKey(defaultValue: false)
  @override
  final bool ignore;

  @override
  String toString() {
    return 'Attribute(code: $code, icon: $icon, message: $message, ignore: $ignore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Attribute &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.ignore, ignore) ||
                const DeepCollectionEquality().equals(other.ignore, ignore)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(ignore);

  @JsonKey(ignore: true)
  @override
  _$AttributeCopyWith<_Attribute> get copyWith =>
      __$AttributeCopyWithImpl<_Attribute>(this, _$identity);
}

abstract class _Attribute implements Attribute {
  const factory _Attribute(
      {required String code,
      Widget? icon,
      String? message,
      bool ignore}) = _$_Attribute;

  @override
  String get code => throw _privateConstructorUsedError;
  @override
  Widget? get icon => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  bool get ignore => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AttributeCopyWith<_Attribute> get copyWith =>
      throw _privateConstructorUsedError;
}
