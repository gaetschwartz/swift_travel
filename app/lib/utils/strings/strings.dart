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

  TextSpan parseMarkdown({TextStyle? style}) =>
      parseDecoratedText(this, style: style);

  /// Levenshtein distance to another string
  int distanceTo(String other, {bool caseSensitive = false}) =>
      levenshtein(this, other, caseSensitive: caseSensitive);

  /// Scaled levenshtein distance to another string
  double scaledDistanceTo(String other, {bool caseSensitive = false}) =>
      scaledLevenshtein(this, other, caseSensitive: caseSensitive);

  String toCamelCase() =>
      this[0].toUpperCase() +
      substring(1)
          .replaceAllMapped(RegExp(r'\s(\w)'), (m) => m[1]!.toUpperCase());

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
  final a = caseSensitive ? stringA : stringA.toLowerCase();
  final b = caseSensitive ? stringB : stringB.toLowerCase();

  var previousRow = List.generate(a.length + 1, (i) => i, growable: false);
  var currentRow = List.filled(a.length + 1, 0, growable: false);

  for (var i = 1; i <= b.length; i++) {
    currentRow[0] = i;

    for (var j = 1; j <= a.length; j++) {
      final cost = a[j - 1] == b[i - 1] ? 0 : 1;
      currentRow[j] = min(
        currentRow[j - 1] + 1,
        min(previousRow[j] + 1, previousRow[j - 1] + cost),
      );
    }

    previousRow = currentRow;
    currentRow = List.filled(a.length + 1, 0, growable: false);
  }

  return previousRow[a.length];
}

/// Scaled version of the Levenshtein algorithm to stringB's length.
/// Basically means what is proportion of stringA similar to stringB.
/// 0.0 means the strings are identical, 1.0 means they are completely different.
///
/// ```dart
/// scaledLevenshtein(a,b) = levenshtein(a,b) / b.length;
/// ```
///
/// See also: https://en.wikipedia.org/wiki/Levenshtein_distance
double scaledLevenshtein(String stringA, String stringB,
    {bool caseSensitive = false}) {
  final max2 = max(stringA.length, stringB.length);
  if (max2 == 0) {
    return 0.0;
  } else {
    return levenshtein(stringA, stringB, caseSensitive: caseSensitive) / max2;
  }
}

/// The jaro distance between two strings.
/// 1.0 means the strings are *identical*, 0.0 means they are *completely different*.
double formalJaroDistance(String a, String b) {
  // Create a set of the characters in B.
  final bSet = Set.of(b.split(''));

  // Calculate the number of matching characters in the two strings.
  var m = 0;
  for (var i = 0; i < a.length; i++) {
    if (bSet.contains(a[i])) {
      m++;
    }
  }

  if (m == 0) {
    return 0.0;
  }

  // Calculate the number of transpositions in the two strings.
  var t = 0;
  var b1 = '';
  var b2 = '';

  for (var i = 0; i < b.length; i++) {
    if (bSet.contains(b[i])) {
      b1 += b[i];
    }
  }

  for (var i = 0; i < a.length; i++) {
    if (bSet.contains(a[i])) {
      b2 += a[i];
    }
  }

  for (var i = 0; i < min(b1.length, b2.length); i++) {
    if (b1[i] != b2[i]) {
      t++;
    }
  }

  // Calculate and return the Jaro distance.
  return (m / a.length + m / b.length + (m - t / 2) / m) / 3;
}

/// Jaro distance between two strings.
/// 1.0 means the strings are *completely different*, 0.0 means they are *identical*.
double jaroDistance(String a, String b) =>
    1 - formalJaroDistance(a.toLowerCase(), b.toLowerCase());
