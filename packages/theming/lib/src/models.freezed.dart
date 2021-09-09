// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FontTearOff {
  const _$FontTearOff();

  _Font call(String name, TextTheme Function(TextTheme) textTheme) {
    return _Font(
      name,
      textTheme,
    );
  }
}

/// @nodoc
const $Font = _$FontTearOff();

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
      _$FontCopyWithImpl<$Res>;
  $Res call({String name, TextTheme Function(TextTheme) textTheme});
}

/// @nodoc
class _$FontCopyWithImpl<$Res> implements $FontCopyWith<$Res> {
  _$FontCopyWithImpl(this._value, this._then);

  final Font _value;
  // ignore: unused_field
  final $Res Function(Font) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? textTheme = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      textTheme: textTheme == freezed
          ? _value.textTheme
          : textTheme // ignore: cast_nullable_to_non_nullable
              as TextTheme Function(TextTheme),
    ));
  }
}

/// @nodoc
abstract class _$FontCopyWith<$Res> implements $FontCopyWith<$Res> {
  factory _$FontCopyWith(_Font value, $Res Function(_Font) then) =
      __$FontCopyWithImpl<$Res>;
  @override
  $Res call({String name, TextTheme Function(TextTheme) textTheme});
}

/// @nodoc
class __$FontCopyWithImpl<$Res> extends _$FontCopyWithImpl<$Res>
    implements _$FontCopyWith<$Res> {
  __$FontCopyWithImpl(_Font _value, $Res Function(_Font) _then)
      : super(_value, (v) => _then(v as _Font));

  @override
  _Font get _value => super._value as _Font;

  @override
  $Res call({
    Object? name = freezed,
    Object? textTheme = freezed,
  }) {
    return _then(_Font(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      textTheme == freezed
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
        (other is _Font &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.textTheme, textTheme) ||
                const DeepCollectionEquality()
                    .equals(other.textTheme, textTheme)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(textTheme);

  @JsonKey(ignore: true)
  @override
  _$FontCopyWith<_Font> get copyWith =>
      __$FontCopyWithImpl<_Font>(this, _$identity);
}

abstract class _Font implements Font {
  const factory _Font(String name, TextTheme Function(TextTheme) textTheme) =
      _$_Font;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  TextTheme Function(TextTheme) get textTheme =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FontCopyWith<_Font> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$ExtendedThemeTearOff {
  const _$ExtendedThemeTearOff();

  _ExtendedTheme call(
      {required ColorScheme colorScheme,
      required String name,
      ThemeData Function(ThemeData) apply = _identity,
      String description = 'Description',
      ShadowTheme shadow = const ShadowTheme(),
      bool hide = false,
      required Brightness brightness,
      required String id}) {
    return _ExtendedTheme(
      colorScheme: colorScheme,
      name: name,
      apply: apply,
      description: description,
      shadow: shadow,
      hide: hide,
      brightness: brightness,
      id: id,
    );
  }
}

/// @nodoc
const $ExtendedTheme = _$ExtendedThemeTearOff();

/// @nodoc
mixin _$ExtendedTheme {
  ColorScheme get colorScheme => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ThemeData Function(ThemeData) get apply => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ShadowTheme get shadow => throw _privateConstructorUsedError;
  bool get hide => throw _privateConstructorUsedError;
  Brightness get brightness => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExtendedThemeCopyWith<ExtendedTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtendedThemeCopyWith<$Res> {
  factory $ExtendedThemeCopyWith(
          ExtendedTheme value, $Res Function(ExtendedTheme) then) =
      _$ExtendedThemeCopyWithImpl<$Res>;
  $Res call(
      {ColorScheme colorScheme,
      String name,
      ThemeData Function(ThemeData) apply,
      String description,
      ShadowTheme shadow,
      bool hide,
      Brightness brightness,
      String id});

  $ShadowThemeCopyWith<$Res> get shadow;
}

/// @nodoc
class _$ExtendedThemeCopyWithImpl<$Res>
    implements $ExtendedThemeCopyWith<$Res> {
  _$ExtendedThemeCopyWithImpl(this._value, this._then);

  final ExtendedTheme _value;
  // ignore: unused_field
  final $Res Function(ExtendedTheme) _then;

  @override
  $Res call({
    Object? colorScheme = freezed,
    Object? name = freezed,
    Object? apply = freezed,
    Object? description = freezed,
    Object? shadow = freezed,
    Object? hide = freezed,
    Object? brightness = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      colorScheme: colorScheme == freezed
          ? _value.colorScheme
          : colorScheme // ignore: cast_nullable_to_non_nullable
              as ColorScheme,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      apply: apply == freezed
          ? _value.apply
          : apply // ignore: cast_nullable_to_non_nullable
              as ThemeData Function(ThemeData),
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shadow: shadow == freezed
          ? _value.shadow
          : shadow // ignore: cast_nullable_to_non_nullable
              as ShadowTheme,
      hide: hide == freezed
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool,
      brightness: brightness == freezed
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ShadowThemeCopyWith<$Res> get shadow {
    return $ShadowThemeCopyWith<$Res>(_value.shadow, (value) {
      return _then(_value.copyWith(shadow: value));
    });
  }
}

/// @nodoc
abstract class _$ExtendedThemeCopyWith<$Res>
    implements $ExtendedThemeCopyWith<$Res> {
  factory _$ExtendedThemeCopyWith(
          _ExtendedTheme value, $Res Function(_ExtendedTheme) then) =
      __$ExtendedThemeCopyWithImpl<$Res>;
  @override
  $Res call(
      {ColorScheme colorScheme,
      String name,
      ThemeData Function(ThemeData) apply,
      String description,
      ShadowTheme shadow,
      bool hide,
      Brightness brightness,
      String id});

  @override
  $ShadowThemeCopyWith<$Res> get shadow;
}

/// @nodoc
class __$ExtendedThemeCopyWithImpl<$Res>
    extends _$ExtendedThemeCopyWithImpl<$Res>
    implements _$ExtendedThemeCopyWith<$Res> {
  __$ExtendedThemeCopyWithImpl(
      _ExtendedTheme _value, $Res Function(_ExtendedTheme) _then)
      : super(_value, (v) => _then(v as _ExtendedTheme));

  @override
  _ExtendedTheme get _value => super._value as _ExtendedTheme;

  @override
  $Res call({
    Object? colorScheme = freezed,
    Object? name = freezed,
    Object? apply = freezed,
    Object? description = freezed,
    Object? shadow = freezed,
    Object? hide = freezed,
    Object? brightness = freezed,
    Object? id = freezed,
  }) {
    return _then(_ExtendedTheme(
      colorScheme: colorScheme == freezed
          ? _value.colorScheme
          : colorScheme // ignore: cast_nullable_to_non_nullable
              as ColorScheme,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      apply: apply == freezed
          ? _value.apply
          : apply // ignore: cast_nullable_to_non_nullable
              as ThemeData Function(ThemeData),
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shadow: shadow == freezed
          ? _value.shadow
          : shadow // ignore: cast_nullable_to_non_nullable
              as ShadowTheme,
      hide: hide == freezed
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool,
      brightness: brightness == freezed
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ExtendedTheme implements _ExtendedTheme {
  const _$_ExtendedTheme(
      {required this.colorScheme,
      required this.name,
      this.apply = _identity,
      this.description = 'Description',
      this.shadow = const ShadowTheme(),
      this.hide = false,
      required this.brightness,
      required this.id});

  @override
  final ColorScheme colorScheme;
  @override
  final String name;
  @JsonKey(defaultValue: _identity)
  @override
  final ThemeData Function(ThemeData) apply;
  @JsonKey(defaultValue: 'Description')
  @override
  final String description;
  @JsonKey(defaultValue: const ShadowTheme())
  @override
  final ShadowTheme shadow;
  @JsonKey(defaultValue: false)
  @override
  final bool hide;
  @override
  final Brightness brightness;
  @override
  final String id;

  @override
  String toString() {
    return 'ExtendedTheme(colorScheme: $colorScheme, name: $name, apply: $apply, description: $description, shadow: $shadow, hide: $hide, brightness: $brightness, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ExtendedTheme &&
            (identical(other.colorScheme, colorScheme) ||
                const DeepCollectionEquality()
                    .equals(other.colorScheme, colorScheme)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.apply, apply) ||
                const DeepCollectionEquality().equals(other.apply, apply)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.shadow, shadow) ||
                const DeepCollectionEquality().equals(other.shadow, shadow)) &&
            (identical(other.hide, hide) ||
                const DeepCollectionEquality().equals(other.hide, hide)) &&
            (identical(other.brightness, brightness) ||
                const DeepCollectionEquality()
                    .equals(other.brightness, brightness)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(colorScheme) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(apply) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(shadow) ^
      const DeepCollectionEquality().hash(hide) ^
      const DeepCollectionEquality().hash(brightness) ^
      const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$ExtendedThemeCopyWith<_ExtendedTheme> get copyWith =>
      __$ExtendedThemeCopyWithImpl<_ExtendedTheme>(this, _$identity);
}

abstract class _ExtendedTheme implements ExtendedTheme {
  const factory _ExtendedTheme(
      {required ColorScheme colorScheme,
      required String name,
      ThemeData Function(ThemeData) apply,
      String description,
      ShadowTheme shadow,
      bool hide,
      required Brightness brightness,
      required String id}) = _$_ExtendedTheme;

  @override
  ColorScheme get colorScheme => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  ThemeData Function(ThemeData) get apply => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  ShadowTheme get shadow => throw _privateConstructorUsedError;
  @override
  bool get hide => throw _privateConstructorUsedError;
  @override
  Brightness get brightness => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ExtendedThemeCopyWith<_ExtendedTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FullThemeTearOff {
  const _$FullThemeTearOff();

  _FullTheme call({required ExtendedTheme light, required ExtendedTheme dark}) {
    return _FullTheme(
      light: light,
      dark: dark,
    );
  }
}

/// @nodoc
const $FullTheme = _$FullThemeTearOff();

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
      _$FullThemeCopyWithImpl<$Res>;
  $Res call({ExtendedTheme light, ExtendedTheme dark});

  $ExtendedThemeCopyWith<$Res> get light;
  $ExtendedThemeCopyWith<$Res> get dark;
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
  }) {
    return _then(_value.copyWith(
      light: light == freezed
          ? _value.light
          : light // ignore: cast_nullable_to_non_nullable
              as ExtendedTheme,
      dark: dark == freezed
          ? _value.dark
          : dark // ignore: cast_nullable_to_non_nullable
              as ExtendedTheme,
    ));
  }

  @override
  $ExtendedThemeCopyWith<$Res> get light {
    return $ExtendedThemeCopyWith<$Res>(_value.light, (value) {
      return _then(_value.copyWith(light: value));
    });
  }

  @override
  $ExtendedThemeCopyWith<$Res> get dark {
    return $ExtendedThemeCopyWith<$Res>(_value.dark, (value) {
      return _then(_value.copyWith(dark: value));
    });
  }
}

/// @nodoc
abstract class _$FullThemeCopyWith<$Res> implements $FullThemeCopyWith<$Res> {
  factory _$FullThemeCopyWith(
          _FullTheme value, $Res Function(_FullTheme) then) =
      __$FullThemeCopyWithImpl<$Res>;
  @override
  $Res call({ExtendedTheme light, ExtendedTheme dark});

  @override
  $ExtendedThemeCopyWith<$Res> get light;
  @override
  $ExtendedThemeCopyWith<$Res> get dark;
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
  }) {
    return _then(_FullTheme(
      light: light == freezed
          ? _value.light
          : light // ignore: cast_nullable_to_non_nullable
              as ExtendedTheme,
      dark: dark == freezed
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
        (other is _FullTheme &&
            (identical(other.light, light) ||
                const DeepCollectionEquality().equals(other.light, light)) &&
            (identical(other.dark, dark) ||
                const DeepCollectionEquality().equals(other.dark, dark)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(light) ^
      const DeepCollectionEquality().hash(dark);

  @JsonKey(ignore: true)
  @override
  _$FullThemeCopyWith<_FullTheme> get copyWith =>
      __$FullThemeCopyWithImpl<_FullTheme>(this, _$identity);
}

abstract class _FullTheme implements FullTheme {
  const factory _FullTheme(
      {required ExtendedTheme light,
      required ExtendedTheme dark}) = _$_FullTheme;

  @override
  ExtendedTheme get light => throw _privateConstructorUsedError;
  @override
  ExtendedTheme get dark => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FullThemeCopyWith<_FullTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

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
          : buttonShadow // ignore: cast_nullable_to_non_nullable
              as BoxShadow?,
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
  const factory _ShadowTheme({BoxShadow? buttonShadow}) = _$_ShadowTheme;
  const _ShadowTheme._() : super._();

  @override
  BoxShadow? get buttonShadow => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShadowThemeCopyWith<_ShadowTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ThemeConfigurationTearOff {
  const _$ThemeConfigurationTearOff();

  _ThemeConfiguration call(
      {required List<ExtendedTheme> lightThemes,
      required List<ExtendedTheme> darkThemes,
      required List<Font> fonts,
      String prefix = 'dyn_theme_',
      ThemeMode defaultThemeMode = ThemeMode.system,
      bool persist = true,
      String? defaultLightThemeId,
      String? defaultDarkThemeId,
      Font? defaultFont,
      TextTheme defaultTextTheme = Typography.englishLike2018,
      ThemeData Function(ThemeData) applyToAllThemes = _identity}) {
    return _ThemeConfiguration(
      lightThemes: lightThemes,
      darkThemes: darkThemes,
      fonts: fonts,
      prefix: prefix,
      defaultThemeMode: defaultThemeMode,
      persist: persist,
      defaultLightThemeId: defaultLightThemeId,
      defaultDarkThemeId: defaultDarkThemeId,
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
  List<ExtendedTheme> get lightThemes => throw _privateConstructorUsedError;
  List<ExtendedTheme> get darkThemes => throw _privateConstructorUsedError;
  List<Font> get fonts => throw _privateConstructorUsedError;
  String get prefix => throw _privateConstructorUsedError;
  ThemeMode get defaultThemeMode => throw _privateConstructorUsedError;
  bool get persist => throw _privateConstructorUsedError;
  String? get defaultLightThemeId => throw _privateConstructorUsedError;
  String? get defaultDarkThemeId => throw _privateConstructorUsedError;
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
      {List<ExtendedTheme> lightThemes,
      List<ExtendedTheme> darkThemes,
      List<Font> fonts,
      String prefix,
      ThemeMode defaultThemeMode,
      bool persist,
      String? defaultLightThemeId,
      String? defaultDarkThemeId,
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
    Object? lightThemes = freezed,
    Object? darkThemes = freezed,
    Object? fonts = freezed,
    Object? prefix = freezed,
    Object? defaultThemeMode = freezed,
    Object? persist = freezed,
    Object? defaultLightThemeId = freezed,
    Object? defaultDarkThemeId = freezed,
    Object? defaultFont = freezed,
    Object? defaultTextTheme = freezed,
    Object? applyToAllThemes = freezed,
  }) {
    return _then(_value.copyWith(
      lightThemes: lightThemes == freezed
          ? _value.lightThemes
          : lightThemes // ignore: cast_nullable_to_non_nullable
              as List<ExtendedTheme>,
      darkThemes: darkThemes == freezed
          ? _value.darkThemes
          : darkThemes // ignore: cast_nullable_to_non_nullable
              as List<ExtendedTheme>,
      fonts: fonts == freezed
          ? _value.fonts
          : fonts // ignore: cast_nullable_to_non_nullable
              as List<Font>,
      prefix: prefix == freezed
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String,
      defaultThemeMode: defaultThemeMode == freezed
          ? _value.defaultThemeMode
          : defaultThemeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      persist: persist == freezed
          ? _value.persist
          : persist // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultLightThemeId: defaultLightThemeId == freezed
          ? _value.defaultLightThemeId
          : defaultLightThemeId // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultDarkThemeId: defaultDarkThemeId == freezed
          ? _value.defaultDarkThemeId
          : defaultDarkThemeId // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultFont: defaultFont == freezed
          ? _value.defaultFont
          : defaultFont // ignore: cast_nullable_to_non_nullable
              as Font?,
      defaultTextTheme: defaultTextTheme == freezed
          ? _value.defaultTextTheme
          : defaultTextTheme // ignore: cast_nullable_to_non_nullable
              as TextTheme,
      applyToAllThemes: applyToAllThemes == freezed
          ? _value.applyToAllThemes
          : applyToAllThemes // ignore: cast_nullable_to_non_nullable
              as ThemeData Function(ThemeData),
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
      {List<ExtendedTheme> lightThemes,
      List<ExtendedTheme> darkThemes,
      List<Font> fonts,
      String prefix,
      ThemeMode defaultThemeMode,
      bool persist,
      String? defaultLightThemeId,
      String? defaultDarkThemeId,
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
    Object? lightThemes = freezed,
    Object? darkThemes = freezed,
    Object? fonts = freezed,
    Object? prefix = freezed,
    Object? defaultThemeMode = freezed,
    Object? persist = freezed,
    Object? defaultLightThemeId = freezed,
    Object? defaultDarkThemeId = freezed,
    Object? defaultFont = freezed,
    Object? defaultTextTheme = freezed,
    Object? applyToAllThemes = freezed,
  }) {
    return _then(_ThemeConfiguration(
      lightThemes: lightThemes == freezed
          ? _value.lightThemes
          : lightThemes // ignore: cast_nullable_to_non_nullable
              as List<ExtendedTheme>,
      darkThemes: darkThemes == freezed
          ? _value.darkThemes
          : darkThemes // ignore: cast_nullable_to_non_nullable
              as List<ExtendedTheme>,
      fonts: fonts == freezed
          ? _value.fonts
          : fonts // ignore: cast_nullable_to_non_nullable
              as List<Font>,
      prefix: prefix == freezed
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String,
      defaultThemeMode: defaultThemeMode == freezed
          ? _value.defaultThemeMode
          : defaultThemeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      persist: persist == freezed
          ? _value.persist
          : persist // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultLightThemeId: defaultLightThemeId == freezed
          ? _value.defaultLightThemeId
          : defaultLightThemeId // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultDarkThemeId: defaultDarkThemeId == freezed
          ? _value.defaultDarkThemeId
          : defaultDarkThemeId // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultFont: defaultFont == freezed
          ? _value.defaultFont
          : defaultFont // ignore: cast_nullable_to_non_nullable
              as Font?,
      defaultTextTheme: defaultTextTheme == freezed
          ? _value.defaultTextTheme
          : defaultTextTheme // ignore: cast_nullable_to_non_nullable
              as TextTheme,
      applyToAllThemes: applyToAllThemes == freezed
          ? _value.applyToAllThemes
          : applyToAllThemes // ignore: cast_nullable_to_non_nullable
              as ThemeData Function(ThemeData),
    ));
  }
}

/// @nodoc

class _$_ThemeConfiguration extends _ThemeConfiguration {
  const _$_ThemeConfiguration(
      {required this.lightThemes,
      required this.darkThemes,
      required this.fonts,
      this.prefix = 'dyn_theme_',
      this.defaultThemeMode = ThemeMode.system,
      this.persist = true,
      this.defaultLightThemeId,
      this.defaultDarkThemeId,
      this.defaultFont,
      this.defaultTextTheme = Typography.englishLike2018,
      this.applyToAllThemes = _identity})
      : super._();

  @override
  final List<ExtendedTheme> lightThemes;
  @override
  final List<ExtendedTheme> darkThemes;
  @override
  final List<Font> fonts;
  @JsonKey(defaultValue: 'dyn_theme_')
  @override
  final String prefix;
  @JsonKey(defaultValue: ThemeMode.system)
  @override
  final ThemeMode defaultThemeMode;
  @JsonKey(defaultValue: true)
  @override
  final bool persist;
  @override
  final String? defaultLightThemeId;
  @override
  final String? defaultDarkThemeId;
  @override
  final Font? defaultFont;
  @JsonKey(defaultValue: Typography.englishLike2018)
  @override
  final TextTheme defaultTextTheme;
  @JsonKey(defaultValue: _identity)
  @override
  final ThemeData Function(ThemeData) applyToAllThemes;

  @override
  String toString() {
    return 'ThemeConfiguration(lightThemes: $lightThemes, darkThemes: $darkThemes, fonts: $fonts, prefix: $prefix, defaultThemeMode: $defaultThemeMode, persist: $persist, defaultLightThemeId: $defaultLightThemeId, defaultDarkThemeId: $defaultDarkThemeId, defaultFont: $defaultFont, defaultTextTheme: $defaultTextTheme, applyToAllThemes: $applyToAllThemes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeConfiguration &&
            (identical(other.lightThemes, lightThemes) ||
                const DeepCollectionEquality()
                    .equals(other.lightThemes, lightThemes)) &&
            (identical(other.darkThemes, darkThemes) ||
                const DeepCollectionEquality()
                    .equals(other.darkThemes, darkThemes)) &&
            (identical(other.fonts, fonts) ||
                const DeepCollectionEquality().equals(other.fonts, fonts)) &&
            (identical(other.prefix, prefix) ||
                const DeepCollectionEquality().equals(other.prefix, prefix)) &&
            (identical(other.defaultThemeMode, defaultThemeMode) ||
                const DeepCollectionEquality()
                    .equals(other.defaultThemeMode, defaultThemeMode)) &&
            (identical(other.persist, persist) ||
                const DeepCollectionEquality()
                    .equals(other.persist, persist)) &&
            (identical(other.defaultLightThemeId, defaultLightThemeId) ||
                const DeepCollectionEquality()
                    .equals(other.defaultLightThemeId, defaultLightThemeId)) &&
            (identical(other.defaultDarkThemeId, defaultDarkThemeId) ||
                const DeepCollectionEquality()
                    .equals(other.defaultDarkThemeId, defaultDarkThemeId)) &&
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
      const DeepCollectionEquality().hash(lightThemes) ^
      const DeepCollectionEquality().hash(darkThemes) ^
      const DeepCollectionEquality().hash(fonts) ^
      const DeepCollectionEquality().hash(prefix) ^
      const DeepCollectionEquality().hash(defaultThemeMode) ^
      const DeepCollectionEquality().hash(persist) ^
      const DeepCollectionEquality().hash(defaultLightThemeId) ^
      const DeepCollectionEquality().hash(defaultDarkThemeId) ^
      const DeepCollectionEquality().hash(defaultFont) ^
      const DeepCollectionEquality().hash(defaultTextTheme) ^
      const DeepCollectionEquality().hash(applyToAllThemes);

  @JsonKey(ignore: true)
  @override
  _$ThemeConfigurationCopyWith<_ThemeConfiguration> get copyWith =>
      __$ThemeConfigurationCopyWithImpl<_ThemeConfiguration>(this, _$identity);
}

abstract class _ThemeConfiguration extends ThemeConfiguration {
  const factory _ThemeConfiguration(
      {required List<ExtendedTheme> lightThemes,
      required List<ExtendedTheme> darkThemes,
      required List<Font> fonts,
      String prefix,
      ThemeMode defaultThemeMode,
      bool persist,
      String? defaultLightThemeId,
      String? defaultDarkThemeId,
      Font? defaultFont,
      TextTheme defaultTextTheme,
      ThemeData Function(ThemeData) applyToAllThemes}) = _$_ThemeConfiguration;
  const _ThemeConfiguration._() : super._();

  @override
  List<ExtendedTheme> get lightThemes => throw _privateConstructorUsedError;
  @override
  List<ExtendedTheme> get darkThemes => throw _privateConstructorUsedError;
  @override
  List<Font> get fonts => throw _privateConstructorUsedError;
  @override
  String get prefix => throw _privateConstructorUsedError;
  @override
  ThemeMode get defaultThemeMode => throw _privateConstructorUsedError;
  @override
  bool get persist => throw _privateConstructorUsedError;
  @override
  String? get defaultLightThemeId => throw _privateConstructorUsedError;
  @override
  String? get defaultDarkThemeId => throw _privateConstructorUsedError;
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
