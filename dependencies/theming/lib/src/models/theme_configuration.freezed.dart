// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'theme_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ThemeConfigurationTearOff {
  const _$ThemeConfigurationTearOff();

  _ThemeConfiguration call(
      {required Map<String, FullTheme> themes,
      String prefix = 'dyn_theme_',
      ThemeMode defaultThemeMode = ThemeMode.system,
      String defaultTheme = 'default',
      bool persist = true,
      List<Font> fonts = defaultFonts,
      Font? defaultFont,
      TextTheme defaultTextTheme = Typography.englishLike2018,
      ThemeData Function(ThemeData) applyToAllThemes = _i}) {
    return _ThemeConfiguration(
      themes: themes,
      prefix: prefix,
      defaultThemeMode: defaultThemeMode,
      defaultTheme: defaultTheme,
      persist: persist,
      fonts: fonts,
      defaultFont: defaultFont,
      defaultTextTheme: defaultTextTheme,
      applyToAllThemes: applyToAllThemes,
    );
  }
}

/// @nodoc
const $ThemeConfiguration = _$ThemeConfigurationTearOff();

/// @nodoc
mixin _$ThemeConfiguration {
  Map<String, FullTheme> get themes => throw _privateConstructorUsedError;
  String get prefix => throw _privateConstructorUsedError;
  ThemeMode get defaultThemeMode => throw _privateConstructorUsedError;
  String get defaultTheme => throw _privateConstructorUsedError;
  bool get persist => throw _privateConstructorUsedError;
  List<Font> get fonts => throw _privateConstructorUsedError;
  Font? get defaultFont => throw _privateConstructorUsedError;
  TextTheme get defaultTextTheme => throw _privateConstructorUsedError;
  ThemeData Function(ThemeData) get applyToAllThemes =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeConfigurationCopyWith<ThemeConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeConfigurationCopyWith<$Res> {
  factory $ThemeConfigurationCopyWith(
          ThemeConfiguration value, $Res Function(ThemeConfiguration) then) =
      _$ThemeConfigurationCopyWithImpl<$Res>;
  $Res call(
      {Map<String, FullTheme> themes,
      String prefix,
      ThemeMode defaultThemeMode,
      String defaultTheme,
      bool persist,
      List<Font> fonts,
      Font? defaultFont,
      TextTheme defaultTextTheme,
      ThemeData Function(ThemeData) applyToAllThemes});

  $FontCopyWith<$Res>? get defaultFont;
}

/// @nodoc
class _$ThemeConfigurationCopyWithImpl<$Res>
    implements $ThemeConfigurationCopyWith<$Res> {
  _$ThemeConfigurationCopyWithImpl(this._value, this._then);

  final ThemeConfiguration _value;
  // ignore: unused_field
  final $Res Function(ThemeConfiguration) _then;

  @override
  $Res call({
    Object? themes = freezed,
    Object? prefix = freezed,
    Object? defaultThemeMode = freezed,
    Object? defaultTheme = freezed,
    Object? persist = freezed,
    Object? fonts = freezed,
    Object? defaultFont = freezed,
    Object? defaultTextTheme = freezed,
    Object? applyToAllThemes = freezed,
  }) {
    return _then(_value.copyWith(
      themes:
          themes == freezed ? _value.themes : themes as Map<String, FullTheme>,
      prefix: prefix == freezed ? _value.prefix : prefix as String,
      defaultThemeMode: defaultThemeMode == freezed
          ? _value.defaultThemeMode
          : defaultThemeMode as ThemeMode,
      defaultTheme: defaultTheme == freezed
          ? _value.defaultTheme
          : defaultTheme as String,
      persist: persist == freezed ? _value.persist : persist as bool,
      fonts: fonts == freezed ? _value.fonts : fonts as List<Font>,
      defaultFont:
          defaultFont == freezed ? _value.defaultFont : defaultFont as Font?,
      defaultTextTheme: defaultTextTheme == freezed
          ? _value.defaultTextTheme
          : defaultTextTheme as TextTheme,
      applyToAllThemes: applyToAllThemes == freezed
          ? _value.applyToAllThemes
          : applyToAllThemes as ThemeData Function(ThemeData),
    ));
  }

  @override
  $FontCopyWith<$Res>? get defaultFont {
    if (_value.defaultFont == null) {
      return null;
    }

    return $FontCopyWith<$Res>(_value.defaultFont!, (value) {
      return _then(_value.copyWith(defaultFont: value));
    });
  }
}

/// @nodoc
abstract class _$ThemeConfigurationCopyWith<$Res>
    implements $ThemeConfigurationCopyWith<$Res> {
  factory _$ThemeConfigurationCopyWith(
          _ThemeConfiguration value, $Res Function(_ThemeConfiguration) then) =
      __$ThemeConfigurationCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, FullTheme> themes,
      String prefix,
      ThemeMode defaultThemeMode,
      String defaultTheme,
      bool persist,
      List<Font> fonts,
      Font? defaultFont,
      TextTheme defaultTextTheme,
      ThemeData Function(ThemeData) applyToAllThemes});

  @override
  $FontCopyWith<$Res>? get defaultFont;
}

