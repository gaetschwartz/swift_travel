import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swift_travel/apis/data.sbb.ch/data_sbb_ch.dart';
import 'package:swift_travel/apis/search.ch/models/leg.dart';
import 'package:swift_travel/apis/search.ch/models/route_connection.dart';
import 'package:swift_travel/apis/search.ch/models/stop.dart';
import 'package:swift_travel/apis/search.ch/models/vehicle_iconclass.dart';

final liveRouteControllerProvider =
    ChangeNotifierProvider((r) => LiveRouteController(r.read(sbbDataProvider)));

@immutable
class RouteData {
  final int? currentStopIndex;
  final double? distFromCurrToNext;
  final double? distUntilExit;

  final double? portionOfLegDone;
  final double? portionFromCurrentToExit;

  final Duration? timeUntilNextLeg;

  const RouteData({
    required this.currentStopIndex,
    required this.distFromCurrToNext,
    required this.distUntilExit,
    required this.portionOfLegDone,
    required this.portionFromCurrentToExit,
    required this.timeUntilNextLeg,
  });

  const RouteData.empty()
      : currentStopIndex = null,
        distFromCurrToNext = null,
        distUntilExit = null,
        portionOfLegDone = null,
        portionFromCurrentToExit = null,
        timeUntilNextLeg = null;
}

class LiveRoutePlugin {
  const LiveRoutePlugin._();

  static const _channel = MethodChannel('gaetanschwartz.com/liveroute_plugin');

  static Future<bool?> initialize() async {
    final callback = PluginUtilities.getCallbackHandle(callbackDispatcher);
    final res =
        await _channel.invokeMethod<bool>('LiveRoute.initializeService', [callback!.toRawHandle()]);
    return res;
  }

  static void callbackDispatcher() {
    // 1. Initialize MethodChannel used to communicate with the platform portion of the plugin.
    const _backgroundChannel = MethodChannel('gaetanschwartz.com/liveroute_plugin_background');

    // 2. Setup internal state needed for MethodChannels.
    WidgetsFlutterBinding.ensureInitialized();

    // 3. Listen for background events from the platform portion of the plugin.
    _backgroundChannel.setMethodCallHandler((MethodCall call) async {
      final args = call.arguments;

      // 3.1. Retrieve callback instance for handle.
      final callback =
          PluginUtilities.getCallbackFromHandle(CallbackHandle.fromRawHandle(args[0] as int))!;

      // 3.3. Invoke callback.
      callback();
    });

    // 4. Alert plugin that the callback handler is ready for events.
    _backgroundChannel.invokeMethod('GeofencingService.initialized');
  }
}

class LiveRouteController extends ChangeNotifier {
  final SbbDataRepository sbbData;
  LiveRouteController(this.sbbData);

  StreamSubscription<Position>? _sub;

  RouteConnection? _connection;
  Position? _position;
  int? _closestLeg;
  int? _closestStop;
  bool _isReady = false;

  final Map<int, Map<int, double>> _legDistances = {};

  Map<int, Map<int, double>> get legDistances => UnmodifiableMapView(_legDistances);

  Position? get position => _position;
  RouteConnection? get connection => _connection;
  Leg? get closestLeg => isRunning && _closestLeg != null ? _connection!.legs[_closestLeg!] : null;
  Stop? get closestStop =>
      closestLeg != null && _closestStop != null ? closestLeg!.stops[_closestStop!] : null;
  bool get isReady => _isReady;
  RouteData get routeData => _routeData;

  RouteData _routeData = const RouteData.empty();

  int? _currentStop;
  int? _currentLeg;
  Leg? get currentLeg => isRunning && _currentLeg != null ? _connection!.legs[_currentLeg!] : null;
  Stop? get currentStop =>
      currentLeg != null && _currentStop != null && currentLeg!.stops.isNotEmpty
          ? currentLeg!.stops[_currentStop!]
          : null;

  Future<void> startRoute(RouteConnection connection) async {
    stopCurrentRoute(notify: false);
    _connection = connection;
    _sub =
        Geolocator.getPositionStream(intervalDuration: const Duration(seconds: 1)).listen(_update);
    await _computeMissingStops();
    notifyListeners();
  }

  void stopCurrentRoute({bool notify = true}) {
    _closestLeg = null;
    _closestStop = null;
    _connection = null;
    _currentLeg = null;
    _currentStop = null;
    _isReady = false;
    _legDistances.clear();
    _sub?.cancel();
    if (notify) notifyListeners();
  }

  bool get isRunning => _connection != null;

  static const _kDefaultDistanceThreshold = 500;
  static const _kDistanceThersholds = {
    Vehicle.bus: 100,
    Vehicle.walk: 100,
    Vehicle.tram: 100,
  };

