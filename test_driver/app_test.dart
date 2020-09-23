// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Swiss Travel App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final searchRoute = find.byValueKey("search-route");
    final searchTab = find.byValueKey("search-tab-key");
    final routeTab = find.byValueKey("route-tab-key");
    final favsTab = find.byValueKey("favs-tab-key");
    final firstTf = find.byValueKey("route-first-textfield-key");
    final secondTf = find.byValueKey("route-second-textfield-key");

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

    test('Navigate through app', () async {
      //? Route search
      await driver.tap(routeTab);
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(firstTf);
      await Future.delayed(const Duration(seconds: 1));
      await driver.enterText("Université de Genève, Genève, Rue du Général-Dufour 24");
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(secondTf);
      await Future.delayed(const Duration(seconds: 1));
      await driver.enterText("Badenerstrasse 549, 8048 Zürich");
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(searchRoute);
      await Future.delayed(const Duration(seconds: 1));

      await driver.tap(favsTab);
    });
  }, timeout: const Timeout(Duration(minutes: 20)));
}
