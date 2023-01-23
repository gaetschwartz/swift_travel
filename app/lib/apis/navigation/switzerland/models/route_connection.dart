import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';

import 'disruption.dart';
import 'exit.dart';
import 'leg.dart';

part 'route_connection.freezed.dart';
part 'route_connection.g.dart';

@freezed
class SchRouteConnection with _$SchRouteConnection, RouteConnection {
  @JsonSerializable(explicitToJson: true, includeIfNull: false, checked: true)
  const factory SchRouteConnection({
    required String from,
    required String to,
    @DelayConverter() @JsonKey(name: 'dep_delay') int? depDelay,
    DateTime? departure,
    DateTime? arrival,
    @JsonKey(name: 'duration') double? durationInSeconds,
    @JsonKey(name: 'legs') @Default(<SchLeg>[]) List<SchLeg> sbbLegs,
    @Default(<String, Disruption>{}) Map<String, Disruption> disruptions,
  }) = _SchRouteConnection;
  const SchRouteConnection._();

  factory SchRouteConnection.fromJson(Map<String, dynamic> json) =>
      _$SchRouteConnectionFromJson(json);

  @override
  List<Leg> get legs => sbbLegs;

  @override
  RouteConnection copyWithLegs(List<Leg> legs) {
    if (legs is! List<SchLeg>) {
      throw UnsupportedError('Legs are supposed to be of type `SchLegs`');
    }
    return copyWith(sbbLegs: legs);
  }

  @override
  Duration? get duration => durationInSeconds == null
      ? null
      : Duration(seconds: durationInSeconds!.toInt());
}
