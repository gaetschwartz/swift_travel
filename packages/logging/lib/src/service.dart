import 'package:gaets_logging/src/consumer.dart';
import 'package:gaets_logging/src/printer.dart';

import 'filter.dart';
import 'models.dart';

class LoggingService {
  const LoggingService(
    this._consumers, {
    this.filter = const AlwaysAllowFilter(),
    this.printer = const SimplePrinter(),
  });

  static LoggingService instance = const LoggingService({ConsoleLogger()});
  final Set<LogConsumer> _consumers;
  final LogFilter filter;
  final MessagePrinter printer;

  /// Register multiple consumers
  void registerAll(Iterable<LogConsumer> e) => _consumers.addAll(e);

  /// Register a consumer
  void register(LogConsumer l) => _consumers.add(l);

  /// Log a message
  void custom(
    String message, {
    LogLevel level = LogLevel.info,
    String? channel,
  }) {
    final msg = LogMessage(
      channel: channel ?? 'Main',
      message: message,
      createdAt: DateTime.now(),
      level: level,
    );

    if (filter(msg)) {
      for (final l in _consumers) {
        l.log(printer(msg));
      }
    }
  }

  Future<T> customTimed<T extends Object?>(Future<T> future, {String? channel}) async {
    final s = Stopwatch()..start();
    final res = await future;
    s.stop();
    custom('(${s.elapsedMilliseconds} ms): $res', channel: channel);
    return res;
  }

  /// Log a serious crash, if possible
  void crash(String e) => custom(e, level: LogLevel.crash);

  /// Log an error, like if something is thrown
  void error(String e) => custom(e, level: LogLevel.error);

  /// Log a timed network operation
  Future<T> network<T extends Object?>(Future<T> Function() f) =>
      customTimed(f(), channel: 'network');

  /// Log a ui event, like tapping a button
  void ui(String e) => custom(e, channel: 'ui');
}

/// The singleton logger instance, extend this with your own channels
LoggingService get log => LoggingService.instance;
