import 'package:intl/intl.dart';

import 'models.dart';

abstract class MessagePrinter {
  const MessagePrinter();

  String call(LogMessage msg);

  String formatScope(Scope scope) => scope.join(':');
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
    final df = DateFormat("HH:mm:ss dd.MM.yyyy");
    final b = StringBuffer();

    if (displayTimestamp) {
      b.write("(${df.format(msg.timestamp)}) ");
    }

    b.write(
        '[${capitalLetterLevel ? msg.level.name.toUpperCase() : msg.level.name}] ');
    if (msg.scope.value.isNotEmpty) {
      b.write('${formatScope(msg.scope)}: ');
    }
    b.write(msg.message);
    return b.toString();
  }
}

class JsonPrinter extends MessagePrinter {
  const JsonPrinter();

  @override
  String call(LogMessage msg) {
    return msg.toJson().toString();
  }
}

class SimplePrinter extends MessagePrinter {
  const SimplePrinter();

  @override
  String call(LogMessage msg) =>
      "${msg.level.name[0].toUpperCase()}: ${msg.message}";
}

class BasicPrinter extends MessagePrinter {
  const BasicPrinter();

  @override
  String call(LogMessage msg) {
    final b = StringBuffer();

    b.write('${msg.level.name[0].toUpperCase()} ');
    if (msg.scope.value.isNotEmpty) {
      b.write('[${formatScope(msg.scope)}] ');
    }
    b.write(msg.message);
    return b.toString();
  }
}
