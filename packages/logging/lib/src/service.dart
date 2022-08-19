import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'consumer.dart';
import 'models.dart';

class LoggingService {
  LoggingService(List<LogConsumer> consumers) : _consumers = consumers;

  static final LoggingService instance =
      LoggingService([const ConsoleLogger()]);

  List<LogConsumer> _consumers;

  /// Register multiple consumers
  void registerAll(Iterable<LogConsumer> e) => _consumers.addAll(e);

  /// Register a consumer
  void register(LogConsumer l) => _consumers.add(l);

  void setConsumers(List<LogConsumer> list) => _consumers = list;

  List<LogConsumer> get consumers => UnmodifiableListView(_consumers);

  /// Log a message
  void _log(
    String message, {
    required LogLevel level,
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

  void log(Object? message,
          {LogLevel level = LogLevel.info, String? channel}) =>
      _log(message.toString(), channel: channel, level: level);

  Future<T> future<T extends Object?>(Future<T> future,
      {String? channel, LogLevel level = LogLevel.info}) async {
    final s = Stopwatch()..start();
    final res = await future;
    s.stop();
    _log('(${s.elapsedMilliseconds} ms): $res', channel: channel, level: level);
    return res;
  }

  /// Log a serious crash, if possible
  void crash(String e, {String? channel}) =>
      _log(e, level: LogLevel.crash, channel: channel);

  /// Log an error, like if something is thrown
  void e(String e, {String? channel, StackTrace? stackTrace}) {
    _log(e, level: LogLevel.error, channel: channel);
    if (stackTrace != null) debugPrintStack(stackTrace: stackTrace);
  }

  /// Log a timed network operation
  Future<T> network<T extends Object?>(Future<T> Function() f,
          {String channel = 'network'}) =>
      future(f(), channel: channel);

  /// Log a ui event, like tapping a button
  void ui(String msg, {LogLevel level = LogLevel.info}) =>
      _log(msg, channel: 'ui', level: level);

  // Log an info
  void i(String msg, {String? channel, LogLevel level = LogLevel.info}) =>
      _log(msg, channel: channel, level: level);

  void json(
    Object? json, {
    String? indent,
    String? channel,
    LogLevel level = LogLevel.info,
  }) =>
      _log(JsonEncoder.withIndent(indent).convert(json),
          channel: channel, level: level);
}

/// The singleton logger instance.
LoggingService get log => LoggingService.instance;
