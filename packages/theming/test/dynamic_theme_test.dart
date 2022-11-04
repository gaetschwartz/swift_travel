// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:theming/dynamic_theme.dart';

void main() {
  group('dynamic theme', () {
    final roboto = Font('Roboto', (t) => t.apply(fontFamily: 'Roboto'));
    final themeConfiguration = ThemeConfiguration(
      lightThemes: [
        const ExtendedTheme(
          id: 'theme1',
          name: 'Theme 1',
          colorScheme: ColorScheme.light(),
        ),
        const ExtendedTheme(
          id: 'theme2',
          name: 'Theme 2',
          colorScheme: ColorScheme.light(),
        ),
      ],
      darkThemes: [
        const ExtendedTheme(
          id: 'theme1',
          name: 'Theme 1',
          colorScheme: ColorScheme.dark(),
        ),
        const ExtendedTheme(
          id: 'theme2',
          name: 'Theme 2',
          colorScheme: ColorScheme.dark(),
        ),
      ],
      fonts: [Font.platform, roboto],
    );
    test('platform', () async {
      final theme = DynamicThemeNotifier.withDefaultConfig();

      var notified = 0;

      theme.addListener(() {
        notified++;
      });

      expect(notified, 0);
      await theme.setPlatform(TargetPlatform.android);
      expect(notified, 1);
      expect(theme.platform, TargetPlatform.android);
      expect(theme.light.platform, TargetPlatform.android);
      expect(theme.dark.platform, TargetPlatform.android);
      await theme.setPlatform(TargetPlatform.iOS);
      expect(notified, 2);
      expect(theme.platform, TargetPlatform.iOS);
      expect(theme.light.platform, TargetPlatform.iOS);
      expect(theme.dark.platform, TargetPlatform.iOS);
    });

    test('theme mode', () async {
      final theme = DynamicThemeNotifier.withDefaultConfig();

      var notified = 0;

      theme.addListener(() {
        notified++;
      });

      expect(notified, 0);
      await theme.setThemeMode(ThemeMode.dark);
      expect(notified, 1);
      expect(theme.themeMode, ThemeMode.dark);

      await theme.setThemeMode(ThemeMode.light);
      expect(notified, 2);
      expect(theme.themeMode, ThemeMode.light);
    });

    test('theme id', () async {
      final theme = DynamicThemeNotifier(themeConfiguration);

      var notified = 0;

      theme.addListener(() {
        notified++;
      });

      expect(notified, 0);
      await theme.setLightTheme('theme1');
      expect(notified, 1);
      expect(theme.lightTheme.id, 'theme1');

      await theme.setDarkTheme('theme2');
      expect(notified, 2);
      expect(theme.darkTheme.id, 'theme2');

      // swap

      await theme.setLightTheme('theme2');
      expect(notified, 3);
      expect(theme.lightTheme.id, 'theme2');

      await theme.setDarkTheme('theme1');
      expect(notified, 4);
      expect(theme.darkTheme.id, 'theme1');

      // set an invalid id
      expect(() => theme.setLightTheme('invalid'), throwsArgumentError);
      expect(() => theme.setDarkTheme('invalid'), throwsArgumentError);
    });

    group('persistence', () {
      setUpAll(() async {
        Hive.init('test/hive');
        final box = await DynamicThemeNotifier.openBox();
        await box.clear();
      });

      test('loads correctly', () async {
        final theme = DynamicThemeNotifier.withDefaultConfig();

        await theme.configure(themeConfiguration.copyWith(persist: true));

        await theme.setLightTheme('theme1');
        await theme.setDarkTheme('theme2');
        await theme.setFont(roboto);

        await theme.save();

        final theme2 = DynamicThemeNotifier.withDefaultConfig();

        await theme2.configure(themeConfiguration.copyWith(persist: true));

        final box = await DynamicThemeNotifier.openBox();
        // print box
        for (final key in box.keys) {
          print('$key: ${box.get(key)}');
        }

        expect(theme2.lightTheme.id, 'theme1');
        expect(theme2.darkTheme.id, 'theme2');
        expect(theme2.font, roboto);

        await theme2.setLightTheme('theme2');
        await theme2.setDarkTheme('theme1');
        await theme2.setFont(Font.platform);

        await theme2.save();

        final theme3 = DynamicThemeNotifier.withDefaultConfig();

        await theme3.configure(themeConfiguration.copyWith(persist: true));

        expect(theme3.lightTheme.id, 'theme2');
        expect(theme3.darkTheme.id, 'theme1');
        expect(theme3.font, Font.platform);

        theme.dispose();
        theme2.dispose();
        theme3.dispose();
      });
    });
  });
}
