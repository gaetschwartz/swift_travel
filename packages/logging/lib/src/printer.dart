import 'package:gaets_logging/src/models.dart';

abstract class MessagePrinter {
  const MessagePrinter();
  String call(LogMessage msg);
}

class SimplePrinter extends MessagePrinter {
  const SimplePrinter();
  @override
  String call(LogMessage msg) => '[${msg.level}] ${msg.channel.toUpperCase()}: ${msg.message}';
}
