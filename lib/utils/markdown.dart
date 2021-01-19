import 'package:flutter/material.dart';

TextSpan parseDecoratedText(String text, TextStyle style) {
  final spans = <TextSpan>[];
  final chars = text.characters;
  var bold = false;
  var italic = false;
  final buffer = StringBuffer();

  for (final c in chars) {
    switch (c) {
      case '*':
        _addSpan(spans, buffer, bold, italic);
        bold = !bold;
        break;
      case '_':
        _addSpan(spans, buffer, bold, italic);
        italic = !italic;
        break;
      default:
        buffer.write(c);
    }
  }
  return TextSpan(children: spans, style: style);
}

void _addSpan(List<TextSpan> spans, StringBuffer buffer, bool bold, bool italic) {
  spans.add(
    TextSpan(
      text: buffer.toString(),
      style: TextStyle(
        fontWeight: bold ? FontWeight.bold : null,
        fontStyle: italic ? FontStyle.italic : null,
      ),
    ),
  );
  buffer.clear();
}
