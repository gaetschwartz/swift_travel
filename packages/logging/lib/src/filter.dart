import 'models.dart';

abstract class LogFilter {
  const LogFilter();
  bool call(LogMessage m);
}

class LevelFilter extends LogFilter {
  const LevelFilter(this.level);

  final LogLevel level;

  @override
  bool call(LogMessage m) => m.level.level >= level.level;
}

class AlwaysAllowFilter extends LogFilter {
  const AlwaysAllowFilter();

  @override
  bool call(LogMessage m) => true;
}

class NegativeSentimentFilter extends LogFilter {
  @override
  bool call(LogMessage m) => m.level.sentiment == Sentiment.negative;
}
