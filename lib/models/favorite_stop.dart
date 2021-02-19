// ignore_for_file: unused_element
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';

part 'favorite_stop.freezed.dart';
part 'favorite_stop.g.dart';

@freezed
abstract class FavoriteStop with _$FavoriteStop {
  const factory FavoriteStop({
    required String stop,
    required String name,
    required NavigationApi api,
  }) = _FavoriteStop;
  factory FavoriteStop.fromStop(String stop, {required NavigationApi api}) =>
      _FavoriteStop(stop: stop, name: stop, api: api);

  factory FavoriteStop.fromCompletion(Completion completion,
          {String? name, required NavigationApi api}) =>
      _FavoriteStop(stop: completion.label, name: name ?? completion.label, api: api);

  factory FavoriteStop.fromJson(Map<String, dynamic> json) => _$FavoriteStopFromJson(json);
}
