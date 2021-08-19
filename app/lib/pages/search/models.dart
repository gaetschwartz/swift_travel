import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

@freezed
class TextFieldConfiguration with _$TextFieldConfiguration {
  const factory TextFieldConfiguration({
    String? placeholder,
    List<TextInputFormatter>? inputFormatters,
    TextInputAction? textInputAction,
    Widget? prefix,
    FocusNode? focusNode,
    Key? key,
  }) = _TextFieldConfiguration;

  const TextFieldConfiguration._();

  Widget toCupertino({TextEditingController? controller}) => CupertinoTextField(
        placeholder: placeholder,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        prefix: prefix,
        focusNode: focusNode,
        controller: controller,
        key: key,
      );

  Widget toTextField({TextEditingController? controller}) => Material(
        child: TextField(
          decoration: InputDecoration(
            hintText: placeholder,
            prefixIcon: prefix,
          ),
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          focusNode: focusNode,
          controller: controller,
          key: key,
        ),
      );
}
