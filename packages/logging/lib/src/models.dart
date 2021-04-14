import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

/// A message to dispatch
@freezed
class LogMessage with _$LogMessage {
  const factory LogMessage({
    required DateTime createdAt,
    required String message,
    required String channel,
    @Default(LogLevel.info) LogLevel level,
  }) = _LogMessage;
}

@freezed
class LogLevel with _$LogLevel {
  const factory LogLevel._(
    int level,
    Sentiment sentiment,
  ) = _LogLevel;

  static const crash = LogLevel._(4, Sentiment.negative);
  static const error = LogLevel._(3, Sentiment.negative);
  static const warning = LogLevel._(1, Sentiment.negative);

  static const ok = LogLevel._(1, Sentiment.neutral);
  static const info = LogLevel._(2, Sentiment.neutral);

  static const fine = LogLevel._(2, Sentiment.positive);
  static const great = LogLevel._(3, Sentiment.positive);
}

enum Sentiment {
  positive,
  negative,
  neutral,
}
