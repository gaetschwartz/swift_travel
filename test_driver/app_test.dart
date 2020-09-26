// ignore_for_file: avoid_print
// Imports the Flutter Driver API.

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

Future<void> wait([int ms = 500]) => Future.delayed(Duration(milliseconds: ms));

void main() {
  group('Swiss Travel App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final searchRoute = find.byValueKey("search-route");
    final routeTab = find.byValueKey("route-tab-key");
    final favsTab = find.byValueKey("favs-tab-key");
    final firstTf = find.byValueKey("route-first-textfield-key");
    final secondTf = find.byValueKey("route-second-textfield-key");
    final scaffoldTitle = find.byValueKey("scaffold-title");
    final tile = find.byValueKey("routetile-0");
    final stationsTf = find.byValueKey("stations-textfield");
    final firstStation = find.byValueKey("stations-key-0");

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Check flutter driver health', () async {
      final health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });

    test('Navigate through app', () async {
      await driver.runUnsynchronized(() async {
        await driver.waitFor(scaffoldTitle);
        await wait();
        await driver.tap(stationsTf);
        await wait();
        await driver.enterText("Genève");
        await wait();
        await driver.tap(scaffoldTitle);
        await wait();
        await driver.waitFor(firstStation, timeout: const Duration(seconds: 5));
        await driver.tap(firstStation);
        await wait(1000);
        await driver.tap(find.byType("BackButton"));
        await wait();

        //? Search route
        await driver.tap(routeTab);
        await wait();
        await driver.tap(firstTf);
        await wait();
        await driver.enterText("Université de Genève, Genève, Rue du Général-Dufour 24");
        await wait();
        await driver.tap(scaffoldTitle);
        await wait();
        await driver.tap(secondTf);
        await wait();
        await driver.enterText("Badenerstrasse 549, 8048 Zürich");
        await wait();
        await driver.tap(scaffoldTitle);
        await wait();
        await driver.tap(searchRoute);

        await driver.waitFor(tile);
        await driver.tap(tile);
        await wait();
        await driver.tap(find.byType("BackButton"));

        await wait();
        await driver.tap(favsTab);
        await wait();

        await driver.tap(find.byValueKey("settings"));
        await wait();
        await driver.tap(find.byValueKey("light"));
        await wait(1000);
        await driver.tap(find.byValueKey("dark"));
        await wait(1000);
        await driver.tap(find.byValueKey("light"));
        await wait(1000);
        await driver.tap(find.byValueKey("dark"));
        await wait(1000);
      });
    });
  }, timeout: const Timeout(Duration(minutes: 5)));
}
