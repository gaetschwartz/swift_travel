import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;

import 'cask.dart';
import 'fields.dart';

class CaskImpl<TKey extends Object, TValue extends Object> implements Cask<TKey, TValue> {
  CaskImpl(this.caskKey);

  late final CaskFileManager<TKey, TValue> manager = CaskFileManager(_file);
  late final File _file = File('${p.join(Storage.storagePath, caskKey)}.cask');

  @override
  final String caskKey;

  @override
  Future<void> close() async {
    manager.close();
    if (kDebugMode) {
      print(_file.readAsBytesSync().map((e) => '0x${e.toRadixString(16)}'));
    }
  }

  @override
  TValue? get(TKey key) => manager.data[key];

  Map<TKey, TValue> get data => UnmodifiableMapView(manager.data);

  @override
  Future<void> open() async {
    await manager.read();
  }

  @override
  Future<void> put(TKey key, TValue value) async {
    await manager.put(key, value);
  }

  @override
  Future<void> clear() async {
    await manager.clear();
  }

  @override
  Future<void> delete(TKey key) async {
    await manager.delete(key);
  }

  @override
  String? get path => _file.path;
}

abstract class CaskFileManagerBase<TKey, TValue> {
  CaskFileManagerBase(this.file);
  final File file;

  Future<Map<TKey, TValue>> read();

  Future<void> put(TKey key, TValue value);

  Future<void> clear();

  void close();

  Future<void> delete(TKey key);
}

class CaskFileManager<TKey extends Object, TValue extends Object>
    extends CaskFileManagerBase<TKey, TValue> {
  CaskFileManager(
    File file, {
    this.encoding = utf8,
  }) : super(file);
  RandomAccessFile? writeFile;

  final fields = <TKey, EntryField<TKey, TValue>>{};
  final obsoleteFields = <EntryField<TKey, TValue>>[];
  final Encoding encoding;

  static const _headerString = 'caskfile';
  List<int> get header => ascii.encode(_headerString);

  var _map = <TKey, TValue>{};

  Map<TKey, TValue> get data => _map;

  @override
  Future<void> clear() async {
    _map = {};
    await file.writeAsBytes(header);
  }

  @override
  Future<void> put(TKey key, TValue value) async {
    _map[key] = value;

    final f = _getFile();
    final length = file.lengthSync();
    f.setPositionSync(length);
    final newField = EntryField<TKey, TValue>(offset: length);

    final data = newField.encode(MapEntry(key, value));
    if (kDebugMode) {
      print('Going to write ${data.map((e) => '0x${e.toRadixString(16)}')} @$length');
    }
    await f.writeFrom(data);

    if (fields.containsKey(key)) {
      if (kDebugMode) {
        print('deleting previous field');
      }
      final oldField = fields[key]!..isObsolete = true;
      obsoleteFields.add(oldField);
    }
    fields[key] = newField;
  }

  RandomAccessFile _getFile() {
    if (writeFile == null) {
      throw Exception('You need to open the cask first');
    }
    return writeFile!;
  }

  Future<void> _readAndSetFile() async {
    final data = await file.readAsBytes();
    writeFile = await file.open(mode: FileMode.write);
    await writeFile!.writeFrom(data);
    writeFile!.setPositionSync(0);
  }

  @override
  Future<Map<TKey, TValue>> read() async {
    _map = await _read();
    await _readAndSetFile();
    return _map;
  }

  Future<Map<TKey, TValue>> _read() async {
    final exists = file.existsSync();
    if (kDebugMode) {
      print('Reading ${file.path}: ');
      print(
        file.existsSync() ? file.readAsBytesSync().map((e) => '0x${e.toRadixString(16)}') : 'Empty',
      );
    }

    if (!exists || file.lengthSync() == 0) {
      if (kDebugMode) {
        print("File didn't exist or was empty, writing caskfile and returning");
      }
      if (!exists) {
        file.createSync(recursive: true);
      }
      await file.writeAsBytes(header);
      if (kDebugMode) {
        print(
          'Now it is: ${file.existsSync() ? file.readAsBytesSync().map((e) => '0x${e.toRadixString(16)}').toString() : 'Empty'}',
        );
      }
      return {};
    }
    final f = await file.open();

    final uint8list = await f.read(8);
    assert(ascii.decode(uint8list) == _headerString,
        'Header is `${ascii.decode(uint8list)}` ${uint8list.map((e) => '0x${e.toRadixString(16)}')} instead of `caskfile` ${header.map((e) => '0x${e.toRadixString(16)}')}!');

    if (kDebugMode) {
      print('${file.path} exists, reading it');
    }

    late final Map<TKey, TValue> map;
    try {
      map = await _readFile(f);
      f.closeSync();
      // ignore: avoid_catches_without_on_clauses
    } catch (e, s) {
      debugPrintStack(stackTrace: s, label: e.toString());
      map = {};
      f.closeSync();
    }
    return map;
  }

  Future<Map<TKey, TValue>> _readFile(RandomAccessFile file) async {
    final map = <TKey, TValue>{};

    final length = file.lengthSync();
    var p = 0;
    while ((p = file.positionSync()) < length - 1) {
      if (kDebugMode) {
        print('Reading new field at $p');
      }
      try {
        final field = EntryField<TKey, TValue>();
        if (kDebugMode) {
          print(field.offset);
        }
        final entry = field.decode(file);
        fields[entry.key] = field;

        if (field.isObsolete) {
          obsoleteFields.add(field);
        } else {
          map[entry.key] = entry.value;
        }
      } on EOF {
        break;
      }
    }
    return map;
  }

  @override
  void close() {
    writeFile?.flushSync();
    writeFile?.closeSync();
    writeFile = null;
  }

  @override
  Future<void> delete(TKey key) async {
    _map.remove(key);

    if (fields.containsKey(key)) {
      final f = _getFile();
      final oldField = fields[key]!..isObsolete = true;
      fields.remove(key);
      final o = oldField.offset;
      if (o == null) {
        throw Exception('Failed to get offset for field of `$key`');
      }
      f.setPositionSync(oldField.offset!);
      await f.writeFrom(oldField.emptyData());
      obsoleteFields.add(oldField);
    }
  }
}
