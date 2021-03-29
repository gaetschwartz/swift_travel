import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class MockRandomAccessFile implements RandomAccessFile {
  MockRandomAccessFile(this.data);
  Uint8List data;
  int p = 0;

  @override
  @Deprecated('Use the sync method')
  Future<void> close() async {}

  @override
  void closeSync() {}

  @override
  @Deprecated('Use the sync method')
  Future<RandomAccessFile> flush() async => this;

  @override
  void flushSync() => this;

  @override
  @Deprecated('Use the sync method')
  Future<int> length() => Future.value(data.length);

  @override
  int lengthSync() => data.length;

  @override
  @Deprecated('Use the sync method')
  Future<RandomAccessFile> lock(
          [FileLock mode = FileLock.exclusive, int start = 0, int end = -1]) async =>
      this;

  @override
  void lockSync([FileLock mode = FileLock.exclusive, int start = 0, int end = -1]) {}

  @override
  String get path => data.toString();

  @override
  Future<int> position() => Future.value(p);

  @override
  @Deprecated('Use the sync method')
  int positionSync() => p;

  @override
  Future<int> readByte() async => readByteSync();

  @override
  int readByteSync() => data[p++];

  @override
  Future<int> readInto(List<int> buffer, [int start = 0, int? end]) async =>
      readIntoSync(buffer, start, end);

  @override

  /// WARNING: Doesn't return the correct value but shouldn't really matter
  int readIntoSync(List<int> buffer, [int start = 0, int? end]) {
    buffer.setRange(start, end ?? buffer.length, data, p);
    return 0;
  }

  @override
  Uint8List readSync(int count) {
    final uint8list = Uint8List.sublistView(data, p, p + count);
    p += count;
    return uint8list;
  }

  @override
  Future<Uint8List> read(int count) async => readSync(count);

  @override
  Future<RandomAccessFile> setPosition(int position) {
    setPositionSync(position);
    return Future.value(this);
  }

  @override
  void setPositionSync(int position) => p = position;

  @override
  Future<RandomAccessFile> truncate(int length) {
    truncateSync(length);
    return Future.value(this);
  }

  @override
  void truncateSync(int length) {
    final newData = Uint8List(length)..setAll(0, data);
    data = newData;
  }

  @override
  Future<RandomAccessFile> unlock([int start = 0, int end = -1]) => Future.value(this);

  @override
  void unlockSync([int start = 0, int end = -1]) {}

  @override
  Future<RandomAccessFile> writeByte(int value) {
    writeByteSync(value);
    return Future.value(this);
  }

  @override
  int writeByteSync(int value) {
    data[p] = value;
    return 1;
  }

  @override
  Future<RandomAccessFile> writeFrom(List<int> buffer, [int start = 0, int? end]) {
    writeFromSync(buffer, start, end);
    return Future.value(this);
  }

  @override
  void writeFromSync(List<int> buffer, [int start = 0, int? end]) {
    data.setRange(start, end ?? buffer.length, buffer, p);
  }

  @override
  Future<RandomAccessFile> writeString(String string, {Encoding encoding = utf8}) {
    writeStringSync(string, encoding: encoding);
    return Future.value(this);
  }

  @override
  void writeStringSync(String string, {Encoding encoding = utf8}) {
    data.setAll(p, encoding.encode(string));
  }
}
