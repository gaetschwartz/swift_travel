import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

/// Mock Stop class. Only used as a placeholder.
class MockStop with BaseStop implements Stop {
  const MockStop();

  @override
  DateTime? get arrival => assertedReturn(null);
  @override
  DateTime? get departure => assertedReturn(null);
  @override
  String? get id => assertedReturn(null);
  @override
  double? get lat => assertedReturn(null);
  @override
  double? get lon => assertedReturn(null);
  @override
  String get name => assertedReturn('');
  @override
  LatLon? get position => assertedReturn(null);

  T assertedReturn<T>(T val) {
    assert(
      false,
      "This class's fields are not meant to be accessed,"
      ' it is only used as a placeholder',
    );
    return val;
  }

  @override
  String get displayName => assertedReturn('');
}
