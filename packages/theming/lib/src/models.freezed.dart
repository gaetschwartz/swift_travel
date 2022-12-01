// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Font {
  String get name => throw _privateConstructorUsedError;
  TextTheme Function(TextTheme) get textTheme =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FontCopyWith<Font> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FontCopyWith<$Res> {
  factory $FontCopyWith(Font value, $Res Function(Font) then) =
      _$FontCopyWithImpl<$Res, Font>;
  @useResult
  $Res call({String name, TextTheme Function(TextTheme) textTheme});
}

/// @nodoc
class _$FontCopyWithImpl<$Res, $Val extends Font>
    implements $FontCopyWith<$Res> {
  _$FontCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? textTheme = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      textTheme: null == textTheme
          ? _value.textTheme
          : textTheme // ignore: cast_nullable_to_non_nullable
              as TextTheme Function(TextTheme),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FontCopyWith<$Res> implements $FontCopyWith<$Res> {
  factory _$$_FontCopyWith(_$_Font value, $Res Function(_$_Font) then) =
      __$$_FontCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, TextTheme Function(TextTheme) textTheme});
}

/// @nodoc
class __$$_FontCopyWithImpl<$Res> extends _$FontCopyWithImpl<$Res, _$_Font>
    implements _$$_FontCopyWith<$Res> {
  __$$_FontCopyWithImpl(_$_Font _value, $Res Function(_$_Font) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? textTheme = null,
  }) {
    return _then(_$_Font(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == textTheme
          ? _value.textTheme
          : textTheme // ignore: cast_nullable_to_non_nullable
              as TextTheme Function(TextTheme),
    ));
  }
}

/// @nodoc

class _$_Font implements _Font {
  const _$_Font(this.name, this.textTheme);

  @override
  final String name;
  @override
  final TextTheme Function(TextTheme) textTheme;

  @override
  String toString() {
    return 'Font(name: $name, textTheme: $textTheme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Font &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.textTheme, textTheme) ||
                other.textTheme == textTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, textTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FontCopyWith<_$_Font> get copyWith =>
      __$$_FontCopyWithImpl<_$_Font>(this, _$identity);
}

abstract class _Font implements Font {
  const factory _Font(
          final String name, final TextTheme Function(TextTheme) textTheme) =
      _$_Font;

