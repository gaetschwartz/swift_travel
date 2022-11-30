// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return _Config.fromJson(json);
}

/// @nodoc
mixin _$Config {
  String? get sncfKey => throw _privateConstructorUsedError;
  String? get triasKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigCopyWith<Config> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) then) =
      _$ConfigCopyWithImpl<$Res, Config>;
  @useResult
  $Res call({String? sncfKey, String? triasKey});
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res, $Val extends Config>
    implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sncfKey = freezed,
    Object? triasKey = freezed,
  }) {
    return _then(_value.copyWith(
      sncfKey: freezed == sncfKey
          ? _value.sncfKey
          : sncfKey // ignore: cast_nullable_to_non_nullable
              as String?,
      triasKey: freezed == triasKey
          ? _value.triasKey
          : triasKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$_ConfigCopyWith(_$_Config value, $Res Function(_$_Config) then) =
      __$$_ConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? sncfKey, String? triasKey});
}

/// @nodoc
class __$$_ConfigCopyWithImpl<$Res>
    extends _$ConfigCopyWithImpl<$Res, _$_Config>
    implements _$$_ConfigCopyWith<$Res> {
  __$$_ConfigCopyWithImpl(_$_Config _value, $Res Function(_$_Config) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sncfKey = freezed,
    Object? triasKey = freezed,
  }) {
    return _then(_$_Config(
      sncfKey: freezed == sncfKey
          ? _value.sncfKey
          : sncfKey // ignore: cast_nullable_to_non_nullable
              as String?,
      triasKey: freezed == triasKey
          ? _value.triasKey
          : triasKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Config implements _Config {
  const _$_Config({this.sncfKey, this.triasKey});

  factory _$_Config.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigFromJson(json);

  @override
  final String? sncfKey;
  @override
  final String? triasKey;

  @override
  String toString() {
    return 'Config(sncfKey: $sncfKey, triasKey: $triasKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Config &&
            (identical(other.sncfKey, sncfKey) || other.sncfKey == sncfKey) &&
            (identical(other.triasKey, triasKey) ||
                other.triasKey == triasKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sncfKey, triasKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      __$$_ConfigCopyWithImpl<_$_Config>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigToJson(
      this,
    );
  }
}

abstract class _Config implements Config {
  const factory _Config({final String? sncfKey, final String? triasKey}) =
      _$_Config;

  factory _Config.fromJson(Map<String, dynamic> json) = _$_Config.fromJson;

  @override
  String? get sncfKey;
  @override
  String? get triasKey;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      throw _privateConstructorUsedError;
}
