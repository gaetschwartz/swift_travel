import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'filter.dart';
import 'models.dart';
import 'printer.dart';

/// Implement this to create a log consumer
abstract class LogConsumer {
  const LogConsumer(this.printer, this.filter);

  final MessagePrinter printer;
  final LogFilter filter;

  @protected
  void log(LogMessage msg);

  @nonVirtual

  /// Consume a message
  void consume(LogMessage msg) {
    if (filter(msg)) log(msg);
  }
}

/// Log messages to the dart console
class ConsoleLogger extends LogConsumer {
  const ConsoleLogger({
    MessagePrinter printer = const SimplePrinter(),
    LogFilter logFilter = const AlwaysAllowFilter(),
  }) : super(printer, logFilter);

  @override
  void log(LogMessage msg) => print(printer(msg));
}

class LogAggregator extends LogConsumer {
  LogAggregator(
    this.bufferSize, {
    MessagePrinter printer = const SimplePrinter(),
    LogFilter logFilter = const AlwaysAllowFilter(),
  }) : super(printer, logFilter);

  final int bufferSize;

  final _queue = Queue<LogMessage>();

  @override
  void log(LogMessage msg) {
    _queue.add(msg);
    if (_queue.length > bufferSize) {
      _queue.removeFirst();
    }
  }

  Iterable<LogMessage> get messages => _queue;

  Iterable<String> get logs => _queue.map<String>(printer);
}
