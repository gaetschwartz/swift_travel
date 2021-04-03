import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:cask/src/typed_data.dart';

import 'convert/json_to_bytes.dart';

abstract class CaskField<T> {
  const CaskField();

  List<int> encode(T data);
  T decode(RandomAccessFile file);
}

mixin _WithLengthMixin {
  List<int> withLengthHeader(List<int> data) =>
      [...Uint16(data.length).toList(), ...data];
}

abstract class CaskFieldWithSizeHeader<T>
    with _WithLengthMixin
    implements CaskField<T> {
  const CaskFieldWithSizeHeader();
  @override
  List<int> encode(T data) => withLengthHeader(encodeData(data));

  @override
  T decode(RandomAccessFile file) {
    final sizeList = file.readSync(2);
    final size = Uint16.fromList(sizeList);
    //if (kDebugMode) print('Field is of length $size');
    final data = file.readSync(size.value);
    //if (kDebugMode) print('Decoding $data');
    final decoded = decodeData(data);
    //if (kDebugMode) print('Decoded to $decoded');
    return decoded;
  }

  List<int> encodeData(T data);
  T decodeData(List<int> buffer);
}

class ValueField<T> extends CaskFieldWithSizeHeader<T> {
  const ValueField();

  @override
  T decodeData(List<int> buffer) => jsonToBytes.decode(buffer) as T;

  @override
  List<int> encodeData(T data) => jsonToBytes.encode(data);
}

class Keyfield<T> extends CaskFieldWithSizeHeader<T> {
  const Keyfield();

  @override
  T decodeData(List<int> buffer) {
    if (T == String) {
      return utf8.decode(buffer) as T;
    } else if (T == int) {
      return UnsignedInt.fromList(buffer).value as T;
    } else {
      throw UnsupportedError('Unsupported type `$T`');
    }
  }

  @override
  List<int> encodeData(T data) {
    if (data is int) {
      return UnsignedInt(data).toList();
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

  Uint16? _size;
  Uint16? get size => _size;

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
    _size = Uint16.fromList([b1, b2]);
  }

  @override
  List<int> encode(MapEntry<TKey, TValue> data) {
    final key = keyField.encode(data.key);
    final value = valueField.encode(data.value);
    final size = Uint16(1 + key.length + value.length);
    _size = size;
    final list = [
      ...size.toList(),
      _infoByte,
      ...key,
      ...value,
    ];
    return list;
  }

  List<int> emptyData() => [
        ..._size!.toList(),
        _infoByte,
      ];
}

class EOF implements Exception {
  const EOF();
}
