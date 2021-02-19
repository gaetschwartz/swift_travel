import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/disruption.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/exit.dart';

import 'leg.dart';

part 'route_connection.freezed.dart';
part 'route_connection.g.dart';

@freezed
class SbbRouteConnection with _$SbbRouteConnection, RouteConnection {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory SbbRouteConnection({
    required String from,
    required String to,
    DateTime? departure,
    DateTime? arrival,
    double? duration,
    @JsonKey(name: 'legs') @Default(<SbbLeg>[]) List<SbbLeg> sbbLegs,
    @Default(<String, Disruption>{}) Map<String, Disruption> disruptions,
    @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson) required int depDelay,
  }) = _SbbRouteConnection;
  const SbbRouteConnection._();

  factory SbbRouteConnection.fromJson(Map<String, dynamic> json) =>
      _$SbbRouteConnectionFromJson(json);

  @override
  List<Leg> get legs => sbbLegs;

  @override
  RouteConnection copyWithLegs(List<Leg> legs) {
    if (legs is! List<SbbLeg>) throw UnsupportedError('Legs are supposed to be of type `SbbLegs`');
    return copyWith(sbbLegs: legs);
  }
}
