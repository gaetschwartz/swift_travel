// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'font.dart';

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
