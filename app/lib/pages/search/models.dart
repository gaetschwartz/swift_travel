import 'package:flutter/cupertino.dart';
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
}
