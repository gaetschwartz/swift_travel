import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:cask/src/typed_data.dart';

abstract class CaskField<T> {
  const CaskField();

  List<int> encode(T data);
  T decode(RandomAccessFile file);
}

mixin _WithLengthMixin {
  List<int> withLengthHeader(List<int> data) => [...Uint16(data.length).toList(), ...data];
}

abstract class CaskFieldWithSizeHeader<T> with _WithLengthMixin implements CaskField<T> {
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
  const ValueField({this.encoding = utf8});

  final Encoding encoding;

  @override
  T decodeData(List<int> buffer) {
    final text = encoding.decode(buffer);
    final data = json.decode(text) as T;
    return data;
  }

  @override
  List<int> encodeData(T data) {
    final encoded = json.encode(data);
    final bytes = encoding.encode(encoded);
    return bytes;
  }
}

class Keyfield<T> extends CaskFieldWithSizeHeader<T> {
  const Keyfield({this.encoding = utf8});

  final Encoding encoding;

  @override
  T decodeData(List<int> buffer) => decodeKey(buffer);

  T decodeKey(List<int> bytes) {
    if (T == String) {
      return encoding.decode(bytes) as T;
    } else if (T == int) {
      return UnsignedInt.fromList(bytes).value as T;
    } else {
      throw UnsupportedError('Unsupported type `$T`');
    }
  }

  @override
  List<int> encodeData(T data) => encodeKey(data);

  List<int> encodeKey(T key) {
    if (key is int) {
      return UnsignedInt(key).toList();
    } else if (key is String) {
      return encoding.encode(key);
    } else {
      throw UnsupportedError('Unsupported type `${key.runtimeType}`');
    }
  }
}

class EntryField<TKey, TValue> extends CaskField<MapEntry<TKey, TValue>> with _WithLengthMixin {
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
    final encodeData = _encodeData(data);
    _size = Uint16(encodeData.length);
    return withLengthHeader(encodeData);
  }

  List<int> _encodeData(MapEntry<TKey, TValue> data) => [
        _infoByte,
        ...keyField.encode(data.key),
        ...valueField.encode(data.value),
      ];

  List<int> emptyData() => [
        ..._size!.toList(),
        _infoByte,
      ];
}

class EOF implements Exception {
  const EOF();
}
