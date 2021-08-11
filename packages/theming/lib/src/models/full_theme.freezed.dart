// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'full_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FullThemeTearOff {
  const _$FullThemeTearOff();

  _FullTheme call(
      {required ColorScheme light,
      required ColorScheme dark,
      required String name,
      ThemeData Function(ThemeData) applyToLight = _identity,
      ThemeData Function(ThemeData) applyToDark = _identity,
      String description = 'Description',
      ShadowTheme lightShadow = const ShadowTheme(),
      ShadowTheme darkShadow = const ShadowTheme(),
      bool hide = false}) {
    return _FullTheme(
      light: light,
      dark: dark,
      name: name,
      applyToLight: applyToLight,
      applyToDark: applyToDark,
      description: description,
      lightShadow: lightShadow,
      darkShadow: darkShadow,
      hide: hide,
    );
  }
}

/// @nodoc
const $FullTheme = _$FullThemeTearOff();

/// @nodoc
mixin _$FullTheme {
  ColorScheme get light => throw _privateConstructorUsedError;
  ColorScheme get dark => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ThemeData Function(ThemeData) get applyToLight =>
      throw _privateConstructorUsedError;
  ThemeData Function(ThemeData) get applyToDark =>
      throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ShadowTheme get lightShadow => throw _privateConstructorUsedError;
  ShadowTheme get darkShadow => throw _privateConstructorUsedError;
  bool get hide => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FullThemeCopyWith<FullTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullThemeCopyWith<$Res> {
  factory $FullThemeCopyWith(FullTheme value, $Res Function(FullTheme) then) =
      _$FullThemeCopyWithImpl<$Res>;
  $Res call(
      {ColorScheme light,
      ColorScheme dark,
      String name,
      ThemeData Function(ThemeData) applyToLight,
      ThemeData Function(ThemeData) applyToDark,
      String description,
      ShadowTheme lightShadow,
      ShadowTheme darkShadow,
      bool hide});

  $ShadowThemeCopyWith<$Res> get lightShadow;
  $ShadowThemeCopyWith<$Res> get darkShadow;
}

/// @nodoc
class _$FullThemeCopyWithImpl<$Res> implements $FullThemeCopyWith<$Res> {
  _$FullThemeCopyWithImpl(this._value, this._then);

  final FullTheme _value;
  // ignore: unused_field
  final $Res Function(FullTheme) _then;

  @override
  $Res call({
    Object? light = freezed,
    Object? dark = freezed,
    Object? name = freezed,
    Object? applyToLight = freezed,
    Object? applyToDark = freezed,
    Object? description = freezed,
    Object? lightShadow = freezed,
    Object? darkShadow = freezed,
    Object? hide = freezed,
  }) {
    return _then(_value.copyWith(
      light: light == freezed
          ? _value.light
          : light // ignore: cast_nullable_to_non_nullable
              as ColorScheme,
      dark: dark == freezed
          ? _value.dark
          : dark // ignore: cast_nullable_to_non_nullable
              as ColorScheme,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      applyToLight: applyToLight == freezed
          ? _value.applyToLight
          : applyToLight // ignore: cast_nullable_to_non_nullable
              as ThemeData Function(ThemeData),
      applyToDark: applyToDark == freezed
          ? _value.applyToDark
          : applyToDark // ignore: cast_nullable_to_non_nullable
              as ThemeData Function(ThemeData),
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      lightShadow: lightShadow == freezed
          ? _value.lightShadow
          : lightShadow // ignore: cast_nullable_to_non_nullable
              as ShadowTheme,
      darkShadow: darkShadow == freezed
          ? _value.darkShadow
          : darkShadow // ignore: cast_nullable_to_non_nullable
              as ShadowTheme,
      hide: hide == freezed
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $ShadowThemeCopyWith<$Res> get lightShadow {
    return $ShadowThemeCopyWith<$Res>(_value.lightShadow, (value) {
      return _then(_value.copyWith(lightShadow: value));
    });
  }

  @override
  $ShadowThemeCopyWith<$Res> get darkShadow {
    return $ShadowThemeCopyWith<$Res>(_value.darkShadow, (value) {
      return _then(_value.copyWith(darkShadow: value));
    });
  }
}

/// @nodoc
abstract class _$FullThemeCopyWith<$Res> implements $FullThemeCopyWith<$Res> {
  factory _$FullThemeCopyWith(
          _FullTheme value, $Res Function(_FullTheme) then) =
      __$FullThemeCopyWithImpl<$Res>;
  @override
  $Res call(
      {ColorScheme light,
      ColorScheme dark,
      String name,
      ThemeData Function(ThemeData) applyToLight,
      ThemeData Function(ThemeData) applyToDark,
      String description,
      ShadowTheme lightShadow,
      ShadowTheme darkShadow,
      bool hide});

  @override
  $ShadowThemeCopyWith<$Res> get lightShadow;
  @override
  $ShadowThemeCopyWith<$Res> get darkShadow;
}

/// @nodoc
class __$FullThemeCopyWithImpl<$Res> extends _$FullThemeCopyWithImpl<$Res>
    implements _$FullThemeCopyWith<$Res> {
  __$FullThemeCopyWithImpl(_FullTheme _value, $Res Function(_FullTheme) _then)
      : super(_value, (v) => _then(v as _FullTheme));

  @override
  _FullTheme get _value => super._value as _FullTheme;

  @override
  $Res call({
    Object? light = freezed,
    Object? dark = freezed,
    Object? name = freezed,
    Object? applyToLight = freezed,
    Object? applyToDark = freezed,
    Object? description = freezed,
    Object? lightShadow = freezed,
    Object? darkShadow = freezed,
    Object? hide = freezed,
  }) {
    return _then(_FullTheme(
      light: light == freezed
          ? _value.light
          : light // ignore: cast_nullable_to_non_nullable
              as ColorScheme,
      dark: dark == freezed
          ? _value.dark
          : dark // ignore: cast_nullable_to_non_nullable
              as ColorScheme,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      applyToLight: applyToLight == freezed
          ? _value.applyToLight
          : applyToLight // ignore: cast_nullable_to_non_nullable
              as ThemeData Function(ThemeData),
      applyToDark: applyToDark == freezed
          ? _value.applyToDark
          : applyToDark // ignore: cast_nullable_to_non_nullable
              as ThemeData Function(ThemeData),
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      lightShadow: lightShadow == freezed
          ? _value.lightShadow
          : lightShadow // ignore: cast_nullable_to_non_nullable
              as ShadowTheme,
      darkShadow: darkShadow == freezed
          ? _value.darkShadow
          : darkShadow // ignore: cast_nullable_to_non_nullable
              as ShadowTheme,
      hide: hide == freezed
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FullTheme implements _FullTheme {
  const _$_FullTheme(
      {required this.light,
      required this.dark,
      required this.name,
      this.applyToLight = _identity,
      this.applyToDark = _identity,
      this.description = 'Description',
      this.lightShadow = const ShadowTheme(),
      this.darkShadow = const ShadowTheme(),
      this.hide = false});

  @override
  final ColorScheme light;
  @override
  final ColorScheme dark;
  @override
  final String name;
  @JsonKey(defaultValue: _identity)
  @override
  final ThemeData Function(ThemeData) applyToLight;
  @JsonKey(defaultValue: _identity)
  @override
  final ThemeData Function(ThemeData) applyToDark;
  @JsonKey(defaultValue: 'Description')
  @override
  final String description;
  @JsonKey(defaultValue: const ShadowTheme())
  @override
  final ShadowTheme lightShadow;
  @JsonKey(defaultValue: const ShadowTheme())
  @override
  final ShadowTheme darkShadow;
  @JsonKey(defaultValue: false)
  @override
  final bool hide;

  @override
  String toString() {
    return 'FullTheme(light: $light, dark: $dark, name: $name, applyToLight: $applyToLight, applyToDark: $applyToDark, description: $description, lightShadow: $lightShadow, darkShadow: $darkShadow, hide: $hide)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FullTheme &&
            (identical(other.light, light) ||
                const DeepCollectionEquality().equals(other.light, light)) &&
            (identical(other.dark, dark) ||
                const DeepCollectionEquality().equals(other.dark, dark)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.applyToLight, applyToLight) ||
                const DeepCollectionEquality()
                    .equals(other.applyToLight, applyToLight)) &&
            (identical(other.applyToDark, applyToDark) ||
                const DeepCollectionEquality()
                    .equals(other.applyToDark, applyToDark)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.lightShadow, lightShadow) ||
                const DeepCollectionEquality()
                    .equals(other.lightShadow, lightShadow)) &&
            (identical(other.darkShadow, darkShadow) ||
                const DeepCollectionEquality()
                    .equals(other.darkShadow, darkShadow)) &&
            (identical(other.hide, hide) ||
                const DeepCollectionEquality().equals(other.hide, hide)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(light) ^
      const DeepCollectionEquality().hash(dark) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(applyToLight) ^
      const DeepCollectionEquality().hash(applyToDark) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(lightShadow) ^
      const DeepCollectionEquality().hash(darkShadow) ^
      const DeepCollectionEquality().hash(hide);

  @JsonKey(ignore: true)
  @override
  _$FullThemeCopyWith<_FullTheme> get copyWith =>
      __$FullThemeCopyWithImpl<_FullTheme>(this, _$identity);
}

abstract class _FullTheme implements FullTheme {
  const factory _FullTheme(
      {required ColorScheme light,
      required ColorScheme dark,
      required String name,
      ThemeData Function(ThemeData) applyToLight,
      ThemeData Function(ThemeData) applyToDark,
      String description,
      ShadowTheme lightShadow,
      ShadowTheme darkShadow,
      bool hide}) = _$_FullTheme;

  @override
  ColorScheme get light => throw _privateConstructorUsedError;
  @override
  ColorScheme get dark => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  ThemeData Function(ThemeData) get applyToLight =>
      throw _privateConstructorUsedError;
  @override
  ThemeData Function(ThemeData) get applyToDark =>
      throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  ShadowTheme get lightShadow => throw _privateConstructorUsedError;
  @override
  ShadowTheme get darkShadow => throw _privateConstructorUsedError;
  @override
  bool get hide => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FullThemeCopyWith<_FullTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
