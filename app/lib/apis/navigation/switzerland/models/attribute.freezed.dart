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
abstract class _$$AttributeImplCopyWith<$Res>
    implements $AttributeCopyWith<$Res> {
  factory _$$AttributeImplCopyWith(
          _$AttributeImpl value, $Res Function(_$AttributeImpl) then) =
      __$$AttributeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String? message});
}

/// @nodoc
class __$$AttributeImplCopyWithImpl<$Res>
    extends _$AttributeCopyWithImpl<$Res, _$AttributeImpl>
    implements _$$AttributeImplCopyWith<$Res> {
  __$$AttributeImplCopyWithImpl(
      _$AttributeImpl _value, $Res Function(_$AttributeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
  }) {
    return _then(_$AttributeImpl(
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

class _$AttributeImpl extends _Attribute {
  _$AttributeImpl({required this.code, this.message}) : super._();

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
            other is _$AttributeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttributeImplCopyWith<_$AttributeImpl> get copyWith =>
      __$$AttributeImplCopyWithImpl<_$AttributeImpl>(this, _$identity);
}

abstract class _Attribute extends Attribute {
  factory _Attribute({required final String code, final String? message}) =
      _$AttributeImpl;
  _Attribute._() : super._();

  @override
  String get code;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$AttributeImplCopyWith<_$AttributeImpl> get copyWith =>
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
abstract class _$$AttributeDataImplCopyWith<$Res>
    implements $AttributeDataCopyWith<$Res> {
  factory _$$AttributeDataImplCopyWith(
          _$AttributeDataImpl value, $Res Function(_$AttributeDataImpl) then) =
      __$$AttributeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Widget? icon, bool ignore});
}

/// @nodoc
class __$$AttributeDataImplCopyWithImpl<$Res>
    extends _$AttributeDataCopyWithImpl<$Res, _$AttributeDataImpl>
    implements _$$AttributeDataImplCopyWith<$Res> {
  __$$AttributeDataImplCopyWithImpl(
      _$AttributeDataImpl _value, $Res Function(_$AttributeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? ignore = null,
  }) {
    return _then(_$AttributeDataImpl(
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

class _$AttributeDataImpl implements _AttributeData {
  const _$AttributeDataImpl({this.icon, this.ignore = false});

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
            other is _$AttributeDataImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.ignore, ignore) || other.ignore == ignore));
  }

  @override
  int get hashCode => Object.hash(runtimeType, icon, ignore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttributeDataImplCopyWith<_$AttributeDataImpl> get copyWith =>
      __$$AttributeDataImplCopyWithImpl<_$AttributeDataImpl>(this, _$identity);
}

abstract class _AttributeData implements AttributeData {
  const factory _AttributeData({final Widget? icon, final bool ignore}) =
      _$AttributeDataImpl;

  @override
  Widget? get icon;
  @override
  bool get ignore;
  @override
  @JsonKey(ignore: true)
  _$$AttributeDataImplCopyWith<_$AttributeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
