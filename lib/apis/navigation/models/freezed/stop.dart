import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

class CustomStop with BaseStop implements Stop {
  const CustomStop();

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
    assert(false,
        "This class's fields are not meant to be accessed, it is only used as a placeholder");
    return val;
  }
}