  @override
  String get name;
  @override
  TextTheme Function(TextTheme) get textTheme;
  @override
  @JsonKey(ignore: true)
  _$$_FontCopyWith<_$_Font> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExtendedTheme {
  ColorScheme get colorScheme => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  ApplyTo<ThemeData> get apply => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ShadowTheme get shadow => throw _privateConstructorUsedError;
  bool get hide => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExtendedThemeCopyWith<ExtendedTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtendedThemeCopyWith<$Res> {
  factory $ExtendedThemeCopyWith(
          ExtendedTheme value, $Res Function(ExtendedTheme) then) =
      _$ExtendedThemeCopyWithImpl<$Res, ExtendedTheme>;
  @useResult
  $Res call(
      {ColorScheme colorScheme,
      String name,
      String id,
      ApplyTo<ThemeData> apply,
      String description,
      ShadowTheme shadow,
      bool hide});

  $ShadowThemeCopyWith<$Res> get shadow;
}

/// @nodoc
class _$ExtendedThemeCopyWithImpl<$Res, $Val extends ExtendedTheme>
    implements $ExtendedThemeCopyWith<$Res> {
  _$ExtendedThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorScheme = null,
    Object? name = null,
    Object? id = null,
    Object? apply = null,
    Object? description = null,
    Object? shadow = null,
    Object? hide = null,
  }) {
    return _then(_value.copyWith(
      colorScheme: null == colorScheme
          ? _value.colorScheme
          : colorScheme // ignore: cast_nullable_to_non_nullable
              as ColorScheme,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      apply: null == apply
          ? _value.apply
          : apply // ignore: cast_nullable_to_non_nullable
              as ApplyTo<ThemeData>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shadow: null == shadow
          ? _value.shadow
          : shadow // ignore: cast_nullable_to_non_nullable
              as ShadowTheme,
      hide: null == hide
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShadowThemeCopyWith<$Res> get shadow {
    return $ShadowThemeCopyWith<$Res>(_value.shadow, (value) {
      return _then(_value.copyWith(shadow: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ExtendedThemeCopyWith<$Res>
    implements $ExtendedThemeCopyWith<$Res> {
  factory _$$_ExtendedThemeCopyWith(
          _$_ExtendedTheme value, $Res Function(_$_ExtendedTheme) then) =
      __$$_ExtendedThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ColorScheme colorScheme,
      String name,
      String id,
      ApplyTo<ThemeData> apply,
      String description,
      ShadowTheme shadow,
      bool hide});

  @override
  $ShadowThemeCopyWith<$Res> get shadow;
}

/// @nodoc
class __$$_ExtendedThemeCopyWithImpl<$Res>
    extends _$ExtendedThemeCopyWithImpl<$Res, _$_ExtendedTheme>
    implements _$$_ExtendedThemeCopyWith<$Res> {
  __$$_ExtendedThemeCopyWithImpl(
      _$_ExtendedTheme _value, $Res Function(_$_ExtendedTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorScheme = null,
    Object? name = null,
    Object? id = null,
    Object? apply = null,
    Object? description = null,
    Object? shadow = null,
    Object? hide = null,
  }) {
    return _then(_$_ExtendedTheme(
      colorScheme: null == colorScheme
          ? _value.colorScheme
          : colorScheme // ignore: cast_nullable_to_non_nullable
              as ColorScheme,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      apply: null == apply
          ? _value.apply
          : apply // ignore: cast_nullable_to_non_nullable
              as ApplyTo<ThemeData>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shadow: null == shadow
          ? _value.shadow
          : shadow // ignore: cast_nullable_to_non_nullable
              as ShadowTheme,
      hide: null == hide
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ExtendedTheme extends _ExtendedTheme {
  const _$_ExtendedTheme(
      {required this.colorScheme,
      required this.name,
      required this.id,
      this.apply = _identity,
      this.description = 'Description',
      this.shadow = const ShadowTheme(),
      this.hide = false})
      : super._();

  @override
  final ColorScheme colorScheme;
  @override
  final String name;
  @override
  final String id;
  @override
  @JsonKey()
  final ApplyTo<ThemeData> apply;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final ShadowTheme shadow;
  @override
  @JsonKey()
  final bool hide;

  @override
  String toString() {
    return 'ExtendedTheme(colorScheme: $colorScheme, name: $name, id: $id, apply: $apply, description: $description, shadow: $shadow, hide: $hide)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExtendedTheme &&
            (identical(other.colorScheme, colorScheme) ||
                other.colorScheme == colorScheme) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.apply, apply) || other.apply == apply) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.shadow, shadow) || other.shadow == shadow) &&
            (identical(other.hide, hide) || other.hide == hide));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, colorScheme, name, id, apply, description, shadow, hide);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExtendedThemeCopyWith<_$_ExtendedTheme> get copyWith =>
      __$$_ExtendedThemeCopyWithImpl<_$_ExtendedTheme>(this, _$identity);
}

abstract class _ExtendedTheme extends ExtendedTheme {
  const factory _ExtendedTheme(
      {required final ColorScheme colorScheme,
      required final String name,
      required final String id,
      final ApplyTo<ThemeData> apply,
      final String description,
      final ShadowTheme shadow,
      final bool hide}) = _$_ExtendedTheme;
  const _ExtendedTheme._() : super._();

  @override
  ColorScheme get colorScheme;
  @override
  String get name;
  @override
  String get id;
  @override
  ApplyTo<ThemeData> get apply;
  @override
  String get description;
  @override
  ShadowTheme get shadow;
  @override
  bool get hide;
  @override
  @JsonKey(ignore: true)
  _$$_ExtendedThemeCopyWith<_$_ExtendedTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FullTheme {
  ExtendedTheme get light => throw _privateConstructorUsedError;
  ExtendedTheme get dark => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FullThemeCopyWith<FullTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullThemeCopyWith<$Res> {
  factory $FullThemeCopyWith(FullTheme value, $Res Function(FullTheme) then) =
      _$FullThemeCopyWithImpl<$Res, FullTheme>;
  @useResult
  $Res call({ExtendedTheme light, ExtendedTheme dark});

  $ExtendedThemeCopyWith<$Res> get light;
  $ExtendedThemeCopyWith<$Res> get dark;
}

/// @nodoc
class _$FullThemeCopyWithImpl<$Res, $Val extends FullTheme>
    implements $FullThemeCopyWith<$Res> {
  _$FullThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? light = null,
    Object? dark = null,
  }) {
    return _then(_value.copyWith(
      light: null == light
          ? _value.light
          : light // ignore: cast_nullable_to_non_nullable
              as ExtendedTheme,
      dark: null == dark
          ? _value.dark
          : dark // ignore: cast_nullable_to_non_nullable
              as ExtendedTheme,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExtendedThemeCopyWith<$Res> get light {
    return $ExtendedThemeCopyWith<$Res>(_value.light, (value) {
      return _then(_value.copyWith(light: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExtendedThemeCopyWith<$Res> get dark {
    return $ExtendedThemeCopyWith<$Res>(_value.dark, (value) {
      return _then(_value.copyWith(dark: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FullThemeCopyWith<$Res> implements $FullThemeCopyWith<$Res> {
  factory _$$_FullThemeCopyWith(
          _$_FullTheme value, $Res Function(_$_FullTheme) then) =
      __$$_FullThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ExtendedTheme light, ExtendedTheme dark});

  @override
  $ExtendedThemeCopyWith<$Res> get light;
  @override
  $ExtendedThemeCopyWith<$Res> get dark;
}

/// @nodoc
class __$$_FullThemeCopyWithImpl<$Res>
    extends _$FullThemeCopyWithImpl<$Res, _$_FullTheme>
    implements _$$_FullThemeCopyWith<$Res> {
  __$$_FullThemeCopyWithImpl(
      _$_FullTheme _value, $Res Function(_$_FullTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? light = null,
    Object? dark = null,
  }) {
    return _then(_$_FullTheme(
      light: null == light
          ? _value.light
          : light // ignore: cast_nullable_to_non_nullable
              as ExtendedTheme,
      dark: null == dark
          ? _value.dark
          : dark // ignore: cast_nullable_to_non_nullable
              as ExtendedTheme,
    ));
  }
}

/// @nodoc

class _$_FullTheme implements _FullTheme {
  const _$_FullTheme({required this.light, required this.dark});

  @override
  final ExtendedTheme light;
  @override
  final ExtendedTheme dark;

  @override
  String toString() {
    return 'FullTheme(light: $light, dark: $dark)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FullTheme &&
            (identical(other.light, light) || other.light == light) &&
            (identical(other.dark, dark) || other.dark == dark));
  }

  @override
  int get hashCode => Object.hash(runtimeType, light, dark);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FullThemeCopyWith<_$_FullTheme> get copyWith =>
      __$$_FullThemeCopyWithImpl<_$_FullTheme>(this, _$identity);
}

abstract class _FullTheme implements FullTheme {
  const factory _FullTheme(
      {required final ExtendedTheme light,
      required final ExtendedTheme dark}) = _$_FullTheme;

  @override
  ExtendedTheme get light;
  @override
  ExtendedTheme get dark;
  @override
  @JsonKey(ignore: true)
  _$$_FullThemeCopyWith<_$_FullTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

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
      _$ShadowThemeCopyWithImpl<$Res, ShadowTheme>;
  @useResult
  $Res call({BoxShadow? buttonShadow});
}

/// @nodoc
class _$ShadowThemeCopyWithImpl<$Res, $Val extends ShadowTheme>
    implements $ShadowThemeCopyWith<$Res> {
  _$ShadowThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buttonShadow = freezed,
  }) {
    return _then(_value.copyWith(
      buttonShadow: freezed == buttonShadow
          ? _value.buttonShadow
          : buttonShadow // ignore: cast_nullable_to_non_nullable
              as BoxShadow?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShadowThemeCopyWith<$Res>
    implements $ShadowThemeCopyWith<$Res> {
  factory _$$_ShadowThemeCopyWith(
          _$_ShadowTheme value, $Res Function(_$_ShadowTheme) then) =
      __$$_ShadowThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BoxShadow? buttonShadow});
}

/// @nodoc
class __$$_ShadowThemeCopyWithImpl<$Res>
    extends _$ShadowThemeCopyWithImpl<$Res, _$_ShadowTheme>
    implements _$$_ShadowThemeCopyWith<$Res> {
  __$$_ShadowThemeCopyWithImpl(
      _$_ShadowTheme _value, $Res Function(_$_ShadowTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buttonShadow = freezed,
  }) {
    return _then(_$_ShadowTheme(
      buttonShadow: freezed == buttonShadow
          ? _value.buttonShadow
          : buttonShadow // ignore: cast_nullable_to_non_nullable
              as BoxShadow?,
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
        (other.runtimeType == runtimeType &&
            other is _$_ShadowTheme &&
            (identical(other.buttonShadow, buttonShadow) ||
                other.buttonShadow == buttonShadow));
  }

  @override
  int get hashCode => Object.hash(runtimeType, buttonShadow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShadowThemeCopyWith<_$_ShadowTheme> get copyWith =>
      __$$_ShadowThemeCopyWithImpl<_$_ShadowTheme>(this, _$identity);
}

abstract class _ShadowTheme extends ShadowTheme {
  const factory _ShadowTheme({final BoxShadow? buttonShadow}) = _$_ShadowTheme;
  const _ShadowTheme._() : super._();

  @override
  BoxShadow? get buttonShadow;
  @override
  @JsonKey(ignore: true)
  _$$_ShadowThemeCopyWith<_$_ShadowTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ThemeConfiguration {
  List<ExtendedTheme> get lightThemes => throw _privateConstructorUsedError;
  List<ExtendedTheme> get darkThemes => throw _privateConstructorUsedError;
  List<Font> get fonts => throw _privateConstructorUsedError;
  String get prefix => throw _privateConstructorUsedError;
  ThemeMode get defaultThemeMode => throw _privateConstructorUsedError;
  bool get persist => throw _privateConstructorUsedError;
  String? get defaultLightThemeId => throw _privateConstructorUsedError;
  String? get defaultDarkThemeId => throw _privateConstructorUsedError;
  Font? get defaultFont => throw _privateConstructorUsedError;
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
      _$ThemeConfigurationCopyWithImpl<$Res, ThemeConfiguration>;
  @useResult
  $Res call(
      {List<ExtendedTheme> lightThemes,
      List<ExtendedTheme> darkThemes,
      List<Font> fonts,
      String prefix,
      ThemeMode defaultThemeMode,
      bool persist,
      String? defaultLightThemeId,
      String? defaultDarkThemeId,
      Font? defaultFont,
      ThemeData Function(ThemeData) applyToAllThemes});

  $FontCopyWith<$Res>? get defaultFont;
}

/// @nodoc
class _$ThemeConfigurationCopyWithImpl<$Res, $Val extends ThemeConfiguration>
    implements $ThemeConfigurationCopyWith<$Res> {
  _$ThemeConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lightThemes = null,
    Object? darkThemes = null,
    Object? fonts = null,
    Object? prefix = null,
    Object? defaultThemeMode = null,
    Object? persist = null,
    Object? defaultLightThemeId = freezed,
    Object? defaultDarkThemeId = freezed,
    Object? defaultFont = freezed,
    Object? applyToAllThemes = null,
  }) {
    return _then(_value.copyWith(
      lightThemes: null == lightThemes
          ? _value.lightThemes
          : lightThemes // ignore: cast_nullable_to_non_nullable
              as List<ExtendedTheme>,
      darkThemes: null == darkThemes
          ? _value.darkThemes
          : darkThemes // ignore: cast_nullable_to_non_nullable
              as List<ExtendedTheme>,
      fonts: null == fonts
          ? _value.fonts
          : fonts // ignore: cast_nullable_to_non_nullable
              as List<Font>,
      prefix: null == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String,
      defaultThemeMode: null == defaultThemeMode
          ? _value.defaultThemeMode
          : defaultThemeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      persist: null == persist
          ? _value.persist
          : persist // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultLightThemeId: freezed == defaultLightThemeId
          ? _value.defaultLightThemeId
          : defaultLightThemeId // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultDarkThemeId: freezed == defaultDarkThemeId
          ? _value.defaultDarkThemeId
          : defaultDarkThemeId // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultFont: freezed == defaultFont
          ? _value.defaultFont
          : defaultFont // ignore: cast_nullable_to_non_nullable
              as Font?,
      applyToAllThemes: null == applyToAllThemes
          ? _value.applyToAllThemes
          : applyToAllThemes // ignore: cast_nullable_to_non_nullable
              as ThemeData Function(ThemeData),
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FontCopyWith<$Res>? get defaultFont {
    if (_value.defaultFont == null) {
      return null;
    }

    return $FontCopyWith<$Res>(_value.defaultFont!, (value) {
      return _then(_value.copyWith(defaultFont: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ThemeConfigurationCopyWith<$Res>
    implements $ThemeConfigurationCopyWith<$Res> {
  factory _$$_ThemeConfigurationCopyWith(_$_ThemeConfiguration value,
          $Res Function(_$_ThemeConfiguration) then) =
      __$$_ThemeConfigurationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ExtendedTheme> lightThemes,
      List<ExtendedTheme> darkThemes,
      List<Font> fonts,
      String prefix,
      ThemeMode defaultThemeMode,
      bool persist,
      String? defaultLightThemeId,
      String? defaultDarkThemeId,
      Font? defaultFont,
      ThemeData Function(ThemeData) applyToAllThemes});

  @override
  $FontCopyWith<$Res>? get defaultFont;
}

/// @nodoc
class __$$_ThemeConfigurationCopyWithImpl<$Res>
    extends _$ThemeConfigurationCopyWithImpl<$Res, _$_ThemeConfiguration>
    implements _$$_ThemeConfigurationCopyWith<$Res> {
  __$$_ThemeConfigurationCopyWithImpl(
      _$_ThemeConfiguration _value, $Res Function(_$_ThemeConfiguration) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lightThemes = null,
    Object? darkThemes = null,
    Object? fonts = null,
    Object? prefix = null,
    Object? defaultThemeMode = null,
    Object? persist = null,
    Object? defaultLightThemeId = freezed,
    Object? defaultDarkThemeId = freezed,
    Object? defaultFont = freezed,
    Object? applyToAllThemes = null,
  }) {
    return _then(_$_ThemeConfiguration(
      lightThemes: null == lightThemes
          ? _value._lightThemes
          : lightThemes // ignore: cast_nullable_to_non_nullable
              as List<ExtendedTheme>,
      darkThemes: null == darkThemes
          ? _value._darkThemes
          : darkThemes // ignore: cast_nullable_to_non_nullable
              as List<ExtendedTheme>,
      fonts: null == fonts
          ? _value._fonts
          : fonts // ignore: cast_nullable_to_non_nullable
              as List<Font>,
      prefix: null == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String,
      defaultThemeMode: null == defaultThemeMode
          ? _value.defaultThemeMode
          : defaultThemeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      persist: null == persist
          ? _value.persist
          : persist // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultLightThemeId: freezed == defaultLightThemeId
          ? _value.defaultLightThemeId
          : defaultLightThemeId // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultDarkThemeId: freezed == defaultDarkThemeId
          ? _value.defaultDarkThemeId
          : defaultDarkThemeId // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultFont: freezed == defaultFont
          ? _value.defaultFont
          : defaultFont // ignore: cast_nullable_to_non_nullable
              as Font?,
      applyToAllThemes: null == applyToAllThemes
          ? _value.applyToAllThemes
          : applyToAllThemes // ignore: cast_nullable_to_non_nullable
              as ThemeData Function(ThemeData),
    ));
  }
}

/// @nodoc

class _$_ThemeConfiguration extends _ThemeConfiguration {
  const _$_ThemeConfiguration(
      {required final List<ExtendedTheme> lightThemes,
      required final List<ExtendedTheme> darkThemes,
      required final List<Font> fonts,
      this.prefix = 'dyn_theme_',
      this.defaultThemeMode = ThemeMode.system,
      this.persist = false,
      this.defaultLightThemeId,
      this.defaultDarkThemeId,
      this.defaultFont,
      this.applyToAllThemes = _identity})
      : _lightThemes = lightThemes,
        _darkThemes = darkThemes,
        _fonts = fonts,
        super._();

  final List<ExtendedTheme> _lightThemes;
  @override
  List<ExtendedTheme> get lightThemes {
    if (_lightThemes is EqualUnmodifiableListView) return _lightThemes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lightThemes);
  }

  final List<ExtendedTheme> _darkThemes;
  @override
  List<ExtendedTheme> get darkThemes {
    if (_darkThemes is EqualUnmodifiableListView) return _darkThemes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_darkThemes);
  }

  final List<Font> _fonts;
  @override
  List<Font> get fonts {
    if (_fonts is EqualUnmodifiableListView) return _fonts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fonts);
  }

  @override
  @JsonKey()
  final String prefix;
  @override
  @JsonKey()
  final ThemeMode defaultThemeMode;
  @override
  @JsonKey()
  final bool persist;
  @override
  final String? defaultLightThemeId;
  @override
  final String? defaultDarkThemeId;
  @override
  final Font? defaultFont;
  @override
  @JsonKey()
  final ThemeData Function(ThemeData) applyToAllThemes;

  @override
  String toString() {
    return 'ThemeConfiguration(lightThemes: $lightThemes, darkThemes: $darkThemes, fonts: $fonts, prefix: $prefix, defaultThemeMode: $defaultThemeMode, persist: $persist, defaultLightThemeId: $defaultLightThemeId, defaultDarkThemeId: $defaultDarkThemeId, defaultFont: $defaultFont, applyToAllThemes: $applyToAllThemes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThemeConfiguration &&
            const DeepCollectionEquality()
                .equals(other._lightThemes, _lightThemes) &&
            const DeepCollectionEquality()
                .equals(other._darkThemes, _darkThemes) &&
            const DeepCollectionEquality().equals(other._fonts, _fonts) &&
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.defaultThemeMode, defaultThemeMode) ||
                other.defaultThemeMode == defaultThemeMode) &&
            (identical(other.persist, persist) || other.persist == persist) &&
            (identical(other.defaultLightThemeId, defaultLightThemeId) ||
                other.defaultLightThemeId == defaultLightThemeId) &&
            (identical(other.defaultDarkThemeId, defaultDarkThemeId) ||
                other.defaultDarkThemeId == defaultDarkThemeId) &&
            (identical(other.defaultFont, defaultFont) ||
                other.defaultFont == defaultFont) &&
            (identical(other.applyToAllThemes, applyToAllThemes) ||
                other.applyToAllThemes == applyToAllThemes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lightThemes),
      const DeepCollectionEquality().hash(_darkThemes),
      const DeepCollectionEquality().hash(_fonts),
      prefix,
      defaultThemeMode,
      persist,
      defaultLightThemeId,
      defaultDarkThemeId,
      defaultFont,
      applyToAllThemes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThemeConfigurationCopyWith<_$_ThemeConfiguration> get copyWith =>
      __$$_ThemeConfigurationCopyWithImpl<_$_ThemeConfiguration>(
          this, _$identity);
}

abstract class _ThemeConfiguration extends ThemeConfiguration {
  const factory _ThemeConfiguration(
          {required final List<ExtendedTheme> lightThemes,
          required final List<ExtendedTheme> darkThemes,
          required final List<Font> fonts,
          final String prefix,
          final ThemeMode defaultThemeMode,
          final bool persist,
          final String? defaultLightThemeId,
          final String? defaultDarkThemeId,
          final Font? defaultFont,
          final ThemeData Function(ThemeData) applyToAllThemes}) =
      _$_ThemeConfiguration;
  const _ThemeConfiguration._() : super._();

  @override
  List<ExtendedTheme> get lightThemes;
  @override
  List<ExtendedTheme> get darkThemes;
  @override
  List<Font> get fonts;
  @override
  String get prefix;
  @override
  ThemeMode get defaultThemeMode;
  @override
  bool get persist;
  @override
  String? get defaultLightThemeId;
  @override
  String? get defaultDarkThemeId;
  @override
  Font? get defaultFont;
  @override
  ThemeData Function(ThemeData) get applyToAllThemes;
  @override
  @JsonKey(ignore: true)
  _$$_ThemeConfigurationCopyWith<_$_ThemeConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}
