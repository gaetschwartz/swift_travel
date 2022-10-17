// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$TextFieldConfigurationCopyWithImpl<$Res, TextFieldConfiguration>;
  @useResult
  $Res call(
      {String? placeholder,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      Widget? prefix,
      FocusNode? focusNode,
      Key? key});
}

/// @nodoc
class _$TextFieldConfigurationCopyWithImpl<$Res,
        $Val extends TextFieldConfiguration>
    implements $TextFieldConfigurationCopyWith<$Res> {
  _$TextFieldConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
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
      placeholder: freezed == placeholder
          ? _value.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
      inputFormatters: freezed == inputFormatters
          ? _value.inputFormatters
          : inputFormatters // ignore: cast_nullable_to_non_nullable
              as List<TextInputFormatter>?,
      textInputAction: freezed == textInputAction
          ? _value.textInputAction
          : textInputAction // ignore: cast_nullable_to_non_nullable
              as TextInputAction?,
      prefix: freezed == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as Widget?,
      focusNode: freezed == focusNode
          ? _value.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TextFieldConfigurationCopyWith<$Res>
    implements $TextFieldConfigurationCopyWith<$Res> {
  factory _$$_TextFieldConfigurationCopyWith(_$_TextFieldConfiguration value,
          $Res Function(_$_TextFieldConfiguration) then) =
      __$$_TextFieldConfigurationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? placeholder,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      Widget? prefix,
      FocusNode? focusNode,
      Key? key});
}

/// @nodoc
class __$$_TextFieldConfigurationCopyWithImpl<$Res>
    extends _$TextFieldConfigurationCopyWithImpl<$Res,
        _$_TextFieldConfiguration>
    implements _$$_TextFieldConfigurationCopyWith<$Res> {
  __$$_TextFieldConfigurationCopyWithImpl(_$_TextFieldConfiguration _value,
      $Res Function(_$_TextFieldConfiguration) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeholder = freezed,
    Object? inputFormatters = freezed,
    Object? textInputAction = freezed,
    Object? prefix = freezed,
    Object? focusNode = freezed,
    Object? key = freezed,
  }) {
    return _then(_$_TextFieldConfiguration(
      placeholder: freezed == placeholder
          ? _value.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
      inputFormatters: freezed == inputFormatters
          ? _value._inputFormatters
          : inputFormatters // ignore: cast_nullable_to_non_nullable
              as List<TextInputFormatter>?,
      textInputAction: freezed == textInputAction
          ? _value.textInputAction
          : textInputAction // ignore: cast_nullable_to_non_nullable
              as TextInputAction?,
      prefix: freezed == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as Widget?,
      focusNode: freezed == focusNode
          ? _value.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      key: freezed == key
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
      final List<TextInputFormatter>? inputFormatters,
      this.textInputAction,
      this.prefix,
      this.focusNode,
      this.key})
      : _inputFormatters = inputFormatters,
        super._();

  @override
  final String? placeholder;
  final List<TextInputFormatter>? _inputFormatters;
  @override
  List<TextInputFormatter>? get inputFormatters {
    final value = _inputFormatters;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
            other is _$_TextFieldConfiguration &&
            (identical(other.placeholder, placeholder) ||
                other.placeholder == placeholder) &&
            const DeepCollectionEquality()
                .equals(other._inputFormatters, _inputFormatters) &&
            (identical(other.textInputAction, textInputAction) ||
                other.textInputAction == textInputAction) &&
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.focusNode, focusNode) ||
                other.focusNode == focusNode) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      placeholder,
      const DeepCollectionEquality().hash(_inputFormatters),
      textInputAction,
      prefix,
      focusNode,
      key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextFieldConfigurationCopyWith<_$_TextFieldConfiguration> get copyWith =>
      __$$_TextFieldConfigurationCopyWithImpl<_$_TextFieldConfiguration>(
          this, _$identity);
}

abstract class _TextFieldConfiguration extends TextFieldConfiguration {
  const factory _TextFieldConfiguration(
      {final String? placeholder,
      final List<TextInputFormatter>? inputFormatters,
      final TextInputAction? textInputAction,
      final Widget? prefix,
      final FocusNode? focusNode,
      final Key? key}) = _$_TextFieldConfiguration;
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
  _$$_TextFieldConfigurationCopyWith<_$_TextFieldConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}
