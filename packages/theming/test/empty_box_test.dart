import 'package:flutter_test/flutter_test.dart';
import 'package:theming/src/empty_box.dart';

void main() {
  test('local box', () async {
    final box = LocalBox<String>();
    expect(box.isEmpty, true);
    await box.put('key', 'value');
    expect(box.isEmpty, false);
    expect(box.length, 1);
    expect(box.get('key'), 'value');
    expect(box.get('key', defaultValue: 'default'), 'value');
    expect(box.get('key2', defaultValue: 'default'), 'default');
    expect(box.get('key2'), null);
    expect(box.getAt(0), 'value');
    expect(box.getAt(1), null);
    expect(box.keyAt(0), 'key');
    expect(box.keyAt(1), null);
    expect(box.keys, ['key']);
    expect(box.values, ['value']);
    expect(box.containsKey('key'), true);
    expect(box.containsKey('key2'), false);
  });

  test('empty box', () async {
    final box = EmptyBox<String>();
    expect(box.isEmpty, true);
    await box.put('key', 'value');
    expect(box.isEmpty, true);
    expect(box.length, 0);
    expect(box.get('key'), null);
    expect(box.get('key', defaultValue: 'default'), 'default');
    expect(box.get('key2', defaultValue: 'default'), 'default');
    expect(box.get('key2'), null);
    expect(box.getAt(0), null);
    expect(box.getAt(1), null);
    expect(box.keyAt(0), null);
    expect(box.keyAt(1), null);
    expect(box.keys, <dynamic>[]);
    expect(box.values, <dynamic>[]);
    expect(box.containsKey('key'), false);
    expect(box.containsKey('key2'), false);
  });
}
