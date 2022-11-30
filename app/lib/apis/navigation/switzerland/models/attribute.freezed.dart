// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attribute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$AttributeCopyWithImpl<$Res, Attribute>;
  @useResult
  $Res call({String code, String? message});
}

/// @nodoc
class _$AttributeCopyWithImpl<$Res, $Val extends Attribute>
    implements $AttributeCopyWith<$Res> {
  _$AttributeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AttributeCopyWith<$Res> implements $AttributeCopyWith<$Res> {
  factory _$$_AttributeCopyWith(
          _$_Attribute value, $Res Function(_$_Attribute) then) =
      __$$_AttributeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String? message});
}

/// @nodoc
class __$$_AttributeCopyWithImpl<$Res>
    extends _$AttributeCopyWithImpl<$Res, _$_Attribute>
    implements _$$_AttributeCopyWith<$Res> {
  __$$_AttributeCopyWithImpl(
      _$_Attribute _value, $Res Function(_$_Attribute) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
  }) {
    return _then(_$_Attribute(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
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
            other is _$_Attribute &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AttributeCopyWith<_$_Attribute> get copyWith =>
      __$$_AttributeCopyWithImpl<_$_Attribute>(this, _$identity);
}

abstract class _Attribute extends Attribute {
  factory _Attribute({required final String code, final String? message}) =
      _$_Attribute;
  _Attribute._() : super._();

  @override
  String get code;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_AttributeCopyWith<_$_Attribute> get copyWith =>
      throw _privateConstructorUsedError;
}

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
      _$AttributeDataCopyWithImpl<$Res, AttributeData>;
  @useResult
  $Res call({Widget? icon, bool ignore});
}

/// @nodoc
class _$AttributeDataCopyWithImpl<$Res, $Val extends AttributeData>
    implements $AttributeDataCopyWith<$Res> {
  _$AttributeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? ignore = null,
  }) {
    return _then(_value.copyWith(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget?,
      ignore: null == ignore
          ? _value.ignore
          : ignore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AttributeDataCopyWith<$Res>
    implements $AttributeDataCopyWith<$Res> {
  factory _$$_AttributeDataCopyWith(
          _$_AttributeData value, $Res Function(_$_AttributeData) then) =
      __$$_AttributeDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Widget? icon, bool ignore});
}

/// @nodoc
class __$$_AttributeDataCopyWithImpl<$Res>
    extends _$AttributeDataCopyWithImpl<$Res, _$_AttributeData>
    implements _$$_AttributeDataCopyWith<$Res> {
  __$$_AttributeDataCopyWithImpl(
      _$_AttributeData _value, $Res Function(_$_AttributeData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? ignore = null,
  }) {
    return _then(_$_AttributeData(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget?,
      ignore: null == ignore
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
  @override
  @JsonKey()
  final bool ignore;

  @override
  String toString() {
    return 'AttributeData(icon: $icon, ignore: $ignore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AttributeData &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.ignore, ignore) || other.ignore == ignore));
  }

  @override
  int get hashCode => Object.hash(runtimeType, icon, ignore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AttributeDataCopyWith<_$_AttributeData> get copyWith =>
      __$$_AttributeDataCopyWithImpl<_$_AttributeData>(this, _$identity);
}

abstract class _AttributeData implements AttributeData {
  const factory _AttributeData({final Widget? icon, final bool ignore}) =
      _$_AttributeData;

  @override
  Widget? get icon;
  @override
  bool get ignore;
  @override
  @JsonKey(ignore: true)
  _$$_AttributeDataCopyWith<_$_AttributeData> get copyWith =>
      throw _privateConstructorUsedError;
}
