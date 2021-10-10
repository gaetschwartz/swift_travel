// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attribute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AttributeTearOff {
  const _$AttributeTearOff();

  _Attribute call({required String code, String? message}) {
    return _Attribute(
      code: code,
      message: message,
    );
  }
}

/// @nodoc
const $Attribute = _$AttributeTearOff();

/// @nodoc
mixin _$Attribute {
  String get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttributeCopyWith<Attribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributeCopyWith<$Res> {
  factory $AttributeCopyWith(Attribute value, $Res Function(Attribute) then) =
      _$AttributeCopyWithImpl<$Res>;
  $Res call({String code, String? message});
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
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AttributeCopyWith<$Res> implements $AttributeCopyWith<$Res> {
  factory _$AttributeCopyWith(
          _Attribute value, $Res Function(_Attribute) then) =
      __$AttributeCopyWithImpl<$Res>;
  @override
  $Res call({String code, String? message});
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
    Object? message = freezed,
  }) {
    return _then(_Attribute(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Attribute extends _Attribute {
  _$_Attribute({required this.code, this.message}) : super._();

  @override
  final String code;
  @override
  final String? message;

  @override
  String toString() {
    return 'Attribute(code: $code, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Attribute &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @JsonKey(ignore: true)
  @override
  _$AttributeCopyWith<_Attribute> get copyWith =>
      __$AttributeCopyWithImpl<_Attribute>(this, _$identity);
}

abstract class _Attribute extends Attribute {
  factory _Attribute({required String code, String? message}) = _$_Attribute;
  _Attribute._() : super._();

  @override
  String get code;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$AttributeCopyWith<_Attribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AttributeDataTearOff {
  const _$AttributeDataTearOff();

  _AttributeData call({Widget? icon, bool ignore = false}) {
    return _AttributeData(
      icon: icon,
      ignore: ignore,
    );
  }
}

/// @nodoc
const $AttributeData = _$AttributeDataTearOff();

/// @nodoc
mixin _$AttributeData {
  Widget? get icon => throw _privateConstructorUsedError;
  bool get ignore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttributeDataCopyWith<AttributeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributeDataCopyWith<$Res> {
  factory $AttributeDataCopyWith(
          AttributeData value, $Res Function(AttributeData) then) =
      _$AttributeDataCopyWithImpl<$Res>;
  $Res call({Widget? icon, bool ignore});
}

/// @nodoc
class _$AttributeDataCopyWithImpl<$Res>
    implements $AttributeDataCopyWith<$Res> {
  _$AttributeDataCopyWithImpl(this._value, this._then);

  final AttributeData _value;
  // ignore: unused_field
  final $Res Function(AttributeData) _then;

  @override
  $Res call({
    Object? icon = freezed,
    Object? ignore = freezed,
  }) {
    return _then(_value.copyWith(
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget?,
      ignore: ignore == freezed
          ? _value.ignore
          : ignore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AttributeDataCopyWith<$Res>
    implements $AttributeDataCopyWith<$Res> {
  factory _$AttributeDataCopyWith(
          _AttributeData value, $Res Function(_AttributeData) then) =
      __$AttributeDataCopyWithImpl<$Res>;
  @override
  $Res call({Widget? icon, bool ignore});
}

/// @nodoc
class __$AttributeDataCopyWithImpl<$Res>
    extends _$AttributeDataCopyWithImpl<$Res>
    implements _$AttributeDataCopyWith<$Res> {
  __$AttributeDataCopyWithImpl(
      _AttributeData _value, $Res Function(_AttributeData) _then)
      : super(_value, (v) => _then(v as _AttributeData));

  @override
  _AttributeData get _value => super._value as _AttributeData;

  @override
  $Res call({
    Object? icon = freezed,
    Object? ignore = freezed,
  }) {
    return _then(_AttributeData(
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget?,
      ignore: ignore == freezed
          ? _value.ignore
          : ignore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AttributeData implements _AttributeData {
  const _$_AttributeData({this.icon, this.ignore = false});

  @override
  final Widget? icon;
  @JsonKey(defaultValue: false)
  @override
  final bool ignore;

  @override
  String toString() {
    return 'AttributeData(icon: $icon, ignore: $ignore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AttributeData &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.ignore, ignore) || other.ignore == ignore));
  }

  @override
  int get hashCode => Object.hash(runtimeType, icon, ignore);

  @JsonKey(ignore: true)
  @override
  _$AttributeDataCopyWith<_AttributeData> get copyWith =>
      __$AttributeDataCopyWithImpl<_AttributeData>(this, _$identity);
}

abstract class _AttributeData implements AttributeData {
  const factory _AttributeData({Widget? icon, bool ignore}) = _$_AttributeData;

  @override
  Widget? get icon;
  @override
  bool get ignore;
  @override
  @JsonKey(ignore: true)
  _$AttributeDataCopyWith<_AttributeData> get copyWith =>
      throw _privateConstructorUsedError;
}
