// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SncfContext _$SncfContextFromJson(Map<String, dynamic> json) {
  return _SncfContext.fromJson(json);
}

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
      _$SncfContextCopyWithImpl<$Res, SncfContext>;
  @useResult
  $Res call({DateTime? dateTime, String? timezone});
}

/// @nodoc
class _$SncfContextCopyWithImpl<$Res, $Val extends SncfContext>
    implements $SncfContextCopyWith<$Res> {
  _$SncfContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SncfContextCopyWith<$Res>
    implements $SncfContextCopyWith<$Res> {
  factory _$$_SncfContextCopyWith(
          _$_SncfContext value, $Res Function(_$_SncfContext) then) =
      __$$_SncfContextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? dateTime, String? timezone});
}

/// @nodoc
class __$$_SncfContextCopyWithImpl<$Res>
    extends _$SncfContextCopyWithImpl<$Res, _$_SncfContext>
    implements _$$_SncfContextCopyWith<$Res> {
  __$$_SncfContextCopyWithImpl(
      _$_SncfContext _value, $Res Function(_$_SncfContext) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_$_SncfContext(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timezone: freezed == timezone
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
      _$$_SncfContextFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_SncfContext &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateTime, timezone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SncfContextCopyWith<_$_SncfContext> get copyWith =>
      __$$_SncfContextCopyWithImpl<_$_SncfContext>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfContextToJson(
      this,
    );
  }
}

abstract class _SncfContext implements SncfContext {
  const factory _SncfContext(
      {final DateTime? dateTime, final String? timezone}) = _$_SncfContext;

  factory _SncfContext.fromJson(Map<String, dynamic> json) =
      _$_SncfContext.fromJson;

  @override
  DateTime? get dateTime;
  @override
  String? get timezone;
  @override
  @JsonKey(ignore: true)
  _$$_SncfContextCopyWith<_$_SncfContext> get copyWith =>
      throw _privateConstructorUsedError;
}
