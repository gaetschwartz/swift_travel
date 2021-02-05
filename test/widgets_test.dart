import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/search.ch/models/vehicle_iconclass.dart';
import 'package:swift_travel/tabs/stations/completion_tile.dart';
import 'package:swift_travel/widgets/cff_icon.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/line_icon.dart';

void main() {
  group('widgets', () {
    group('lineIcon', () {
      testWidgets('.constructor()', (t) async {
        const lineIcon = LineIcon(foreground: 'ffffff', background: '72c1f0', line: '5');
        await _testLineIcon(t, lineIcon);
      });
      testWidgets('.fromLine()', (t) async {
        final lineIcon = LineIcon.fromLine(const Line('5', '72c1f0~ffffff~'));
        await _testLineIcon(t, lineIcon);
      });
    });

    testWidgets('ifWrapper', (t) async {
      Widget buildWrapper(bool condition, {bool addElseBuilder = true}) => MaterialApp(
            home: IfWrapper(
                condition: condition,
                builder: (_, c) => SizedBox(key: const Key('true-key'), child: c),
                elseBuilder: addElseBuilder
                    ? (_, c) => SizedBox(key: const Key('false-key'), child: c)
                    : null,
                child: const Text('child')),
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

    group('cffIcon', () {
      testWidgets('.constructor()', (t) async {
        for (final v in Vehicle.values) {
          final cffIcon = CffIcon(v);

          await t.pumpWidget(MaterialApp(home: Center(child: cffIcon)));
          final icon = [find.byType(FaIcon), find.byType(Icon)];
          expect(icon, anyElement(findsOneWidget));
        }
      });
      testWidgets('.fromIconClass()', (t) async {
        for (final v in Vehicle.values) {
          final text = describeEnum(v);
          final exp = RegExp(r'(?<=[a-z])[A-Z]');
          final result = text.replaceAllMapped(exp, (Match m) => ('_' + m.group(0))).toLowerCase();
          final cffIcon = CffIcon.fromIconClass(result);

          await t.pumpWidget(MaterialApp(home: Center(child: cffIcon)));
          final icon = [find.byType(FaIcon), find.byType(Icon)];
          expect(icon, anyElement(findsOneWidget));
        }
      });

      test('make sure getIcon throws when null (deprecated)', () {
        Widget getIcon() => CffIcon.getIcon(null);

        expect(getIcon, returnsNormally);
        expect(getIcon(), isNotNull);
      });
    });
  });
}

Future<void> _testLineIcon(WidgetTester t, LineIcon lineIcon) async {
  await t.pumpWidget(MaterialApp(
    home: Center(child: lineIcon),
  ));
  final text = find.text('5');
  final textWidget = t.firstWidget(text) as Text;
  expect(text, findsOneWidget);
  expect(textWidget.style.color, isSameColorAs(Colors.white));

  final dBox = find.byType(DecoratedBox);
  final dBoxWidget = t.firstWidget(dBox) as DecoratedBox;
  expect((dBoxWidget.decoration as BoxDecoration).color, isSameColorAs(const Color(0xff72c1f0)));
}
