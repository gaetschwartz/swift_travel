import 'dart:collection';

import 'package:gaets_logging/logging.dart';

/// Implement this to create a log consumer
abstract class LogConsumer {
  const LogConsumer(this.printer);

  final MessagePrinter printer;

  void log(String s);

  void consume(LogMessage m) => log(printer(m));
}

/// Log messages to the dart console
class ConsoleLogger extends LogConsumer {
  const ConsoleLogger({MessagePrinter printer = const SimplePrinter()}) : super(printer);

  @override
  void log(String s) => print(s);
}

class LogAggregator extends LogConsumer {
  LogAggregator(this.bufferSize, [MessagePrinter printer = const SimplePrinter()]) : super(printer);

  final int bufferSize;

  final _queue = DoubleLinkedQueue<LogMessage>();

  @override
  void log(String s) => throw UnsupportedError('Aggregate using LogAggregator.consume(message).');

  @override
  void consume(LogMessage m) {
    _queue.add(m);
    if (_queue.length > bufferSize) {
      _queue.removeFirst();
    }
  }

  List<LogMessage> get messages => List.from(_queue);

  List<String> get logs => logsWithPrinter(printer);

  List<String> logsWithPrinter(MessagePrinter printer) => List.from(_queue.map<String>(printer));
}
