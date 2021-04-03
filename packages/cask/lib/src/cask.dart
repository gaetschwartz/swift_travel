import 'package:cask/src/io.dart'
    if (dart.library.io) 'package:cask/src/io.dart'
    if (dart.library.html) 'package:cask/src/html.dart';

abstract class Cask<TKey extends Object, TValue extends Object> {
  factory Cask(String caskKey) = CaskImpl;

  Future<void> open();
  Future<void> close();

  Future<void> put(TKey key, TValue value);
  TValue? get(TKey key);
  Future<void> clear();
  Future<void> delete(TKey key);

  String get caskKey;
  String? get path;
}

class Storage {
  Storage._();

  static Future<Cask<R, S>> openCask<R extends Object, S extends Object>(String caskKey) async {
    final cask = CaskImpl<R, S>(caskKey);
    await cask.open();
    return cask;
  }

  static bool _isOpened = false;
  static bool get isOpened => _isOpened;
  static String? _path;
  static String get storagePath => _path == null ? throw StateError('') : _path!;

  static void init([String? path]) {
    Storage._path = path;
    Storage._isOpened = true;
  }
}
