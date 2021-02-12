// ignore_for_file: unused_element
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/search.ch/models/completion.dart';

part 'favorite_stop.freezed.dart';
part 'favorite_stop.g.dart';

@freezed
abstract class FavoriteStop with _$FavoriteStop {
  const factory FavoriteStop({
    required String stop,
    String? name,
  }) = _FavoriteStop;
  factory FavoriteStop.fromStop(String stop) => _FavoriteStop(stop: stop, name: stop);

  factory FavoriteStop.fromCompletion(NavCompletion completion, {String? name}) =>
      _FavoriteStop(stop: completion.label, name: name ?? completion.label);

  factory FavoriteStop.fromJson(Map<String, dynamic> json) => _$FavoriteStopFromJson(json);
}
