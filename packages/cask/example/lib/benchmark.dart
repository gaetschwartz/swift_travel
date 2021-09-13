import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cask/cask.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String byteSizeOf(int bytes, {int fixed = 0}) {
  const sizes = ['b', 'Kb', 'Mb', 'Gb'];
  var i = 0;
  var b = bytes;
  while (b > 1024 && i < sizes.length - 1) {
    b >>= 10;
    i++;
  }
  return '${b.toStringAsFixed(fixed)} ${sizes[i]}';
}

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  const n = 20 * 1000;

  final temp = await getTemporaryDirectory();

  final dir = path.join(temp.path);

  Storage.init(dir);
  Hive.init(dir);

  await putBenchmark(n);

  await overridingPutBenchmark(n);
}

Future<void> overridingPutBenchmark(int n) async {
  final b = Benchmark('put with same key');
  final s = Stopwatch()..stop();

  final c = Cask<String, int>('benchmarked');
  await c.open();

  for (var i = 0; i < n; i++) {
    s.start();
    await c.put('age', i);
    s.stop();
  }

  b.add(
    BenchmarkResult(
        name: 'cask', ms: s.elapsedMilliseconds, runs: n, size: File(c.path!).lengthSync()),
  );
  s.reset();
  await c.clear();
  await c.close();

  final h = await Hive.openBox<int>('benchmarked');

  for (var i = 0; i < n; i++) {
    s.start();
    await h.put('age', i);
    s.stop();
  }

  b.add(
    BenchmarkResult(
        name: 'hive box', ms: s.elapsedMilliseconds, runs: n, size: File(h.path!).lengthSync()),
  );
  s.reset();
  await h.clear();
  await h.close();

  final prefs = await SharedPreferences.getInstance();

  for (var i = 0; i < n; i++) {
    s.start();
    await prefs.setInt('age', i);
    s.stop();
  }

  b
    ..add(BenchmarkResult(name: 'shared_preferences', ms: s.elapsedMilliseconds, runs: n))
    ..log();

  await prefs.clear();
}

Future<void> putBenchmark(int n) async {
  final b = Benchmark('put');
  final s = Stopwatch()..stop();
  final r = Random();

  final c = Cask<String, int>('benchmarked');
  await c.open();

  for (var i = 0; i < n; i++) {
    final key = ascii.decode(List.generate(r.nextInt(32), (i) => r.nextInt(64) + 64));

    s.start();
    await c.put(key, i);
    s.stop();
  }

  b.add(BenchmarkResult(
    name: 'cask',
    ms: s.elapsedMilliseconds,
    runs: n,
    size: File(c.path!).lengthSync(),
  ));
  s.reset();
  await c.clear();
  await c.close();

  final h = await Hive.openBox<int>('benchmarked');

  for (var i = 0; i < n; i++) {
    final key = ascii.decode(List.generate(r.nextInt(32), (i) => r.nextInt(64) + 64));

    s.start();
    await h.put(key, i);
    s.stop();
  }

  b.add(BenchmarkResult(
    name: 'hive box',
    ms: s.elapsedMilliseconds,
    runs: n,
    size: File(h.path!).lengthSync(),
  ));
  s.reset();
  await h.clear();
  await h.close();

  final prefs = await SharedPreferences.getInstance();

  for (var i = 0; i < n; i++) {
    final key = ascii.decode(List.generate(r.nextInt(32), (i) => r.nextInt(64) + 64));

    s.start();
    await prefs.setInt(key, i);
    s.stop();
  }

  b
    ..add(BenchmarkResult(name: 'shared_preferences', ms: s.elapsedMilliseconds, runs: n))
    ..log();

  await prefs.clear();
}

class BenchmarkResult {
  BenchmarkResult({
    required this.name,
    required this.ms,
    required this.runs,
    this.size,
  });

  final String name;
  final int ms;
  final int runs;

  /// Size in bytes.
  final int? size;

  @override
  String toString() {
    final b = StringBuffer('''
==[ $name ]==
  > Avg: ${(ms / runs).toStringAsFixed(3)} ms/run
  > Freq: ${(1000 * runs) ~/ ms} runs/s
  > Runs: $runs
''');
    if (size != null) {
      b.writeln('  > Size: ${byteSizeOf(size!)}');
    }
    return b.toString();
  }
}

class Benchmark {
  Benchmark(this.name);

  final String name;
  final results = <BenchmarkResult>[];

  void add(BenchmarkResult r) => results.add(r);

  void log() {
    final buffer = StringBuffer()..writeln('''

${'=' * (name.length + 4)}
  $name
${'=' * (name.length + 4)}
''');
    for (final r in results) {
      buffer.writeln(r.toString());
    }
    print(buffer.toString());
  }

  void addResult(String name, {required int elapsed, required int runs}) =>
      add(BenchmarkResult(name: name, ms: elapsed, runs: runs));
}
