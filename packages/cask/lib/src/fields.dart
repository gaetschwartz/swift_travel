import 'dart:convert';
import 'dart:io';

import 'package:cask/src/typed_data.dart';

abstract class CaskField<T> {
  const CaskField();

  List<int> encode(T data);
  T decode(RandomAccessFile file);
}

abstract class CaskFieldWithSizeHeader<T> implements CaskField<T> {
  const CaskFieldWithSizeHeader();
  @override
  List<int> encode(T data) => withLengthHeader(encodeData(data));

  @override
  T decode(RandomAccessFile file) {
    final sizeList = file.readSync(2);
    final size = uint16.decode(sizeList);
    final data = file.readSync(size);
    final decoded = decodeData(data);
    return decoded;
  }

  List<int> withLengthHeader(List<int> data) {
    final size = uint16.encode(data.length);
    return List.generate(
        data.length + size.length, (i) => i < 2 ? size[i] : data[i - 2]);
  }

  List<int> encodeData(T data);
  T decodeData(List<int> buffer);
}

class ValueField<T> extends CaskFieldWithSizeHeader<T> {
  const ValueField();

  @override
  T decodeData(List<int> buffer) {
    final s = utf8.decode(buffer);
    final d = json.decode(s) as T;
    return d;
  }

  @override
  List<int> encodeData(T data) {
    final j = json.encode(data);
    final s = utf8.encode(j);
    return s;
  }
}

class Keyfield<T> extends CaskFieldWithSizeHeader<T> {
  const Keyfield();

  @override
  T decodeData(List<int> buffer) {
    if (T == String) {
      return utf8.decode(buffer) as T;
    } else if (T == int) {
      return uint32.decode(buffer) as T;
    } else {
      throw UnsupportedError('Unsupported type `$T`');
    }
  }

  @override
  List<int> encodeData(T data) {
    if (data is int) {
      return uint32.encode(data);
    } else if (data is String) {
      return utf8.encode(data);
    } else {
      throw UnsupportedError('Unsupported type `${data.runtimeType}`');
    }
  }
}

class EntryField<TKey, TValue> extends CaskField<MapEntry<TKey, TValue>> {
  EntryField({int? offset}) : _offset = offset;

  final keyField = Keyfield<TKey>();
  final valueField = ValueField<TValue>();

  int? _size;
  int? get size => _size;

  int? _offset;
  int? get offset => _offset;

  int _infoByte = 0;
  bool get isObsolete => _infoByte & 1 == 1;
  set isObsolete(bool b) => _infoByte = (_infoByte & 0xfe) | (b ? 1 : 0);

  @override
  MapEntry<TKey, TValue> decode(RandomAccessFile file) {
    _getOffsetAndSize(file);
    _infoByte = file.readByteSync();
    final key = keyField.decode(file);
    final value = valueField.decode(file);
    return MapEntry(key, value);
  }

  void _getOffsetAndSize(RandomAccessFile file) {
    _offset = file.positionSync();
    final b1 = file.readByteSync();
    if (b1 == -1) {
      throw const EOF();
    }
    final b2 = file.readByteSync();
    if (b2 == -2) {
      throw const EOF();
    }
    _size = uint16.decode([b1, b2]);
  }

  @override
  List<int> encode(MapEntry<TKey, TValue> data) {
    final key = keyField.encode(data.key);
    final value = valueField.encode(data.value);
    final size = 1 + key.length + value.length;
    _size = size;

    final list = [
      ...uint16.encode(size),
      _infoByte,
      ...key,
      ...value,
    ];

    return list;
  }

  List<int> emptyData() {
    final s = uint16.encode(_size!);
    return List.generate(3, (i) => i < 2 ? s[i] : _infoByte);
  }
}

class EOF implements Exception {
  const EOF();
}
