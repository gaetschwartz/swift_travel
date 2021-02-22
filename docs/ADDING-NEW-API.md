---
layout: single
classes: 
---

# Adding a new navigation API to support a new country

## Index

1. [Where to implement it](#1-where-to-implement-it)
2. [Implementing your class](#2-implementing-your-class)
3. [Add your api to the api factory](#3-add-your-api-to-the-api-factory)
4. [(Optional) Using API keys ](#4-optional-using-API-keys )
- [Complete example](#complete-example)
- [Need more help ?](#need-more-help-)

## 1. Where to implement it
  1. Make a folder named `your_api_name` in `lib/apis/navigation/`
  2. Create your main dart file in the created folder using the same name as the directory (or close enough)
  3. Your folder structure should look like something like this: 

  ```bash
  lib/
    apis/
      navigation/
        models/
        sncf/...
        search.ch/...
        your_api_name/ # Your api folder here
          your_api_name.dart # File where you will put implement your class
        navigation.dart
  ```
## 2. Implementing your class

You need to implement two different things:

- The api factory
- The api class itself extending `BaseNavigationApi`

Your `your_api_name.dart` should look like this:

```dart
final yourApiNameFactory = NavigationApiFactory(
  (_) => YourApiNameApi(),
  name: '<your api name>',
  shortName: "<your api's short name>",
  countryEmoji: "<the api's country emoji>",
  countryName: "<your api's country name>",
);

class YourApiNameApi extends BaseNavigationApi {
  
  // Implement here all unimplemented methods
  // VSCode should give you the option to write all the unimplemented
  // methods for you.

}
```

The type of all objects returned by the api are mixins. It means you should return a custom class representing your object (`YourApiRoute` in the example below) mixed in with the appropriate mixin.

For example see the `rawRoute` method here: 

```dart
@override
Future<NavRoute> rawRoute(Uri query) async {

  // Your fetching logic here...
  final YourApiRoute route = /*...*/;
  return route;
}

class YourApiRoute with NavRoute {
  int get count => /*...*/;
  List<String> get messages => /*...*/;
  DateTime? get dateTime => /*...*/;
  String? get requestUrl => /*...*/;
  List<RouteConnection> get connections => /*...*/;
}
```

## 3. Add your api to the api factory
1. Add your api name in the `NavigationApi` enum. It needs to of course be unique.
2. Add your api factory in the `BaseNavigationApi.getFactory(api)` method's switch statement like so in `lib/apis/navigation/navigation.dart`.

It should look similar to this:

```dart

enum NavigationApi { sbb, sncf, yourApi }

abstract class BaseNavigationApi {
  static NavigationApiFactory getFactory(NavigationApi api) {
    switch (api) {
      case NavigationApi.sncf:
        return sncfFactory;
      case NavigationApi.sbb:
        return searchChApi;
      case NavigationApi.yourApi:
        return yourApiNameFactory;
    }
  }

```

## 4. (Optional) Using API keys 

**If you are using an API key, DO NOT COMMIT IT**

Instead, add a new field in the freezed class at `lib/constants/config.dart` like so: 
```dart
@freezed
abstract class Config with _$Config {
  const factory Config({
    String? sncfKey,
    String? yourApiKey,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}
```
Then re-generate the freezed class using 
```
flutter pub run build_runner build --delete-conflicting-outputs
```
For more help on the `freezed` package, see [the package documentation](https://pub.dev/packages/freezed).

Finally, make sure to specify in your Pull-Request the link or quick instructions on how to obtain a key for this api key.

## Complete example
For a complete example, see the implementation of the `search.ch` api in [`lib/apis/navigation/search.ch/`](../lib/apis/navigation/search.ch/).

## Need more help ?
Contact me on [Twitter](https://twitter.com/gaetschwartz).

