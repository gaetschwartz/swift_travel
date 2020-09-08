import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop.freezed.dart';
part 'stop.g.dart';

DateTime _fromJson(String s) => s == null ? null : DateTime.parse(s);
String _toJson(DateTime d) => d.toIso8601String();

@freezed
abstract class Stop with _$Stop {
  factory Stop(String name,
      {String stopid, @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime departure}) = _Stop;

  factory Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);
}
