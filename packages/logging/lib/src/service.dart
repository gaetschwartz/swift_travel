import 'consumer.dart';
import 'models.dart';

class LoggingService {
  LoggingService(List<LogConsumer> consumers) : _consumers = consumers;

  static late final LoggingService instance = LoggingService([const PrintLogger()]);

  List<LogConsumer> _consumers;

  /// Register multiple consumers
  void registerAll(Iterable<LogConsumer> e) => _consumers.addAll(e);

  /// Register a consumer
  void register(LogConsumer l) => _consumers.add(l);

  void setConsumers(List<LogConsumer> list) => _consumers = list;

  /// Log a message
  void log(
    String message, {
    LogLevel level = LogLevel.info,
    String? channel,
  }) {
    final msg = LogMessage(
      message: message,
      channel: channel,
      timestamp: DateTime.now(),
      level: level,
    );

    for (final c in _consumers) {
      c.consume(msg);
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
  void crash(String e, {String? channel}) => log(e, level: LogLevel.crash, channel: channel);

  /// Log an error, like if something is thrown
  void e(String e, {String? channel}) => log(e, level: LogLevel.error, channel: channel);

  /// Log a timed network operation
  Future<T> network<T extends Object?>(Future<T> Function() f, {String channel = 'network'}) =>
      future(f(), channel: channel);

  /// Log a ui event, like tapping a button
  void ui(String msg) => log(msg, channel: 'ui');

  // Log an info
  void i(String msg, {String? channel}) => log(msg, channel: channel, level: LogLevel.info);
}

/// The singleton logger instance.
LoggingService get log => LoggingService.instance;
