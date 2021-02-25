import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stationboard_connection.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';

part 'stationboard.freezed.dart';
part 'stationboard.g.dart';

@freezed
class SbbStationboard with _$SbbStationboard, StationBoard {
  const factory SbbStationboard({
    @Default(SbbStop('')) @JsonKey(name: 'stop') SbbStop sbbStop,
    @JsonKey(name: 'connections')
    @Default(<SbbStationboardConnection>[])
        List<SbbStationboardConnection> sbbConnections,
    @Default(<Object>[]) List<Object> messages,
  }) = _SbbStationboard;
  const SbbStationboard._();

  factory SbbStationboard.fromJson(Map<String, dynamic> json) => _$SbbStationboardFromJson(json);

  @override
  List<StationboardConnection> get connections => sbbConnections;

  @override
  Stop get stop => sbbStop;

  @override
  String get stopName => sbbStop.name;

  @override
  bool get hasError => messages.isNotEmpty;
}
