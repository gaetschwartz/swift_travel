library string_utils;

import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'markdown.dart';

export 'markdown.dart';

extension StringUtils on String {
  String ellipsis(int maxSize, {String trailing = '...'}) {
    final other = maxSize - trailing.length;
    assert(other >= 0, 'maxSize must be at least the trailing length !');
    return length >= other ? substring(0, other) + trailing : this;
  }

  TextSpan parseMarkdown({TextStyle? style}) => parseDecoratedText(this, style: style);

  /// Levenshtein distance to another string
  int distanceTo(String other, {bool caseSensitive = false}) =>
      levenshtein(this, other, caseSensitive: caseSensitive);

  /// Scaled levenshtein distance to another string
  double scaledDistanceTo(String other, {bool caseSensitive = false}) =>
      scaledLevenshtein(this, other, caseSensitive: caseSensitive);

  String toCamelCase() =>
      this[0].toUpperCase() +
      substring(1).replaceAllMapped(RegExp(r'\s(\w)'), (m) => m[1]!.toUpperCase());

  String stripAt() {
    final i = indexOf('@');
    return i == -1 ? this : substring(0, i).trimRight();
  }
}

/// Compute the distance between two strings. It effectively counts
/// how many changes we need to do to go from A to B.
///
/// See also: https://en.wikipedia.org/wiki/Levenshtein_distance
int levenshtein(String stringA, String stringB, {bool caseSensitive = false}) {
  final s = caseSensitive ? stringA : stringA.toLowerCase();
  final t = caseSensitive ? stringB : stringB.toLowerCase();

  if (s == t) {
    return 0;
  }
  if (s.isEmpty) {
    return t.length;
  }
  if (t.isEmpty) {
    return s.length;
  }

  final v0 = List.generate(t.length + 1, (i) => i, growable: false);
  final v1 = List<int>.filled(t.length + 1, 0);

  for (var i = 0; i < s.length; i++) {
    v1.first = i + 1;

    for (var j = 0; j < t.length; j++) {
      final cost = (s[i] == t[j]) ? 0 : 1;
      v1[j + 1] = min<int>(v1[j] + 1, min<int>(v0[j + 1] + 1, v0[j] + cost));
    }

    for (var j = 0; j < t.length + 1; j++) {
      v0[j] = v1[j];
    }
  }
  return v1[t.length];
}

/// Scaled version of the Levenshtein algorithm to stringB's length.
/// Basically means what is proportion of stringA similar to stringB.
///
/// ```dart
/// scaledLevenshtein(a,b) = levenshtein(a,b) / b.length;
/// ```
///
/// See also: https://en.wikipedia.org/wiki/Levenshtein_distance
double scaledLevenshtein(String stringA, String stringB, {bool caseSensitive = false}) =>
    levenshtein(stringA, stringB, caseSensitive: caseSensitive) /
    max(stringA.length, stringB.length);
