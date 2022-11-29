import 'package:flutter_test/flutter_test.dart';
import 'package:gaets_logging/logging.dart';

void main() {
  group("Logging", () {
    test("SimplePrinter", () {
      const printer = SimplePrinter();
      final msg = LogMessage(
        message: "Hello world",
        timestamp: DateTime.now(),
        level: LogLevel.fine,
        scope: const Scope(["my_channel"]),
      );

      final s = printer(msg);

      expect(s, contains("Hello world"));
    });
    test("DetailedPrinter", () {
      final s = const DetailedPrinter()(LogMessage(
        message: "Hello world",
        timestamp: DateTime(2021, 9, 7, 3, 47, 52),
        level: LogLevel.fine,
        scope: const Scope(["my_channel"]),
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

    test("Future works", () async {
      final consumer = LogAggregator(100);

      Logger.root.setConsumers([consumer]);
      expect(Logger.root.consumers.first, isA<LogAggregator>());
      expect(Logger.root.consumers, hasLength(1));

      final res =
          await Future<int>.delayed(const Duration(milliseconds: 500), () => 42)
              .log();

      expect(consumer.messages, hasLength(1));
      expect(res, 42);
      expect(consumer.messages.first.message,
          matches(RegExp(r'\(\d+ ms\): ' + res.toString())));
    });

    group("scoping", () {
      test("scope", () {
        expect(
          const Scope(["1", "2", "3", 'aaa']),
          const Scope(["1", "2", "3", 'aaa']),
        );
      });
      test("children are correctly created", () {
        final l0 = Logger.root;
        expect(l0.scope, Scope.empty);
        final l1 = Logger.of("hello");
        expect(l1.scope, const Scope(["hello"]));
        final l2 = Logger.root.child("hello").child("world").child("cool");
        expect(l2.scope, const Scope(["hello", "world", "cool"]));
        final l3 = Logger.of("hello", "world", "cool");
        expect(l3.scope, const Scope(["hello", "world", "cool"]));
        expect(l3.scope, l2.scope);

        expect(identical(l2, l3), isTrue);
      });
    });
  });
}
