import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/geo/models/sbb_models.dart';

final geoProvider = Provider((ref) => GeoRepository());

class GeoRepository {
  static const String baseUrl = 'https://data.sbb.ch/api/records/1.0/search/';
  final _client = Dio();

  Future<SbbStationResponse> getPosition(String location) async {
    final response = await _client.get(baseUrl,
        queryParameters: {
          'dataset': 'dienststellen-gemass-opentransportdataswiss',
          'rows': 5,
          'q': location,
        },
        options: Options(responseType: ResponseType.plain));
    final decoded = await compute(jsonDecode, response.toString()) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return SbbStationResponse.fromJson(decoded);
    } else {
      throw SbbStationResponse.fromJson(decoded);
    }
  }

  void dispose() {
    _client.close();
  }
}
