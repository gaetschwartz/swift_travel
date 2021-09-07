import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

/// A message to dispatch
///
/// Adapted from https://gist.github.com/lukepighetti/5283229a351ab394376e84cff8277bdb
@freezed
class LogMessage with _$LogMessage {
  const factory LogMessage({
    required String message,
    @Default(LogLevel.info) LogLevel level,
    required DateTime timestamp,
    String? channel,
  }) = _LogMessage;
}

@freezed
class LogLevel with _$LogLevel {
  const factory LogLevel._(
    int level,
    Sentiment sentiment,
    String name,
  ) = _LogLevel;

  static const crash = LogLevel._(4, Sentiment.negative, 'crash');
  static const error = LogLevel._(3, Sentiment.negative, 'error');
  static const warning = LogLevel._(1, Sentiment.negative, 'warning');

  static const ok = LogLevel._(1, Sentiment.neutral, 'ok');
  static const info = LogLevel._(2, Sentiment.neutral, 'info');

  static const fine = LogLevel._(2, Sentiment.positive, 'fine');
  static const great = LogLevel._(3, Sentiment.positive, 'great');
}

enum Sentiment {
  positive,
  neutral,
  negative,
}
