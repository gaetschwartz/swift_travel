import 'package:gaets_logging/src/models.dart';

abstract class MessagePrinter {
  const MessagePrinter();
  String call(LogMessage msg);
}

class SimplePrinter extends MessagePrinter {
  const SimplePrinter();
  @override
  String call(LogMessage msg) {
    final b = StringBuffer()..write('[${msg.level.name.toUpperCase()}] ');
    if (msg.channel != null) {
      b.write('${msg.channel}: ');
    }
    b.write(msg.message);
    return b.toString();
  }
}
