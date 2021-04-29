// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SncfContext _$SncfContextFromJson(Map<String, dynamic> json) {
  return _SncfContext.fromJson(json);
}

/// @nodoc
class _$SncfContextTearOff {
  const _$SncfContextTearOff();

  _SncfContext call({DateTime? dateTime, String? timezone}) {
    return _SncfContext(
      dateTime: dateTime,
      timezone: timezone,
    );
  }

  SncfContext fromJson(Map<String, Object> json) {
    return SncfContext.fromJson(json);
  }
}

/// @nodoc
const $SncfContext = _$SncfContextTearOff();

/// @nodoc
mixin _$SncfContext {
  DateTime? get dateTime => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SncfContextCopyWith<SncfContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SncfContextCopyWith<$Res> {
  factory $SncfContextCopyWith(
          SncfContext value, $Res Function(SncfContext) then) =
      _$SncfContextCopyWithImpl<$Res>;
  $Res call({DateTime? dateTime, String? timezone});
}

/// @nodoc
class _$SncfContextCopyWithImpl<$Res> implements $SncfContextCopyWith<$Res> {
  _$SncfContextCopyWithImpl(this._value, this._then);

  final SncfContext _value;
  // ignore: unused_field
  final $Res Function(SncfContext) _then;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SncfContextCopyWith<$Res>
    implements $SncfContextCopyWith<$Res> {
  factory _$SncfContextCopyWith(
          _SncfContext value, $Res Function(_SncfContext) then) =
      __$SncfContextCopyWithImpl<$Res>;
  @override
  $Res call({DateTime? dateTime, String? timezone});
}

/// @nodoc
class __$SncfContextCopyWithImpl<$Res> extends _$SncfContextCopyWithImpl<$Res>
    implements _$SncfContextCopyWith<$Res> {
  __$SncfContextCopyWithImpl(
      _SncfContext _value, $Res Function(_SncfContext) _then)
      : super(_value, (v) => _then(v as _SncfContext));

  @override
  _SncfContext get _value => super._value as _SncfContext;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_SncfContext(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SncfContext implements _SncfContext {
  const _$_SncfContext({this.dateTime, this.timezone});

  factory _$_SncfContext.fromJson(Map<String, dynamic> json) =>
      _$_$_SncfContextFromJson(json);

  @override
  final DateTime? dateTime;
  @override
  final String? timezone;

  @override
  String toString() {
    return 'SncfContext(dateTime: $dateTime, timezone: $timezone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SncfContext &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
            (identical(other.timezone, timezone) ||
                const DeepCollectionEquality()
                    .equals(other.timezone, timezone)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dateTime) ^
      const DeepCollectionEquality().hash(timezone);

  @JsonKey(ignore: true)
  @override
  _$SncfContextCopyWith<_SncfContext> get copyWith =>
      __$SncfContextCopyWithImpl<_SncfContext>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SncfContextToJson(this);
  }
}

abstract class _SncfContext implements SncfContext {
  const factory _SncfContext({DateTime? dateTime, String? timezone}) =
      _$_SncfContext;

  factory _SncfContext.fromJson(Map<String, dynamic> json) =
      _$_SncfContext.fromJson;

  @override
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @override
  String? get timezone => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SncfContextCopyWith<_SncfContext> get copyWith =>
      throw _privateConstructorUsedError;
}
