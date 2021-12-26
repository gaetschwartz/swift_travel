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
class _$TextFieldConfigurationTearOff {
  const _$TextFieldConfigurationTearOff();

  _TextFieldConfiguration call(
      {String? placeholder,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      Widget? prefix,
      FocusNode? focusNode,
      Key? key}) {
    return _TextFieldConfiguration(
      placeholder: placeholder,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      prefix: prefix,
      focusNode: focusNode,
      key: key,
    );
  }
}

/// @nodoc
const $TextFieldConfiguration = _$TextFieldConfigurationTearOff();

/// @nodoc
mixin _$TextFieldConfiguration {
  String? get placeholder => throw _privateConstructorUsedError;
  List<TextInputFormatter>? get inputFormatters =>
      throw _privateConstructorUsedError;
  TextInputAction? get textInputAction => throw _privateConstructorUsedError;
  Widget? get prefix => throw _privateConstructorUsedError;
  FocusNode? get focusNode => throw _privateConstructorUsedError;
  Key? get key => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextFieldConfigurationCopyWith<TextFieldConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextFieldConfigurationCopyWith<$Res> {
  factory $TextFieldConfigurationCopyWith(TextFieldConfiguration value,
          $Res Function(TextFieldConfiguration) then) =
      _$TextFieldConfigurationCopyWithImpl<$Res>;
  $Res call(
      {String? placeholder,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      Widget? prefix,
      FocusNode? focusNode,
      Key? key});
}

/// @nodoc
class _$TextFieldConfigurationCopyWithImpl<$Res>
    implements $TextFieldConfigurationCopyWith<$Res> {
  _$TextFieldConfigurationCopyWithImpl(this._value, this._then);

  final TextFieldConfiguration _value;
  // ignore: unused_field
  final $Res Function(TextFieldConfiguration) _then;

  @override
  $Res call({
    Object? placeholder = freezed,
    Object? inputFormatters = freezed,
    Object? textInputAction = freezed,
    Object? prefix = freezed,
    Object? focusNode = freezed,
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      placeholder: placeholder == freezed
          ? _value.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
      inputFormatters: inputFormatters == freezed
          ? _value.inputFormatters
          : inputFormatters // ignore: cast_nullable_to_non_nullable
              as List<TextInputFormatter>?,
      textInputAction: textInputAction == freezed
          ? _value.textInputAction
          : textInputAction // ignore: cast_nullable_to_non_nullable
              as TextInputAction?,
      prefix: prefix == freezed
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as Widget?,
      focusNode: focusNode == freezed
          ? _value.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key?,
    ));
  }
}

/// @nodoc
abstract class _$TextFieldConfigurationCopyWith<$Res>
    implements $TextFieldConfigurationCopyWith<$Res> {
  factory _$TextFieldConfigurationCopyWith(_TextFieldConfiguration value,
          $Res Function(_TextFieldConfiguration) then) =
      __$TextFieldConfigurationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? placeholder,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      Widget? prefix,
      FocusNode? focusNode,
      Key? key});
}

/// @nodoc
class __$TextFieldConfigurationCopyWithImpl<$Res>
    extends _$TextFieldConfigurationCopyWithImpl<$Res>
    implements _$TextFieldConfigurationCopyWith<$Res> {
  __$TextFieldConfigurationCopyWithImpl(_TextFieldConfiguration _value,
      $Res Function(_TextFieldConfiguration) _then)
      : super(_value, (v) => _then(v as _TextFieldConfiguration));

  @override
  _TextFieldConfiguration get _value => super._value as _TextFieldConfiguration;

  @override
  $Res call({
    Object? placeholder = freezed,
    Object? inputFormatters = freezed,
    Object? textInputAction = freezed,
    Object? prefix = freezed,
    Object? focusNode = freezed,
    Object? key = freezed,
  }) {
    return _then(_TextFieldConfiguration(
      placeholder: placeholder == freezed
          ? _value.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
      inputFormatters: inputFormatters == freezed
          ? _value.inputFormatters
          : inputFormatters // ignore: cast_nullable_to_non_nullable
              as List<TextInputFormatter>?,
      textInputAction: textInputAction == freezed
          ? _value.textInputAction
          : textInputAction // ignore: cast_nullable_to_non_nullable
              as TextInputAction?,
      prefix: prefix == freezed
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as Widget?,
      focusNode: focusNode == freezed
          ? _value.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key?,
    ));
  }
}

/// @nodoc

class _$_TextFieldConfiguration extends _TextFieldConfiguration {
  const _$_TextFieldConfiguration(
      {this.placeholder,
      this.inputFormatters,
      this.textInputAction,
      this.prefix,
      this.focusNode,
      this.key})
      : super._();

  @override
  final String? placeholder;
  @override
  final List<TextInputFormatter>? inputFormatters;
  @override
  final TextInputAction? textInputAction;
  @override
  final Widget? prefix;
  @override
  final FocusNode? focusNode;
  @override
  final Key? key;

  @override
  String toString() {
    return 'TextFieldConfiguration(placeholder: $placeholder, inputFormatters: $inputFormatters, textInputAction: $textInputAction, prefix: $prefix, focusNode: $focusNode, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TextFieldConfiguration &&
            const DeepCollectionEquality()
                .equals(other.placeholder, placeholder) &&
            const DeepCollectionEquality()
                .equals(other.inputFormatters, inputFormatters) &&
            const DeepCollectionEquality()
                .equals(other.textInputAction, textInputAction) &&
            const DeepCollectionEquality().equals(other.prefix, prefix) &&
            const DeepCollectionEquality().equals(other.focusNode, focusNode) &&
            const DeepCollectionEquality().equals(other.key, key));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(placeholder),
      const DeepCollectionEquality().hash(inputFormatters),
      const DeepCollectionEquality().hash(textInputAction),
      const DeepCollectionEquality().hash(prefix),
      const DeepCollectionEquality().hash(focusNode),
      const DeepCollectionEquality().hash(key));

  @JsonKey(ignore: true)
  @override
  _$TextFieldConfigurationCopyWith<_TextFieldConfiguration> get copyWith =>
      __$TextFieldConfigurationCopyWithImpl<_TextFieldConfiguration>(
          this, _$identity);
}

abstract class _TextFieldConfiguration extends TextFieldConfiguration {
  const factory _TextFieldConfiguration(
      {String? placeholder,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      Widget? prefix,
      FocusNode? focusNode,
      Key? key}) = _$_TextFieldConfiguration;
  const _TextFieldConfiguration._() : super._();

  @override
  String? get placeholder;
  @override
  List<TextInputFormatter>? get inputFormatters;
  @override
  TextInputAction? get textInputAction;
  @override
  Widget? get prefix;
  @override
  FocusNode? get focusNode;
  @override
  Key? get key;
  @override
  @JsonKey(ignore: true)
  _$TextFieldConfigurationCopyWith<_TextFieldConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}
