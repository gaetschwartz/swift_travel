// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'geo_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GeoError _$GeoErrorFromJson(Map<String, dynamic> json) {
  return _GeoError.fromJson(json);
}

/// @nodoc
class _$GeoErrorTearOff {
  const _$GeoErrorTearOff();

// ignore: unused_element
  _GeoError call({String status, String detail, int code}) {
    return _GeoError(
      status: status,
      detail: detail,
      code: code,
    );
  }

// ignore: unused_element
  GeoError fromJson(Map<String, Object> json) {
    return GeoError.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GeoError = _$GeoErrorTearOff();

/// @nodoc
mixin _$GeoError {
  String get status;
  String get detail;
  int get code;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $GeoErrorCopyWith<GeoError> get copyWith;
}

/// @nodoc
abstract class $GeoErrorCopyWith<$Res> {
  factory $GeoErrorCopyWith(GeoError value, $Res Function(GeoError) then) =
      _$GeoErrorCopyWithImpl<$Res>;
  $Res call({String status, String detail, int code});
}

/// @nodoc
class _$GeoErrorCopyWithImpl<$Res> implements $GeoErrorCopyWith<$Res> {
  _$GeoErrorCopyWithImpl(this._value, this._then);

  final GeoError _value;
  // ignore: unused_field
  final $Res Function(GeoError) _then;

  @override
  $Res call({
    Object status = freezed,
    Object detail = freezed,
    Object code = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed ? _value.status : status as String,
      detail: detail == freezed ? _value.detail : detail as String,
      code: code == freezed ? _value.code : code as int,
    ));
  }
}

/// @nodoc
abstract class _$GeoErrorCopyWith<$Res> implements $GeoErrorCopyWith<$Res> {
  factory _$GeoErrorCopyWith(_GeoError value, $Res Function(_GeoError) then) =
      __$GeoErrorCopyWithImpl<$Res>;
  @override
  $Res call({String status, String detail, int code});
}

/// @nodoc
class __$GeoErrorCopyWithImpl<$Res> extends _$GeoErrorCopyWithImpl<$Res>
    implements _$GeoErrorCopyWith<$Res> {
  __$GeoErrorCopyWithImpl(_GeoError _value, $Res Function(_GeoError) _then)
      : super(_value, (v) => _then(v as _GeoError));

  @override
  _GeoError get _value => super._value as _GeoError;

  @override
  $Res call({
    Object status = freezed,
    Object detail = freezed,
    Object code = freezed,
  }) {
    return _then(_GeoError(
      status: status == freezed ? _value.status : status as String,
      detail: detail == freezed ? _value.detail : detail as String,
      code: code == freezed ? _value.code : code as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GeoError implements _GeoError {
  _$_GeoError({this.status, this.detail, this.code});

  factory _$_GeoError.fromJson(Map<String, dynamic> json) =>
      _$_$_GeoErrorFromJson(json);

  @override
  final String status;
  @override
  final String detail;
  @override
  final int code;

  @override
  String toString() {
    return 'GeoError(status: $status, detail: $detail, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GeoError &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(detail) ^
      const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$GeoErrorCopyWith<_GeoError> get copyWith =>
      __$GeoErrorCopyWithImpl<_GeoError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GeoErrorToJson(this);
  }
}

abstract class _GeoError implements GeoError {
  factory _GeoError({String status, String detail, int code}) = _$_GeoError;

  factory _GeoError.fromJson(Map<String, dynamic> json) = _$_GeoError.fromJson;

  @override
  String get status;
  @override
  String get detail;
  @override
  int get code;
  @override
  @JsonKey(ignore: true)
  _$GeoErrorCopyWith<_GeoError> get copyWith;
}
