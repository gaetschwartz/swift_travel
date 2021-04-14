/// Implement this to create a log consumer
abstract class LogConsumer {
  const LogConsumer();

  void log(String s);
}

/// Log messages to the dart console
class ConsoleLogger extends LogConsumer {
  const ConsoleLogger();

  @override
  void log(String s) => print(s);
}
