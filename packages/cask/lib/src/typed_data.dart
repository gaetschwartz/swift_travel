import 'dart:math';

import 'package:flutter/foundation.dart';

@immutable
class UnsignedInt {
  const UnsignedInt(this.value, [this.maxSize = 8])
      : assert(value >= 0, 'Only supports positive values');

  UnsignedInt.fromList(List<int> data, [int start = 0, this.maxSize = 8])
      : value = parseInt(data, start, maxSize);

  static int parseInt(List<int> data, [int start = 0, int length = 8]) {
    var n = 0;
    for (var i = start; i < min(data.length, start + length); i++) {
      n |= data[i] << (i * 8);
    }
    return n;
  }

  final int value;
  final int maxSize;

  List<int> toList() {
    final l = <int>[];

    var b = value;
    l.add(b & 0xff);

    for (var i = 0; i < maxSize; i++) {
      b >>= 8;
      l.add(b & 0xff);
      if (b <= 0xff) {
        break;
      }
    }

    return l;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is UnsignedInt && other.value == value;
  }

  @override
  String toString() => 'Int($value)';
}

@immutable
class Uint16 extends UnsignedInt {
  const Uint16(int value) : super(value, 2);

  Uint16.fromList(List<int> data, [int start = 0]) : super.fromList(data, start, 2);

  @override
  String toString() => 'Int16($value)';
}
