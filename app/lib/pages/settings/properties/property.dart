import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Property<T extends Object?> extends ChangeNotifier {
  Property({
    this.onSet,
    FutureOr<T> Function(T?)? computeValue,
    this.defaultValue,
  })  : assert(
          null is T || defaultValue != null,
          'You need to provide a default value for non-nullable properties.',
        ),
        _computeValue = computeValue,
        _value = defaultValue!;
  final void Function(T value)? onSet;
  final FutureOr<T> Function(T?)? _computeValue;
  final T? defaultValue;

  T _value;

  T get value => _value;

  set value(T value) {
    if (value == _value) {
      return;
    }
    _value = value;
    if (onSet != null) {
      onSet?.call(_value);
    }
    notifyListeners();
  }

  // ignore: use_setters_to_change_properties
  void setValue(T val) => _value = val;

  FutureOr<void> computeValue() async {
    if (_computeValue != null) {
      _value = await _computeValue!.call(defaultValue);
      notifyListeners();
    }
  }

  late final ChangeNotifierProvider<Property<T>> provider = ChangeNotifierProvider((r) => this);

  static T Function(T?) getFromPreferences<T>(
    String key,
    SharedPreferences Function() preferencesGetter,
  ) =>
      (d) {
        final prefs = preferencesGetter();
        final object = prefs.get(key) ?? d;
        assert(object is T, 'Value must be of correct type.');
        return object as T;
      };

  static void Function(T) saveInPreferences<T>(
    String key,
    SharedPreferences Function() preferencesGetter,
  ) {
    final prefs = preferencesGetter();
    return (value) async {
      if (value is String) {
        await prefs.setString(key, value);
      } else if (value is int) {
        await prefs.setInt(key, value);
      } else if (value is bool) {
        await prefs.setBool(key, value);
      } else if (value is List<String>) {
        await prefs.setStringList(key, value);
      } else if (value is double) {
        await prefs.setDouble(key, value);
      } else {
        assert(false, 'Type ${value.runtimeType} is not supported for shared preferences');
      }
    };
  }
}
