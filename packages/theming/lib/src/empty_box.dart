import 'package:hive/hive.dart';

class EmptyBox<T> extends Box<T> {
  @override
  Future<int> add(T value) {
    throw UnimplementedError();
  }

  @override
  Future<Iterable<int>> addAll(Iterable<T> values) {
    throw UnimplementedError();
  }

  @override
  Future<int> clear() {
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  Future<void> compact() {
    throw UnimplementedError();
  }

  @override
  bool containsKey(dynamic key) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(dynamic key) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll(Iterable<dynamic> keys) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAt(int index) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFromDisk() {
    throw UnimplementedError();
  }

  @override
  Future<void> flush() {
    throw UnimplementedError();
  }

  @override
  T? get(dynamic key, {T? defaultValue}) {
    throw UnimplementedError();
  }

  @override
  T? getAt(int index) {
    throw UnimplementedError();
  }

  @override
  bool get isEmpty => throw UnimplementedError();

  @override
  bool get isNotEmpty => throw UnimplementedError();

  @override
  bool get isOpen => throw UnimplementedError();

  @override
  dynamic keyAt(int index) {
    throw UnimplementedError();
  }

  @override
  Iterable<dynamic> get keys => throw UnimplementedError();

  @override
  bool get lazy => throw UnimplementedError();

  @override
  int get length => throw UnimplementedError();

  @override
  String get name => throw UnimplementedError();

  @override
  String? get path => throw UnimplementedError();

  @override
  Future<void> put(dynamic key, T value) {
    throw UnimplementedError();
  }

  @override
  Future<void> putAll(Map<dynamic, T> entries) {
    throw UnimplementedError();
  }

  @override
  Future<void> putAt(int index, T value) {
    throw UnimplementedError();
  }

  @override
  Map<dynamic, T> toMap() {
    throw UnimplementedError();
  }

  @override
  Iterable<T> get values => throw UnimplementedError();

  @override
  Iterable<T> valuesBetween({dynamic startKey, dynamic endKey}) {
    throw UnimplementedError();
  }

  @override
  Stream<BoxEvent> watch({dynamic key}) {
    throw UnimplementedError();
  }
}
