import 'package:cask/src/io.dart'
    if (dart.library.io) 'package:cask/src/io.dart'
    if (dart.library.html) 'package:cask/src/html.dart';

abstract class Cask<TKey extends Object, TValue extends Object> {
  factory Cask(String caskKey) => CaskImpl<TKey, TValue>(caskKey);

  Future<void> open();
  Future<void> close();

  Future<void> put(TKey key, TValue value);
  TValue? get(TKey key);
  Future<void> clear();
  Future<void> delete(TKey key);

  String get caskKey;
  String? get path;
}

// ignore: avoid_classes_with_only_static_members
class CaskStorage<TKey, TValue> {
  static void init([String? path]) {
    CaskStorage._path = path;
    CaskStorage.isOpened = true;
  }

  static bool isOpened = false;
  static String? _path;
  static String get path => _path == null ? throw StateError('') : _path!;
}
