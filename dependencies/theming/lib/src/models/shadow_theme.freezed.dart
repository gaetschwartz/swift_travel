// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'shadow_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShadowThemeTearOff {
  const _$ShadowThemeTearOff();

  _ShadowTheme call({BoxShadow? buttonShadow}) {
    return _ShadowTheme(
      buttonShadow: buttonShadow,
    );
  }
}

/// @nodoc
const $ShadowTheme = _$ShadowThemeTearOff();

/// @nodoc
mixin _$ShadowTheme {
  BoxShadow? get buttonShadow => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShadowThemeCopyWith<ShadowTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShadowThemeCopyWith<$Res> {
  factory $ShadowThemeCopyWith(
          ShadowTheme value, $Res Function(ShadowTheme) then) =
      _$ShadowThemeCopyWithImpl<$Res>;
  $Res call({BoxShadow? buttonShadow});
}

/// @nodoc
class _$ShadowThemeCopyWithImpl<$Res> implements $ShadowThemeCopyWith<$Res> {
  _$ShadowThemeCopyWithImpl(this._value, this._then);

  final ShadowTheme _value;
  // ignore: unused_field
  final $Res Function(ShadowTheme) _then;

  @override
  $Res call({
    Object? buttonShadow = freezed,
  }) {
    return _then(_value.copyWith(
      buttonShadow: buttonShadow == freezed
          ? _value.buttonShadow
          : buttonShadow as BoxShadow?,
    ));
  }
}

/// @nodoc
abstract class _$ShadowThemeCopyWith<$Res>
    implements $ShadowThemeCopyWith<$Res> {
  factory _$ShadowThemeCopyWith(
          _ShadowTheme value, $Res Function(_ShadowTheme) then) =
      __$ShadowThemeCopyWithImpl<$Res>;
  @override
  $Res call({BoxShadow? buttonShadow});
}

/// @nodoc
class __$ShadowThemeCopyWithImpl<$Res> extends _$ShadowThemeCopyWithImpl<$Res>
    implements _$ShadowThemeCopyWith<$Res> {
  __$ShadowThemeCopyWithImpl(
      _ShadowTheme _value, $Res Function(_ShadowTheme) _then)
      : super(_value, (v) => _then(v as _ShadowTheme));

  @override
  _ShadowTheme get _value => super._value as _ShadowTheme;

  @override
  $Res call({
    Object? buttonShadow = freezed,
  }) {
    return _then(_ShadowTheme(
      buttonShadow: buttonShadow == freezed
          ? _value.buttonShadow
          : buttonShadow as BoxShadow?,
    ));
  }
}

/// @nodoc
class _$_ShadowTheme extends _ShadowTheme {
  const _$_ShadowTheme({this.buttonShadow}) : super._();

  @override
  final BoxShadow? buttonShadow;

  @override
  String toString() {
    return 'ShadowTheme(buttonShadow: $buttonShadow)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShadowTheme &&
            (identical(other.buttonShadow, buttonShadow) ||
                const DeepCollectionEquality()
                    .equals(other.buttonShadow, buttonShadow)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(buttonShadow);

  @JsonKey(ignore: true)
  @override
  _$ShadowThemeCopyWith<_ShadowTheme> get copyWith =>
      __$ShadowThemeCopyWithImpl<_ShadowTheme>(this, _$identity);
}

abstract class _ShadowTheme extends ShadowTheme {
  const _ShadowTheme._() : super._();
  const factory _ShadowTheme({BoxShadow? buttonShadow}) = _$_ShadowTheme;

  @override
  BoxShadow? get buttonShadow => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShadowThemeCopyWith<_ShadowTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
