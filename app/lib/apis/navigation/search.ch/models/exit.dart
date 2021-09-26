import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

import 'base.dart';
import 'stop.dart';

part 'exit.freezed.dart';
part 'exit.g.dart';

class DelayConverter extends JsonConverter<int?, String?> {
  const DelayConverter();

  @override
  int? fromJson(String? json) {
    if (json == null) {
      return null;
    } else if (json is String && json != 'X') {
      final tryParse = int.tryParse(json);
      return tryParse == 0 ? null : tryParse;
    } else {
      return null;
    }
  }

  @override
  String toJson(int? object) => object == null
      ? "X"
      : object >= 0
          ? '+$object'
          : object.toString();
}

@freezed
class SbbExit with _$SbbExit, BaseStop, SbbDisplayNameMixin implements Exit {
  @JsonSerializable(includeIfNull: false, checked: true)
  factory SbbExit({
    required String name,
    @DelayConverter() @JsonKey(name: 'arr_delay') int? arrDelay,
    DateTime? arrival,
    double? lat,
    double? lon,
    String? sbbName,
    String? stopid,
    String? track,
    @Default(0) int waittime,
    @Default(false) bool isaddress,
    @IntConverter() int? x,
    @IntConverter() int? y,
  }) = _Exit;
  SbbExit._();

  factory SbbExit.fromJson(Map<String, dynamic> json) => _$SbbExitFromJson(json);

  @override
  late final LatLon? position = LatLon.computeFrom(lat: lat, lon: lon, x: x, y: y, name: name);

  @override
  int get depDelay => 0;

  @override
  DateTime? get departure => null;

  @override
  String? get id => stopid;

  @override
  String? get officialName => sbbName;

  @override
  bool get isAddress => isaddress;

  @override
  int get waitTime => waittime;
}
