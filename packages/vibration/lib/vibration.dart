library vibration;

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Namespace class for vibrations.
class Vibration {
  const Vibration._();

  static late final instance = Vibration._();

  static const MethodChannel _channel = MethodChannel('com.gaetschwartz.vibration/channel');

  Future<void> vibrate({
    required VibrationType type,
    @Deprecated("Android is deprecated") int duration = 500,
    @Deprecated("Android is deprecated") int repeat = -1,
    @Deprecated("Android is deprecated") List<int> intensities = const [],
    @Deprecated("Android is deprecated") int amplitude = -1,
  }) async {
    if (kIsWeb || Platform.isAndroid) {
      return;
    }

    if (Platform.isIOS) {
      await _channel.invokeMethod<void>('vibrate', describeEnum(type));
    }
  }

  void select() {
    vibrate(type: VibrationType.selection);
  }

  void selectSoft() {
    vibrate(type: VibrationType.soft);
  }

  void selectionLight() {
    vibrate(type: VibrationType.light);
  }

  void selectionMedium() {
    vibrate(type: VibrationType.medium);
  }

  void selectionHeavy() {
    vibrate(type: VibrationType.heavy);
  }

  void success() {
    vibrate(type: VibrationType.success);
  }

  void warning() {
    vibrate(type: VibrationType.warning);
  }

  void error() {
    vibrate(type: VibrationType.error);
  }

  void normal() {
    vibrate(type: VibrationType.normal);
  }
}

enum VibrationType { selection, light, medium, heavy, success, warning, error, normal, rigid, soft }

/*  static _patterns(VibrationType type) {
    const medium = [0, 35];
    switch (type) {
      case VibrationType.selection:
        return [0, 22];
      case VibrationType.light:
        return [0, 22];
      case VibrationType.medium:
        return medium;

      case VibrationType.heavy:
        return [0, 42];
      case VibrationType.success:
        return [0, 35, 100, 35];
      case VibrationType.warning:
        return [0, 80, 50, 100];
      case VibrationType.error:
        return [0, 100, 100, 35];
      case VibrationType.soft:
        return [0, 22];
      case VibrationType.normal:
        return [];
      case VibrationType.rigid:
        return medium;
    } 
  }*/
