import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Namespace class for vibrations.
class Vibration {
  const Vibration._();

  static const MethodChannel _channel =
      MethodChannel('com.gaetanschwartz.vibration/channel');

  static Future<void> vibrate(
      {VibrationType type = VibrationType.normal,
      int duration = 500,
      List<int> pattern = const [],
      int repeat = -1,
      List<int> intensities = const [],
      int amplitude = -1}) async {
    if (kIsWeb || Platform.isAndroid) {
      return;
    }
    if (Platform.isIOS) {
      await _channel.invokeMethod<void>('vibrate', describeEnum(type));
    }
  }

  static Future<void> select() async {
    await vibrate(type: VibrationType.selection, pattern: [0, 22]);
  }

  static Future<void> selectSoft() async {
    await vibrate(type: VibrationType.soft, pattern: [0, 22]);
  }

  static Future<void> selectionLight() async {
    await vibrate(type: VibrationType.light, pattern: [0, 22]);
  }

  static Future<void> selectionMedium() async {
    await vibrate(type: VibrationType.medium, pattern: [0, 35]);
  }

  static Future<void> selectionHeavy() async {
    await vibrate(type: VibrationType.heavy, pattern: [0, 42]);
  }

  static Future<void> success() async {
    await vibrate(type: VibrationType.success, pattern: [0, 35, 100, 35]);
  }

  static Future<void> warning() async {
    await vibrate(type: VibrationType.warning, pattern: [0, 80, 50, 100]);
  }

  static Future<void> error() async {
    await vibrate(type: VibrationType.error, pattern: [0, 100, 100, 35]);
  }

  static Future<void> normal() async {
    await vibrate(duration: 400, amplitude: 1000);
  }
}

enum VibrationType {
  selection,
  light,
  medium,
  heavy,
  success,
  warning,
  error,
  normal,
  rigid,
  soft
}
