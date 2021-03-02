import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

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
      return int.parse(object);
    }
    throw UnsupportedError(
        '$runtimeType only supports ints, Strings and nums as an input, not ${object.runtimeType}');
  }
}

@freezed
class SbbStop with _$SbbStop, Stop {
  @JsonSerializable(includeIfNull: false, checked: true, explicitToJson: true)
  const factory SbbStop(
    String name, {
    String? id,
    String? stopid,
    @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? departure,
    @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? arrival,
    double? lat,
    double? lon,
    @IntConverter() int? x,
    @IntConverter() int? y,
  }) = _SbbStop;
  const SbbStop._();

  factory SbbStop.fromFavoriteStop(FavoriteStop fav) => SbbStop(fav.name, id: fav.id);
  factory SbbStop.fromJson(Map<String, dynamic> json) => _$SbbStopFromJson(json);

  @override
  LatLon? get position => LatLon.computeFrom(lat: lat, lon: lon, x: x, y: y, name: name);
}
