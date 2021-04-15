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
