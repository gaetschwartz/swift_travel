import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/utils/arithmetic.dart';
import 'package:swift_travel/utils/predict/predict.dart';

part 'stop.freezed.dart';
part 'stop.g.dart';

DateTime? _fromJson(String? s) => s == null ? null : DateTime.parse(s);
String? _toJson(DateTime? d) => d?.toIso8601String();

@freezed
class SbbStop with _$SbbStop, Stop {
  @JsonSerializable(includeIfNull: false)
  const factory SbbStop(
    String name, {
    String? id,
    String? stopid,
    @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? departure,
    double? lat,
    double? lon,
    int? x,
    int? y,
  }) = _SbbStop;
  const SbbStop._();

  factory SbbStop.fromFavoriteStop(FavoriteStop fav) => SbbStop(fav.name, id: fav.id);
  factory SbbStop.fromJson(Map<String, dynamic> json) => _$SbbStopFromJson(json);

  @override
  SbbStop get withPosition {
    if (lat == null && lon == null && x != null && y != null) {
      final o = LV03ToWGS84Converter().convert(Pair(x!, y!));
      return copyWith(lat: o.first, lon: o.second);
    }
    return this;
  }
}
