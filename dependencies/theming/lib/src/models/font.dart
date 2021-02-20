import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'font.freezed.dart';

@freezed
abstract class Font with _$Font {
  const factory Font(
      String name, TextTheme Function(TextTheme textTheme) textTheme) = _Font;
}
