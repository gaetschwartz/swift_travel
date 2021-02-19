import 'package:flutter/material.dart';

TextSpan parseDecoratedText(String text, {TextStyle? style}) {
  final spans = <TextSpan>[];
  final chars = text.characters;
  var bold = false;
  var italic = false;
  var lastWasMod = false;
  final buffer = StringBuffer();

  for (final c in chars) {
    switch (c) {
      case '*':
        if (!lastWasMod) _addSpan(spans, buffer, bold, italic);
        bold = !bold;
        lastWasMod = true;
        break;
      case '_':
        if (!lastWasMod) _addSpan(spans, buffer, bold, italic);
        italic = !italic;
        lastWasMod = true;
        break;
      default:
        buffer.write(c);
        lastWasMod = false;
    }
  }
  _addSpan(spans, buffer, bold, italic);
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
