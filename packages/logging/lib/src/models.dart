import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

/// A message to dispatch
///
/// Adapted from https://gist.github.com/lukepighetti/5283229a351ab394376e84cff8277bdb
@freezed
class LogMessage with _$LogMessage {
  const factory LogMessage({
    required String message,
    @Default(LogLevel.info) LogLevel level,
    required DateTime timestamp,
    @Default(Scope.empty) Scope scope,
    String? error,
    @StackTraceJsonConverter() StackTrace? stackTrace,
  }) = _LogMessage;

  factory LogMessage.fromJson(Map<String, dynamic> json) =>
      _$LogMessageFromJson(json);
}

@freezed
class LogLevel with _$LogLevel {
  const factory LogLevel._(
    int level,
    Sentiment sentiment,
    String name,
  ) = _LogLevel;

  factory LogLevel.fromJson(Map<String, dynamic> json) =>
      _$LogLevelFromJson(json);

  static const crash = LogLevel._(4, Sentiment.negative, 'crash');
  static const error = LogLevel._(3, Sentiment.negative, 'error');
  static const warning = LogLevel._(1, Sentiment.negative, 'warning');

  static const debug = LogLevel._(0, Sentiment.neutral, 'debug');
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

class StackTraceJsonConverter implements JsonConverter<StackTrace?, String?> {
  const StackTraceJsonConverter();

  @override
  StackTrace? fromJson(String? json) {
    if (json == null) return null;
    return StackTrace.fromString(json);
  }

  @override
  String? toJson(StackTrace? object) {
    if (object == null) return null;
    return object.toString();
  }
}

@freezed
class Scope with _$Scope {
  const factory Scope(List<String> value) = _Scope;

  const Scope._();

  Scope operator /(String value) => Scope([...this.value, value]);

  Scope get parent => Scope(value.sublist(0, value.length - 1));

  String join([String separator = ' ']) => value.join(separator);

  static const empty = Scope([]);

  factory Scope.fromJson(Map<String, dynamic> json) => _$ScopeFromJson(json);
}