  static int getDistanceThreshHold(Leg? leg) =>
      _kDistanceThersholds[leg?.type] ?? _kDefaultDistanceThreshold;

  void _update(Position p) {
    if (!isRunning) {
      throw StateError('Is not running ??');
    }
    _position = p;
    if (!_isReady) {
      log('Not ready, waiting for distances to be computed...');
      return;
    }
    _updateDistances(p);
    _updateData();

    final threshold = getDistanceThreshHold(currentLeg);

    if (_currentLeg == null) {
      _currentLeg = _closestLeg;
    } else if (_legDistances.containsKey(_currentLeg! + 1) &&
        _legDistances[_currentLeg! + 1]![-1]! < threshold) {
      log('We are close enough to the next leg, switching to it');
      _currentLeg = _currentLeg! + 1;
    }
    if (_currentStop == null) {
      _currentStop = _closestStop;
    } else if (_legDistances[_currentLeg!]!.containsKey(_currentStop! + 1) &&
        _legDistances[_currentLeg!]![_currentStop! + 1]! < threshold) {
      log('We are close enough to the next stop, switching to it');
      _currentStop = _currentStop! + 1;
    }

    notifyListeners();
  }

  void _updateDistances(Position p) {
    int? closestStop;
    int? closestLeg;

    var dist = double.infinity;
    for (var i = 0; i < _connection!.legs.length; i++) {
      final l = _connection!.legs[i];
      _legDistances[i] ??= {};
      if (l.lat == null || l.lon == null) continue;
      final d = Geolocator.distanceBetween(l.lat!, l.lon!, p.latitude, p.longitude);
      if (l.lat == null || l.lon == null) {
        _legDistances[i]![-1] = double.infinity;
      } else {
        _legDistances[i]![-1] = d;
      }
      if (l.stops.isNotEmpty) {
        for (var j = 0; j < l.stops.length; j++) {
          final s = l.stops[j];
          if (s.lat == null || s.lon == null) {
            _legDistances[i]![j] = double.infinity;
          } else {
            if (s.lat == null || s.lon == null) continue;
            final d = Geolocator.distanceBetween(s.lat!, s.lon!, p.latitude, p.longitude);
            _legDistances[i]![j] = d;
            if (d < dist) {
              closestLeg = i;
              closestStop = j;
              dist = d;
            }
          }
        }
      } else {
        if (d < dist) {
          closestLeg = i;
          closestStop = null;
          dist = d;
        }
      }
    }
    _closestLeg = closestLeg;
    _closestStop = closestStop;
  }

  void _updateData() {
    if (currentLeg == null) return;

    if (currentStop != null) {
      final distFromCurrToExt = Geolocator.distanceBetween(
          currentStop!.lat!, currentStop!.lon!, currentLeg!.exit!.lat!, currentLeg!.exit!.lon!);
      final distUntilExit = Geolocator.distanceBetween(
          currentLeg!.exit!.lat!, currentLeg!.exit!.lon!, position!.latitude, position!.longitude);

      final d = distUntilExit / distFromCurrToExt;
      final perc = (currentLeg!.stops.length - _currentStop! * d) / currentLeg!.stops.length;

      final timeUntilNextLeg = currentLeg!.exit!.arrival!.difference(currentStop!.departure!) * d;

      _routeData = RouteData(
        currentStopIndex: _currentStop,
        portionOfLegDone: d,
        distFromCurrToNext: distFromCurrToExt,
        distUntilExit: distUntilExit,
        portionFromCurrentToExit: perc,
        timeUntilNextLeg: timeUntilNextLeg,
      );
    } else {
      _routeData = RouteData(
        currentStopIndex: _currentStop,
        distFromCurrToNext: 0,
        distUntilExit: 0,
        portionOfLegDone: 0,
        portionFromCurrentToExit: 0,
        timeUntilNextLeg: Duration.zero,
      );
    }
  }

  Future<void> _computeMissingStops() async {
    if (!isRunning) throw StateError('Live route not running');
    log("Computing distances we didn't find");

    final legs = <Leg>[];

    for (final e in _connection!.legs) {
      legs.add(await _computeLeg(e));
    }

    _connection = _connection!.copyWith(legs: legs);
    _isReady = true;
    notifyListeners();
    log('Done computing routes');
  }

  Future<Leg> _computeLeg(Leg leg) async {
    if (leg.lat != null && leg.lon != null) {
      return leg;
    } else {
      final pos = await sbbData.getPosition(leg.name!);
      // ignore: unnecessary_null_comparison
      if (pos == null) {
        return leg;
      } else {
        return leg.copyWith(
          lat: pos.lat,
          lon: pos.long,
        );
      }
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