/// @nodoc
class __$ThemeConfigurationCopyWithImpl<$Res>
    extends _$ThemeConfigurationCopyWithImpl<$Res>
    implements _$ThemeConfigurationCopyWith<$Res> {
  __$ThemeConfigurationCopyWithImpl(
      _ThemeConfiguration _value, $Res Function(_ThemeConfiguration) _then)
      : super(_value, (v) => _then(v as _ThemeConfiguration));

  @override
  _ThemeConfiguration get _value => super._value as _ThemeConfiguration;

  @override
  $Res call({
    Object? themes = freezed,
    Object? prefix = freezed,
    Object? defaultThemeMode = freezed,
    Object? defaultTheme = freezed,
    Object? persist = freezed,
    Object? fonts = freezed,
    Object? defaultFont = freezed,
    Object? defaultTextTheme = freezed,
    Object? applyToAllThemes = freezed,
  }) {
    return _then(_ThemeConfiguration(
      themes:
          themes == freezed ? _value.themes : themes as Map<String, FullTheme>,
      prefix: prefix == freezed ? _value.prefix : prefix as String,
      defaultThemeMode: defaultThemeMode == freezed
          ? _value.defaultThemeMode
          : defaultThemeMode as ThemeMode,
      defaultTheme: defaultTheme == freezed
          ? _value.defaultTheme
          : defaultTheme as String,
      persist: persist == freezed ? _value.persist : persist as bool,
      fonts: fonts == freezed ? _value.fonts : fonts as List<Font>,
      defaultFont:
          defaultFont == freezed ? _value.defaultFont : defaultFont as Font?,
      defaultTextTheme: defaultTextTheme == freezed
          ? _value.defaultTextTheme
          : defaultTextTheme as TextTheme,
      applyToAllThemes: applyToAllThemes == freezed
          ? _value.applyToAllThemes
          : applyToAllThemes as ThemeData Function(ThemeData),
    ));
  }
}

/// @nodoc
class _$_ThemeConfiguration extends _ThemeConfiguration {
  const _$_ThemeConfiguration(
      {required this.themes,
      this.prefix = 'dyn_theme_',
      this.defaultThemeMode = ThemeMode.system,
      this.defaultTheme = 'default',
      this.persist = true,
      this.fonts = defaultFonts,
      this.defaultFont,
      this.defaultTextTheme = Typography.englishLike2018,
      this.applyToAllThemes = _i})
      : super._();

  @override
  final Map<String, FullTheme> themes;
  @JsonKey(defaultValue: 'dyn_theme_')
  @override
  final String prefix;
  @JsonKey(defaultValue: ThemeMode.system)
  @override
  final ThemeMode defaultThemeMode;
  @JsonKey(defaultValue: 'default')
  @override
  final String defaultTheme;
  @JsonKey(defaultValue: true)
  @override
  final bool persist;
  @JsonKey(defaultValue: defaultFonts)
  @override
  final List<Font> fonts;
  @override
  final Font? defaultFont;
  @JsonKey(defaultValue: Typography.englishLike2018)
  @override
  final TextTheme defaultTextTheme;
  @JsonKey(defaultValue: _i)
  @override
  final ThemeData Function(ThemeData) applyToAllThemes;

