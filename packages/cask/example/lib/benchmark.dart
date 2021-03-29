import 'dart:io';

import 'package:cask/cask.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main(List<String> args) async {
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

  const n = 10000;

  const warmup = 1000;

  final temp = await getTemporaryDirectory();

  final dir = path.join(temp.path);

  CaskStorage.init(dir);
  Hive.init(dir);

  final c = Cask<String, int>('benchmarked');
  await c.open();

  final s = Stopwatch()..stop();

  for (var i = 0; i < n; i++) {
    s.start();
    await c.put('age', i);
    s.stop();
  }

  _printResults('cask put', elapsed: s.elapsedMilliseconds, runs: n);
  print(byteSizeOf(File(c.path!).lengthSync()));

  s.reset();
  final h = await Hive.openBox<int>('benchmarked');

  for (var i = 0; i < n; i++) {
    s.start();
    await h.put('age', i);
    s.stop();
  }

  _printResults('hive box put', elapsed: s.elapsedMilliseconds, runs: n);
  print(byteSizeOf(File(h.path!).lengthSync()));

  s.reset();
  final prefs = await SharedPreferences.getInstance();

  for (var i = 0; i < n; i++) {
    s.start();
    await prefs.setInt('age', i);
    s.stop();
  }

  _printResults('shared_preferences put', elapsed: s.elapsedMilliseconds, runs: n);
}

void _printResults(String name, {required int elapsed, required int runs}) {
  print('==[ $name ]==');
  print('  > Avg: ${(elapsed / runs).toStringAsFixed(3)} ms/run');
  print('  > Freq: ${(1000 * runs) ~/ elapsed} runs/s');
  print('  > Runs: $runs');
}
