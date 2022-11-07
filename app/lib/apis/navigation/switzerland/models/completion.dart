// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/trias.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/widgets/sbb_icon.dart';

part 'completion.freezed.dart';
part 'completion.g.dart';

@freezed
class SbbCompletion with _$SbbCompletion implements NavigationCompletion {
  @JsonSerializable(includeIfNull: false)
  factory SbbCompletion({
    required String label,
    double? dist,
    @JsonKey(name: 'iconclass') String? iconClass,
    String? html,
    String? id,
    String? favoriteName,
    @Default(DataOrigin.data) DataOrigin origin,
  }) = _SbbCompletion;
  SbbCompletion._();

  factory SbbCompletion.fromFavorite(FavoriteStop stop) => _SbbCompletion(
        label: stop.stop,
        favoriteName: stop.name,
        origin: DataOrigin.favorites,
      );

  factory SbbCompletion.fromJson(Map<String, dynamic> json) =>
      _$SbbCompletionFromJson(json);

  @override
  late final PlaceType? type = SbbIcon.getVehicle(iconClass);

  @override
  Widget get icon => SbbIcon(type);

  // blah blah blah @ 46.8537495783, 7.65740776062

  final regex = RegExp(r'@ (\d+\.\d+), (\d+\.\d+)');
  @override
  GeoCoordinates? get coordinates {
    final match = regex.firstMatch(html ?? '');
    if (match == null) {
      return null;
    }
    return TriasGeoPosition(
      latitude: double.parse(match.group(1)!),
      longitude: double.parse(match.group(2)!),
    );
  }
}
