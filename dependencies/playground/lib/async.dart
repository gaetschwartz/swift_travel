import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:swift_travel/mocking/mocking.dart';

void isolateWork<Q>(SendPort message, Q q) {
  message.send(computation(q as double));
}

double computation(double input) {
  var i = input;
  while (i > 10) {
    i = i * 0.9;
  }
  return i;
}

Future<T> time<R, T>(FutureOr<T> Function(R) f, R input, {String name = 'Unnamed function'}) async {
  final w = Stopwatch()..start();
  final o = await f(input);
  w.stop();
  print('[$name] executed in ${w.elapsedMilliseconds} ms');
  return o;
}

dynamic encodeDecode(dynamic o) => jsonDecode(jsonEncode(o));
Future<void> main(List<String> arguments) async {
  final data = List.generate(10000, (i) => mockRoute);
  await time(encodeDecode, data, name: 'regular');
  await time((q) => compute(encodeDecode, mockRoute as Map), data, name: 'compute');

  // await time<double, double>((q) => computeIsolate(isolateWork, q), double.maxFinite,
  //     name: 'isolate');
  // await time<double, double>((q) => compute(computation, q), double.maxFinite, name: 'compute');
}

Future<R> computeIsolate<Q, R extends Object?>(void Function(SendPort port) workLoad) async {
  final rcvPort = ReceivePort();
  final isolate = await Isolate.spawn(workLoad, rcvPort.sendPort);

  final val = await rcvPort.first as R;

  isolate.kill();

  return val;
}
