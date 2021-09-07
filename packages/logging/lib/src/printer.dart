import 'package:intl/intl.dart';

import 'models.dart';

abstract class MessagePrinter {
  const MessagePrinter();

  String call(LogMessage msg);
}

class DetailedPrinter extends MessagePrinter {
  const DetailedPrinter({
    this.displayTimestamp = false,
    this.capitalLetterLevel = false,
  });

  final bool displayTimestamp;
  final bool capitalLetterLevel;

  @override
  String call(LogMessage msg) {
    final b = StringBuffer();

    if (displayTimestamp) {
      b.write("(${DateFormat("HH:mm:ss dd.MM.yyyy").format(msg.timestamp)}) ");
    }

    b.write('[${capitalLetterLevel ? msg.level.name.toUpperCase() : msg.level.name}] ');
    if (msg.channel != null) {
      b.write('${msg.channel}: ');
    }
    b.write(msg.message);
    return b.toString();
  }
}

class SimplePrinter extends MessagePrinter {
  const SimplePrinter();

  @override
  String call(LogMessage msg) => msg.message;
}
