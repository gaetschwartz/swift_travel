import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cask/cask.dart';
import 'package:cask/src/fields.dart';
import 'package:cask/src/io.dart';
import 'package:cask/src/testing/fake_io.dart';
import 'package:cask/src/typed_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;

void main() {
  final r = Random(12345678);

  group('cask', () {
    late CaskImpl<String, int> cask;
    setUpAll(() async {
      Storage.init(path.join("test", "temp", 'cask_tests', 'casks'));
    });

    setUp(() async {
      cask = CaskImpl<String, int>('my_cask');
    });

    tearDown(() async {
      await cask.close();
      cask.manager.file.deleteSync();
    });

    test('reads and writes correctly', () async {
      await cask.open();
      await cask.put('age', 20);
      await cask.put('length', 10);

      await cask.close();
      await cask.open();

      expect(cask.get('age'), 20);
      expect(cask.get('length'), 10);
    });

    test('clears correctly', () async {
      await cask.open();
      await cask.put('age', 20);
      await cask.put('length', 10);

      await cask.clear();

      await cask.close();
      await cask.open();

      expect(cask.get('age'), null);
      expect(cask.get('length'), null);
    });

    test('updates correctly', () async {
      await cask.open();
      await cask.put('age', 20);
      await cask.put('age', 21);

      await cask.close();
      await cask.open();

      expect(cask.get('age'), 21);
    });
  });

  group('Keyfield', () {
    test('<int> works', () {
      const keyField = Keyfield<int>();

      for (var i = 0; i < 1000; i++) {
        final n = r.nextInt(1 << 32);

        final list = uint32.encode(n);

        final uint8list = Uint8List.fromList([list.length, 0, ...list]);
        expect(keyField.decode(MockRandomAccessFile(uint8list)), n);
        expect(keyField.encode(n), uint8list);
      }
    });

    test('<String> works', () {
      const keyField = Keyfield<String>();

      for (var i = 0; i < 1000; i++) {
        final length = r.nextInt(0xff);
        final data = List.generate(length, (_) => r.nextInt(128));
        final s = utf8.decode(data, allowMalformed: true);

        final uint8list =
            Uint8List.fromList([...uint16.encode(length), ...data]);

        expect(keyField.decode(MockRandomAccessFile(uint8list)), s);
        expect(keyField.encode(s), uint8list);
      }
    });
  });

  group('ValueField', () {
    test('<Object?> works', () {
      const valueField = ValueField<Object?>();

      String randomString() {
        final length = r.nextInt(0xff);
        final data = List.generate(length, (_) => r.nextInt(64) + 64);
        final s = utf8.decode(data);
        return s;
      }

      final opts = <Object? Function()>[
        randomString,
        () => r.nextInt(1 << 32),
        r.nextDouble,
        () => null,
        r.nextBool,
        () => List.generate(r.nextInt(0xff), (_) => r.nextInt(1 << 32)),
        () => {
              randomString(): randomString(),
              randomString(): r.nextInt(1 << 32)
            },
      ];

      for (final optFn in opts) {
        final opt = optFn();
        final data = utf8.encode(json.encode(opt));
        final length = data.length;

        final uint8list =
            Uint8List.fromList([...uint16.encode(length), ...data]);

        expect(valueField.decode(MockRandomAccessFile(uint8list)), opt);
        expect(valueField.encode(opt), uint8list);
      }
    });
  });

  group('EntryField', () {
    test('works', () {
      final entryField = EntryField<String, int>();

      const entry = MapEntry('age', 20);
      final key = <int>[3, 0, ...utf8.encode('age')];
      final value = <int>[2, 0, ...utf8.encode('20')];
      final uint8list = Uint8List.fromList([
        ...uint16.encode(key.length + value.length + 1),
        0,
        ...key,
        ...value,
      ]);
      expect(entryField.encode(entry), uint8list);
      final decoded = entryField.decode(MockRandomAccessFile(uint8list));
      expect(decoded.key, entry.key);
      expect(decoded.value, entry.value);
    });
  });

  group('uint16', () {
    test('works w/ specific numbers', () {
      const n256 = [0, 1];
      expect(uint16.decode(n256), 256);

      const n0 = [0, 0];
      expect(uint16.decode(n0), 0);
    });

    test('works w/ 1 element', () {
      const n255 = [0xff];
      expect(uint16.decode(n255), 255);
    });

    test('works w/ >= 3 element', () {
      const n0 = [0, 0, 1];
      expect(uint16.decode(n0), 0);

      const n0_2 = [1, 0, 0, 1];
      expect(uint16.decode(n0_2), 1);
    });
    test('works w/ random numbers', () {
      for (var i = 0; i < 10000; i++) {
        final n = r.nextInt(0xffff);
        final list = uint16.encode(n);

        expect(list, hasLength(2));
        expect(n, uint16.decode(list));
      }
    });
  });
}
