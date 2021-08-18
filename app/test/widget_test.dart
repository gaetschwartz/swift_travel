import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/db/models/cache.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/line_icon.dart';
import 'package:swift_travel/widgets/sbb_icon.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('widgets >', () {
    group('lineIcon >', () {
      const lineIcon =
          LineIcon.raw(foreground: Color(0xffffffff), background: Color(0xff72c1f0), line: '5');
      final lineIcon2 = LineIcon.fromLine(const Line('5', '72c1f0~ffffff~'));

      Future<void> testLineIcon(WidgetTester t, LineIcon lineIcon) async {
        await t.pumpWidget(MaterialApp(home: Center(child: lineIcon)));

        final text = find.text(lineIcon.line!);
        final textWidget = t.firstWidget(text) as Text;
        expect(text, findsOneWidget);
        expect(textWidget.style!.color, isSameColorAs(lineIcon.foreground));

        final dBox = find.byType(DecoratedBox);
        final dBoxWidget = t.firstWidget(dBox) as DecoratedBox;
        final decoration = dBoxWidget.decoration as BoxDecoration;
        expect(decoration.color, isSameColorAs(lineIcon.background));
        expect(
          decoration.boxShadow,
          anyElement(
            predicate<BoxShadow>(
              (s) => (s.color.value ^ lineIcon.background.value) & 0xffffff == 0x000000,
            ),
          ),
        );
      }

      test('constructs correctly', () {
        expect(lineIcon.background, lineIcon2.background);
        expect(lineIcon.foreground, lineIcon2.foreground);
        expect(lineIcon.line, lineIcon2.line);
      });
      testWidgets('test widget', (t) async {
        await testLineIcon(t, lineIcon);
      });
    });

    testWidgets('ifWrapper', (t) async {
      // ignore: avoid_positional_boolean_parameters
      Widget buildWrapper(bool condition, {bool addElseBuilder = true}) => MaterialApp(
            home: IfWrapper(
              condition: condition,
              builder: (_, c) => SizedBox(key: const Key('true-key'), child: c),
              elseBuilder:
                  addElseBuilder ? (_, c) => SizedBox(key: const Key('false-key'), child: c) : null,
              child: const Text('child'),
            ),
          );

      await t.pumpWidget(buildWrapper(true));

      expect(find.text('child'), findsOneWidget);
      expect(find.byKey(const Key('true-key')), findsOneWidget);

      await t.pumpWidget(buildWrapper(false));

      expect(find.text('child'), findsOneWidget);
      expect(find.byKey(const Key('false-key')), findsOneWidget);

      await t.pumpWidget(buildWrapper(false, addElseBuilder: false));

      expect(find.text('child'), findsOneWidget);
      expect(find.byType(SizedBox), findsNothing);
    });

    group('sbbIcon >', () {
      testWidgets('.constructor()', (t) async {
        for (final v in TransportationMode.values) {
          final sbbIcon = SbbIcon(v);

          await t.pumpWidget(MaterialApp(home: Center(child: sbbIcon)));
          final icon = [find.byType(FaIcon), find.byType(Icon)];
          expect(icon, anyElement(findsOneWidget));
        }
      });
      testWidgets('.fromIconClass()', (t) async {
        for (final v in TransportationMode.values) {
          final text = describeEnum(v);
          final exp = RegExp('(?<=[a-z])[A-Z]');
          final result = text.replaceAllMapped(exp, (m) => '_${m.group(0)!}').toLowerCase();
          final sbbIcon = SbbIcon.fromIconClass(result);

          await t.pumpWidget(MaterialApp(home: Center(child: sbbIcon)));
          final icon = [find.byType(FaIcon), find.byType(Icon)];
          expect(icon, anyElement(findsOneWidget));
        }
      });
    });
  });
}
