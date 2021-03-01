import 'package:flutter_test/flutter_test.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/attribute.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stationboard.dart';
import 'package:swift_travel/mocking/mocking.dart';

void main() {
  test('test parsing SbbStationBoard', () {
    expect(() => SbbStationboard.fromJson(mockStationboard!), returnsNormally);
    expect(() => CffRoute.fromJson(mockRoute!), returnsNormally);
  });

  test('attributes codes are consistent', () {
    for (final e in Attribute.attributes.entries) {
      expect(e.key, e.value.code);
    }
  });
}
