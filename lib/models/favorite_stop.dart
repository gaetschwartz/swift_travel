// ignore_for_file: unused_element
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/search.ch/models/cff_completion.dart';

part 'favorite_stop.freezed.dart';
part 'favorite_stop.g.dart';

@freezed
abstract class FavoriteStop with _$FavoriteStop {
  const factory FavoriteStop(String stop, {String name}) = _FavoriteStop;
  factory FavoriteStop.fromStop(String stop) => _FavoriteStop(stop, name: stop);

  factory FavoriteStop.fromCompletion(CffCompletion completion, {String name}) =>
      _FavoriteStop(completion.label, name: name ?? completion.label);

  factory FavoriteStop.fromJson(Map<String, dynamic> json) => _$FavoriteStopFromJson(json);
}
