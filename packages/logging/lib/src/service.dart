import 'package:gaets_logging/logging.dart';
import 'package:gaets_logging/src/consumer.dart';

import 'filter.dart';
import 'models.dart';

class LoggingService {
  const LoggingService(
    Set<LogConsumer> consumers, {
    this.filter = const AlwaysAllowFilter(),
  }) : _consumers = consumers;

  static LoggingService instance = const LoggingService({ConsoleLogger()});
  final Set<LogConsumer> _consumers;
  final LogFilter filter;

  /// Register multiple consumers
  void registerAll(Iterable<LogConsumer> e) => _consumers.addAll(e);

  /// Register a consumer
  void register(LogConsumer l) => _consumers.add(l);

  /// Log a message
  void log(
    String message, {
    LogLevel level = LogLevel.info,
    String? channel,
  }) {
    final msg = LogMessage(
      channel: channel,
      message: message,
      createdAt: DateTime.now(),
      level: level,
    );

    if (filter(msg)) {
      for (final l in _consumers) {
        l.consume(msg);
      }
    }
  }

  Future<T> future<T extends Object?>(Future<T> future, {String? channel}) async {
    final s = Stopwatch()..start();
    final res = await future;
    s.stop();
    log('(${s.elapsedMilliseconds} ms): $res', channel: channel);
    return res;
  }

  /// Log a serious crash, if possible
  void crash(String e) => log(e, level: LogLevel.crash);

  /// Log an error, like if something is thrown
  void e(String e, {String? channel}) => log(e, level: LogLevel.error, channel: channel);

  /// Log a timed network operation
  Future<T> network<T extends Object?>(Future<T> Function() f, {String channel = 'network'}) =>
      future(f(), channel: channel);

  /// Log a ui event, like tapping a button
  void ui(String e) => log(e, channel: 'ui');

  // Log an info
  void i(String e, {String? channel}) => log(e, channel: channel);
}

/// The singleton logger instance.
LoggingService get log => LoggingService.instance;
