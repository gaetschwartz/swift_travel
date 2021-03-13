import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/models/favorites.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class RoutePrediction with _$RoutePrediction {
  @JsonSerializable(explicitToJson: true)
  const factory RoutePrediction(
    @LocalRouteConverter() LocalRoute? prediction,
    double confidence,
    PredictionArguments arguments,
  ) = _RoutePrediction;

  factory RoutePrediction.fromJson(Map<String, dynamic> json) => _$RoutePredictionFromJson(json);
}

@freezed
class FullArguments with _$FullArguments {
  @JsonSerializable(explicitToJson: true)
  const factory FullArguments(
    List<LocalRoute> routes,
    PredictionArguments arguments,
  ) = _FullArguments;

  factory FullArguments.fromJson(Map<String, dynamic> json) => _$FullArgumentsFromJson(json);
}

@freezed
class PredictionArguments with _$PredictionArguments {
  @JsonSerializable(explicitToJson: true)
  const factory PredictionArguments(DateTime dateTime) = DateTimeArgument;
  @JsonSerializable(explicitToJson: true)
  const factory PredictionArguments.source(DateTime dateTime, String source) = SourceDateArguments;

  factory PredictionArguments.from(DateTime dateTime, [String? source]) {
    if (source != null) {
      return PredictionArguments.source(dateTime, source);
    } else {
      return PredictionArguments(dateTime);
    }
  }

  factory PredictionArguments.fromJson(Map<String, dynamic> json) =>
      _$PredictionArgumentsFromJson(json);
}
