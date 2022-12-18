import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

import 'base.dart';

part 'stop.freezed.dart';
part 'stop.g.dart';

DateTime? _fromJson(String? s) => s == null ? null : DateTime.parse(s);
String? _toJson(DateTime? d) => d?.toIso8601String();

class IntConverter implements JsonConverter<int?, Object?> {
  const IntConverter();

  @override
  Object? toJson(int? json) => json;

  @override
  int? fromJson(Object? object) {
    if (object == null) {
      return null;
    }
    if (object is int) {
      return object;
    }
    if (object is num) {
      return object.toInt();
    }
    if (object is String) {
      try {
        return int.parse(object);
      } on FormatException catch (e, s) {
        reportDartError(e, s);
        return null;
      }
    }
    throw UnsupportedError(
      '$runtimeType only supports ints, Strings and nums as an input, not ${object.runtimeType}',
    );
  }
}

@freezed
class SbbStop with _$SbbStop, BaseStop, SbbDisplayNameMixin implements Stop {
  @JsonSerializable(includeIfNull: false, checked: true, explicitToJson: true)
  const factory SbbStop({
    @JsonKey(name: 'name') required String? sbbName,
    String? id,
    @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? departure,
    @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? arrival,
    double? lat,
    double? lon,
    @IntConverter() int? x,
    @IntConverter() int? y,
  }) = _SbbStop;
  const SbbStop._();

  factory SbbStop.fromJson(Map<String, dynamic> json) =>
      _$SbbStopFromJson(json);

  factory SbbStop.fromStop(Stop stop) {
    final position = stop.position;

    return SbbStop(
      sbbName: stop.name,
      id: stop.id,
      departure: stop.departure,
      arrival: stop.arrival,
      lat: position?.lat,
      lon: position?.lon,
    );
  }

  @override
  LatLon? get position =>
      LatLon.computeFrom(lat: lat, lon: lon, x: x, y: y, name: name);

  @override
  String get name => sbbName ?? id ?? '';
}
