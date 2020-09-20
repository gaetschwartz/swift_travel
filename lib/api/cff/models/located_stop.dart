import 'package:freezed_annotation/freezed_annotation.dart';

part 'located_stop.freezed.dart';
part 'located_stop.g.dart';

@freezed
abstract class LocatedStop with _$LocatedStop {
  factory LocatedStop(
    String id,
    String name,
    String x,
    String y,
  ) = _LocatedStop;

  factory LocatedStop.fromJson(Map<String, dynamic> json) => _$LocatedStopFromJson(json);
}
