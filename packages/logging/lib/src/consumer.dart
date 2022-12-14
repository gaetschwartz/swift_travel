import 'dart:async';
import 'dart:collection';
import 'dart:developer' as dev;
import 'dart:io';

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

  /// Consume a message
  @nonVirtual
  void consume(LogMessage msg) {
    if (filter(msg)) log(msg);
  }
}

/// Log messages to the dart console
class ConsoleLogger extends LogConsumer {
  const ConsoleLogger({
    MessagePrinter printer = const SimplePrinter(),
    LogFilter logFilter = const AlwaysAllowFilter(),
    this.useDeveloperLog = kDebugMode,
  }) : super(printer, logFilter);

  final bool useDeveloperLog;

  @override
  void log(LogMessage msg) {
    if (useDeveloperLog) {
      dev.log(
        printer(msg),
        name: printer.formatScope(msg.scope),
        time: msg.timestamp,
        level: msg.level.level,
        error: msg.error,
        stackTrace: msg.stackTrace,
      );
    } else {
      print(printer(msg));
    }
  }
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

class FileLogger extends LogConsumer {
  FileLogger(
    this.file, {
    MessagePrinter printer = const SimplePrinter(),
    LogFilter logFilter = const AlwaysAllowFilter(),
  }) : super(printer, logFilter);

  final File file;

  @override
  void log(LogMessage msg) {
    unawaited(file.writeAsString(printer(msg), mode: FileMode.append));
  }
}
