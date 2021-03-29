import 'cask.dart';

class CaskImpl<TKey, Tvalue> implements Cask {
  @override
  String get caskKey => throw UnimplementedError();

  @override
  Future<void> clear() {
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(Object key) {
    throw UnimplementedError();
  }

  @override
  Object? get(Object key) {
    throw UnimplementedError();
  }

  @override
  Future<void> open() {
    throw UnimplementedError();
  }

  @override
  Future<void> put(Object key, Object value) {
    throw UnimplementedError();
  }

  @override
  String? get path => throw UnimplementedError();
}
