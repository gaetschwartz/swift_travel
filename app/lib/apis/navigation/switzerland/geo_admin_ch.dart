import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

import 'models/geo_admin.dart';

/// https://api3.geo.admin.ch/services/sdiservices.html#search
class GeoAdminEngine implements NavigationCompletionDelegateApi {
  final _client = http.Client();

  /// Completes with a [GeoAdminResult] object.
  ///
  /// See also https://api3.geo.admin.ch/services/sdiservices.html#search
  @override
  Future<List<GeoAdminResult>> complete(
    final String query, {
    bool showCoordinates = true,
    bool showIds = true,
    LocationType locationType = LocationType.any,
  }) async {
    if (query.isEmpty) {
      return [];
    }
    final uri = Uri.https('api3.geo.admin.ch',
        '/rest/services/api/SearchServer', <String, dynamic>{
      'searchText': query,
      'type': 'locations',
      'sr': '4326',
    });
    if (kDebugMode) print(uri);
    final resp = await http.get(uri, headers: {'accept-language': 'fr-CH'});
    if (resp.statusCode != 200) {
      throw GeoAdminEngineException(
          '${resp.statusCode} (${resp.reasonPhrase})');
    }
    final parsed = jsonDecode(resp.body) as Map;
    final results = parsed['results'] as List<dynamic>;
    return results
        .cast<Map<dynamic, dynamic>>()
        .map((final e) => GeoAdminResult.fromJson(e.cast<String, dynamic>()))
        .toList();
  }

  Future<List<NavigationCompletion>> find(
    double lat,
    double lon, {
    int accuracy = 100,
    bool showCoordinates = true,
  }) async {
    // we need to compute a bounding box that is bigger than the accuracy (in meters) with center at lat, lon

    const converter = WGS84ToLV03Converter();

    // we need to compute a bounding box that is bigger than the accuracy (in meters) with center at lat, lon and convert it to LV03
    final deltaLat = accuracy / 111111;
    final deltaLon = accuracy / (111111 * math.cos(lat * math.pi / 180));

    final lv03_1 = converter.convert(LatLon(lat - deltaLat, lon - deltaLon));
    final lv03_2 = converter.convert(LatLon(lat + deltaLat, lon + deltaLon));

    final bbox = '${lv03_1.x},${lv03_1.y},${lv03_2.x},${lv03_2.y}';
    final uri = Uri.https('api3.geo.admin.ch',
        '/rest/services/api/SearchServer', <String, dynamic>{
      'sortbbox': 'true',
      'bbox': bbox,
      'type': 'locations',
      'sr': '21781',
    });
    if (kDebugMode) print(uri);
    final resp = await http.get(uri, headers: {'accept-language': 'fr-CH'});
    if (resp.statusCode != 200) {
      throw GeoAdminEngineException(
          '${resp.statusCode} (${resp.reasonPhrase})');
    }
    final parsed = jsonDecode(resp.body) as Map;
    final results = parsed['results'] as List<dynamic>;
    return results
        .cast<Map<dynamic, dynamic>>()
        .map((final e) => GeoAdminResult.fromJson(e.cast<String, dynamic>()))
        .toList();
  }

  @override
  void dispose() {
    _client.close();
  }
}

class GeoAdminEngineException implements Exception {
  final String message;

  GeoAdminEngineException(this.message);

  @override
  String toString() => 'GeoAdminEngineException: $message';
}
