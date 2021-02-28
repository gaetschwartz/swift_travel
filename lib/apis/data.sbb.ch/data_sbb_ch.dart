import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:swift_travel/utils/models/coordinates.dart';

import 'models/geo_models.dart';
import 'models/sbb_models.dart';

final sbbDataProvider = Provider((ref) => SbbDataRepository());

class SbbDataRepository {
  SbbDataRepository();

  final _client = http.Client();

  Future<SbbStationResponse> _getSbb(String location) async {
    final queryParameters = {
      'dataset': 'dienststellen-gemass-opentransportdataswiss',
      'rows': 1,
      'q': location,
    };
    final response =
        await _client.get(Uri.https('data.sbb.ch', '/api/records/1.0/search/', queryParameters));
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;

    return SbbStationResponse.fromJson(decoded);
  }

  Future<GeoResponse> _getGeo(String location) async {
    final queryParameters = {
      'type': 'locations',
      'searchText': location,
    };

    final response = await _client
        .get(Uri.https('api3.geo.admin.ch', '/rest/services/apis/SearchServer', queryParameters));
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return GeoResponse.fromJson(decoded);
    } else {
      return GeoResponse.empty();
    }
  }

  Future<LatLon?> getPosition(String name) async {
    final split = name.split(',');
    for (var i = split.length; i >= 0; i--) {
      final n = split.sublist(i).join();
      final pos = await _getGeo(n);
      if (pos.results.isNotEmpty) {
        return LatLon.fromGeoAttr(pos.results.first.attrs!);
      }
      final pos2 = await _getSbb(n);
      if (pos2.records!.isNotEmpty) {
        return LatLon.fromList(pos2.records!.first.geometry!.coordinates!);
      }
    }
    return null;
  }

  void dispose() => _client.close();
}
