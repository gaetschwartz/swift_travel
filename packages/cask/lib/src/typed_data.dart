import 'dart:convert';
import 'dart:math';

int _decodeInt(
  List<int> data, {
  required int byteSize,
  int start = 0,
}) {
  var n = 0;
  for (var i = start; i < min(data.length, start + byteSize); i++) {
    n |= data[i] << (i << 3);
  }
  assert(n < 1 << (byteSize << 3),
      'Decoded value has to be smaller than ${1 << (byteSize << 3)}');
  return n;
}

List<int> _encodeInt(
  int value, {
  required int byteSize,
}) {
  assert(value < 1 << (byteSize << 3),
      'Value must be smaller than ${1 << (byteSize << 3)}');
  final l = <int>[];

  var b = value;
  l.add(b & 0xff);

  for (var i = 0; i < byteSize; i++) {
    b >>= 8;
    l.add(b & 0xff);
    if (b <= 0xff) {
      break;
    }
  }

  return l;
}

const uint16 = Uint16Codec();
const uint32 = Uint32Codec();

class Uint16Codec extends Codec<int, List<int>> {
  const Uint16Codec();

  @override
  Converter<List<int>, int> get decoder => const Uint16Decoder();

  @override
  Converter<int, List<int>> get encoder => const Uint16Encoder();
}

class Uint16Decoder extends Converter<List<int>, int> {
  const Uint16Decoder();

  @override
  int convert(List<int> input) => _decodeInt(input, byteSize: 2);
}

class Uint16Encoder extends Converter<int, List<int>> {
  const Uint16Encoder();

  @override
  List<int> convert(int input) => _encodeInt(input, byteSize: 2);
}

class Uint32Codec extends Codec<int, List<int>> {
  const Uint32Codec();

  @override
  Converter<List<int>, int> get decoder => const Uint32Decoder();

  @override
  Converter<int, List<int>> get encoder => const Uint32Encoder();
}

class Uint32Decoder extends Converter<List<int>, int> {
  const Uint32Decoder();

  @override
  int convert(List<int> input) => _decodeInt(input, byteSize: 4);
}

class Uint32Encoder extends Converter<int, List<int>> {
  const Uint32Encoder();

  @override
  List<int> convert(int input) => _encodeInt(input, byteSize: 4);
}
