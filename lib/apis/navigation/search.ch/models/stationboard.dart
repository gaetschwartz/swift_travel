import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stationboard_connection.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';

part 'stationboard.freezed.dart';
part 'stationboard.g.dart';

class MySbbStationboardConverter implements JsonConverter<SbbStationboard, Map<String, dynamic>> {
  const MySbbStationboardConverter();

  @override
  SbbStationboard fromJson(Map<String, dynamic> json) {
    if (json['runtimeType'] != null) {
      // ignore: deprecated_member_use_from_same_package
      return SbbStationboard.fromJson(json);
    }

    if (json.containsKey('messages')) {
      return SbbStationboardError.fromJson(json);
    } else {
      return SbbStationboardData.fromJson(json);
    }
  }

  @override
  Map<String, dynamic> toJson(SbbStationboard data) => data.toJson();
}

const _converter = MySbbStationboardConverter();

@freezed
class SbbStationboard with _$SbbStationboard, StationBoard {
  @With(_StationboardDataMixin)
  @With(StationboardData)
  const factory SbbStationboard({
    @JsonKey(name: 'stop') required SbbStop sbbStop,
    @JsonKey(name: 'connections')
    @Default(<SbbStationboardConnection>[])
        List<SbbStationboardConnection> sbbConnections,
    @Default(<String>[]) List<String> messages,
  }) = SbbStationboardData;
  const SbbStationboard._();

  @With(StationboardError)
  const factory SbbStationboard.error(List<String> messages) = SbbStationboardError;

  @Deprecated('Use SbbStationboard.parse')
  factory SbbStationboard.fromJson(Map<String, dynamic> json) => _$SbbStationboardFromJson(json);
  factory SbbStationboard.parse(Map<String, dynamic> json) => _converter.fromJson(json);

  @override
  TResult mapBoard<TResult extends Object?>(TResult Function(SbbStationboardData board) onData,
          {required TResult Function(SbbStationboardError e) onError}) =>
      map<TResult>(onData, error: onError);
}

mixin _StationboardDataMixin {
  SbbStop get sbbStop;
  List<SbbStationboardConnection> get sbbConnections;

  Stop get stop => sbbStop;
  List<StationboardConnection> get connections => sbbConnections;
  String get stopName => sbbStop.name;
}