  @override
  String toString() {
    return 'ThemeConfiguration(themes: $themes, prefix: $prefix, defaultThemeMode: $defaultThemeMode, defaultTheme: $defaultTheme, persist: $persist, fonts: $fonts, defaultFont: $defaultFont, defaultTextTheme: $defaultTextTheme, applyToAllThemes: $applyToAllThemes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeConfiguration &&
            (identical(other.themes, themes) ||
                const DeepCollectionEquality().equals(other.themes, themes)) &&
            (identical(other.prefix, prefix) ||
                const DeepCollectionEquality().equals(other.prefix, prefix)) &&
            (identical(other.defaultThemeMode, defaultThemeMode) ||
                const DeepCollectionEquality()
                    .equals(other.defaultThemeMode, defaultThemeMode)) &&
            (identical(other.defaultTheme, defaultTheme) ||
                const DeepCollectionEquality()
                    .equals(other.defaultTheme, defaultTheme)) &&
            (identical(other.persist, persist) ||
                const DeepCollectionEquality()
                    .equals(other.persist, persist)) &&
            (identical(other.fonts, fonts) ||
                const DeepCollectionEquality().equals(other.fonts, fonts)) &&
            (identical(other.defaultFont, defaultFont) ||
                const DeepCollectionEquality()
                    .equals(other.defaultFont, defaultFont)) &&
            (identical(other.defaultTextTheme, defaultTextTheme) ||
                const DeepCollectionEquality()
                    .equals(other.defaultTextTheme, defaultTextTheme)) &&
            (identical(other.applyToAllThemes, applyToAllThemes) ||
                const DeepCollectionEquality()
                    .equals(other.applyToAllThemes, applyToAllThemes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(themes) ^
      const DeepCollectionEquality().hash(prefix) ^
      const DeepCollectionEquality().hash(defaultThemeMode) ^
      const DeepCollectionEquality().hash(defaultTheme) ^
      const DeepCollectionEquality().hash(persist) ^
      const DeepCollectionEquality().hash(fonts) ^
      const DeepCollectionEquality().hash(defaultFont) ^
      const DeepCollectionEquality().hash(defaultTextTheme) ^
      const DeepCollectionEquality().hash(applyToAllThemes);

  @JsonKey(ignore: true)
  @override
  _$ThemeConfigurationCopyWith<_ThemeConfiguration> get copyWith =>
      __$ThemeConfigurationCopyWithImpl<_ThemeConfiguration>(this, _$identity);
}

abstract class _ThemeConfiguration extends ThemeConfiguration {
  const _ThemeConfiguration._() : super._();
  const factory _ThemeConfiguration(
      {required Map<String, FullTheme> themes,
      String prefix,
      ThemeMode defaultThemeMode,
      String defaultTheme,
      bool persist,
      List<Font> fonts,
      Font? defaultFont,
      TextTheme defaultTextTheme,
      ThemeData Function(ThemeData) applyToAllThemes}) = _$_ThemeConfiguration;

  @override
  Map<String, FullTheme> get themes => throw _privateConstructorUsedError;
  @override
  String get prefix => throw _privateConstructorUsedError;
  @override
  ThemeMode get defaultThemeMode => throw _privateConstructorUsedError;
  @override
  String get defaultTheme => throw _privateConstructorUsedError;
  @override
  bool get persist => throw _privateConstructorUsedError;
  @override
  List<Font> get fonts => throw _privateConstructorUsedError;
  @override
  Font? get defaultFont => throw _privateConstructorUsedError;
  @override
  TextTheme get defaultTextTheme => throw _privateConstructorUsedError;
  @override
  ThemeData Function(ThemeData) get applyToAllThemes =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ThemeConfigurationCopyWith<_ThemeConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}
