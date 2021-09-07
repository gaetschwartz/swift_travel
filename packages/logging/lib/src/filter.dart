import 'models.dart';

abstract class LogFilter {
  const LogFilter();
  bool call(LogMessage msg);
}

class LevelFilter extends LogFilter {
  const LevelFilter(this.level);

  final LogLevel level;

  @override
  bool call(LogMessage msg) => msg.level.level >= level.level;
}

class AlwaysAllowFilter extends LogFilter {
  const AlwaysAllowFilter();

  @override
  bool call(LogMessage msg) => true;
}

class SentimentFilter extends LogFilter {
  const SentimentFilter(this.sentiment);

  final Sentiment sentiment;

  @override
  bool call(LogMessage msg) => msg.level.sentiment == sentiment;
}

typedef FilterPredicate = bool Function(LogMessage msg);

class PredicateFilter extends LogFilter {
  const PredicateFilter(this.predicate);

  final FilterPredicate predicate;

  @override
  bool call(LogMessage msg) => predicate(msg);
}
