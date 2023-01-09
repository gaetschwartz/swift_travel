import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LiveRoutePlugin {
  const LiveRoutePlugin._();

  static const _channel = MethodChannel('gaetanschwartz.com/liveroute_plugin');

  static Future<bool?> initialize() async {
    final callback = PluginUtilities.getCallbackHandle(callbackDispatcher);
    final res = await _channel.invokeMethod<bool>(
        'LiveRoute.initializeService', [callback!.toRawHandle()]);
    return res;
  }

  static void callbackDispatcher() {
    // 1. Initialize MethodChannel used to communicate with the platform portion of the plugin.
    const _backgroundChannel =
        MethodChannel('gaetanschwartz.com/liveroute_plugin_background');

    // 2. Setup internal state needed for MethodChannels.
    WidgetsFlutterBinding.ensureInitialized();

    // 3. Listen for background events from the platform portion of the plugin.
    _backgroundChannel
      ..setMethodCallHandler((call) async {
        final args = call.arguments as List<Object>;

        // 3.1. Retrieve callback instance for handle.
        final callback = PluginUtilities.getCallbackFromHandle(
            CallbackHandle.fromRawHandle(args[0] as int))! as void Function();

        // 3.3. Invoke callback.
        callback();
      })
      // 4. Alert plugin that the callback handler is ready for events.
      ..invokeMethod<void>('GeofencingService.initialized');
  }
}
