library string_utils;

import 'package:flutter/cupertino.dart';
import 'package:swift_travel/utils/string_utils/markdown.dart';
import 'package:utils/levenshtein.dart';

export 'markdown.dart';

extension StringUtils on String {
  String ellipsis(int maxSize, {String trailing = '...'}) {
    final other = maxSize - trailing.length;
    assert(other >= 0, 'maxSize must be at least the trailing length !');
    return length >= other ? substring(0, other) + trailing : this;
  }

  TextSpan parseMarkdown({TextStyle? style}) => parseDecoratedText(this, style: style);

  int distanceTo(String other, {bool caseSensitive = false}) => levenshtein(this, other);
  double scaledDistanceTo(String other, {bool caseSensitive = false}) =>
      scaledLevenshtein(this, other);

  String toCamelCase() =>
      this[0].toUpperCase() +
      substring(1).replaceAllMapped(RegExp('\s(\w)'), (m) => m[1]!.toUpperCase());

  String stripAt() {
    final i = indexOf('@');
    return i == -1 ? this : substring(0, i).trimRight();
  }
}
