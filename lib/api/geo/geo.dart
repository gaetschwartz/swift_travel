import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:swiss_travel/api/geo/models/geo_error.dart';
import 'package:swiss_travel/api/geo/models/geo_response.dart';

final geoProvider = Provider.autoDispose((ref) {
  final GeoRepository geoRepository = GeoRepository();
  ref.onDispose(geoRepository.dispose);
  return geoRepository;
});

class GeoRepository {
  static const baseUrl = "https://api3.geo.admin.ch/rest/services/api/SearchServer";
  final _client = Client();

  Future<GeoResponse> getPosition(String location) async {
    final url = "$baseUrl?type=locations&searchText=${Uri.encodeComponent(location)}";
    log(url);
    final response = await _client.get(url);
    final decoded = await compute(jsonDecode, response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return GeoResponse.fromJson(decoded);
    } else {
      throw GeoError.fromJson(decoded);
    }
  }

  void dispose() {
    _client.close();
  }
}
