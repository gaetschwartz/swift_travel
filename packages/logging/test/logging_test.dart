import 'package:flutter_test/flutter_test.dart';
import 'package:gaets_logging/logging.dart';

void main() {
  test("SimplePrinter", () {
    const printer = SimplePrinter();
    final msg = LogMessage(
      message: "Hello world",
      timestamp: DateTime.now(),
      level: LogLevel.fine,
      channel: "my_channel",
    );

    final s = printer(msg);

    expect(s, msg.message);
  });
  test("DetailedPrinter", () {
    final s = const DetailedPrinter()(LogMessage(
      message: "Hello world",
      timestamp: DateTime(2021, 9, 7, 3, 47, 52),
      level: LogLevel.fine,
      channel: "my_channel",
    ));

    expect(s, "[fine] my_channel: Hello world");

    final s2 = const DetailedPrinter()(LogMessage(
      message: "Hello world",
      timestamp: DateTime(2021, 9, 7, 3, 47, 52),
      level: LogLevel.fine,
    ));

    expect(s2, "[fine] Hello world");

    final s3 = const DetailedPrinter(displayTimestamp: true)(LogMessage(
      message: "Hello world",
      timestamp: DateTime(2021, 9, 7, 3, 47, 52),
      level: LogLevel.fine,
    ));

    expect(s3, "(03:47:52 07.09.2021) [fine] Hello world");
  });
}
