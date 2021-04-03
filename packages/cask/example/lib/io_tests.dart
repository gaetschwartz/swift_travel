import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:example/benchmark.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final r = Random();
  final temp = await getPath();
  final f = File(path.join(temp.path, 'test_file.txt'));

  await f.writeAsString(List.generate(10000, (i) => i).join(','));

  final s = Stopwatch()..stop();
  const n = 10000;

  final bLength = Benchmark('Length');

  for (var i = 0; i < n; i++) {
    s.start();
    f.lengthSync();
    s.stop();
  }
  bLength.addResult('length sync', elapsed: s.elapsedMilliseconds, runs: n);
  s.reset();

  for (var i = 0; i < n; i++) {
    s.start();
    await f.length();
    s.stop();
  }
  bLength.addResult('length async', elapsed: s.elapsedMilliseconds, runs: n);
  s.reset();

  bLength.log();

  final bPos = Benchmark('RandomAccessFile.position');

  final raf = await f.open();
  final l = f.lengthSync();

  for (var i = 0; i < n; i++) {
    final p = r.nextInt(l);
    s.start();
    raf.setPositionSync(p);
    s.stop();
  }
  bPos.addResult('set sync', elapsed: s.elapsedMilliseconds, runs: n);
  s.reset();

  for (var i = 0; i < n; i++) {
    final p = r.nextInt(l);
    s.start();
    await raf.setPosition(p);
    s.stop();
  }
  bPos.addResult('set async', elapsed: s.elapsedMilliseconds, runs: n);
  s.reset();

  for (var i = 0; i < n; i++) {
    final p = r.nextInt(l);
    raf.setPositionSync(p);
    s.start();
    raf.positionSync();
    s.stop();
  }
  bPos.addResult('set sync', elapsed: s.elapsedMilliseconds, runs: n);
  s.reset();

  for (var i = 0; i < n; i++) {
    final p = r.nextInt(l);
    await raf.setPosition(p);
    s.start();
    await raf.position();
    s.stop();
  }
  bPos.addResult('set async', elapsed: s.elapsedMilliseconds, runs: n);
  s.reset();

  bPos.log();
}

Future<Directory> getPath() async {
  try {
    return await getTemporaryDirectory();
  } on Exception catch (_) {
    return Directory('./temp');
  }
}
