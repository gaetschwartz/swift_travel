library string_utils;

import 'package:flutter/cupertino.dart';
import 'package:swift_travel/utils/string_utils/markdown.dart';

export 'markdown.dart';

extension StringEllipsis on String {
  String ellipsis(int maxSize, {String trailing = '...'}) {
    final other = maxSize - trailing.length;
    assert(other >= 0, 'maxSize must be at least the trailing length !');
    return length >= other ? substring(0, other) + trailing : this;
  }

  TextSpan parseMarkdown({TextStyle? style}) => parseDecoratedText(this, style: style);
}
