import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:swift_travel/apis/navigation/navigation.dart';

import 'models/geo_admin.dart';

final geoAdminEngine = Provider<GeoAdminEngine>((final r) {
  final engine = GeoAdminEngine();
  r.onDispose(engine.dispose);
  return engine;
});

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
  }) async {
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
    final results = parsed["results"] as List<dynamic>;
    return results
        .cast<Map>()
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
