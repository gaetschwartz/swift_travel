import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/data.sbb.ch/models/sbb_models.dart';

import 'models/geo_models.dart';

final sbbDataProvider = Provider((ref) => SbbDataRepository());

class SbbDataRepository {
  //static const imagesBaseUrl = 'https://data.sbb.ch/explore/dataset/bilder-von-bahnhofen/files/';
  static const baseUrl = 'https://data.sbb.ch/api/records/1.0/search/';
  static const geoBaseUrl = 'https://api3.geo.admin.ch/rest/services/apis/SearchServer';

  final _client = Dio();
  final bool useCompute;

  SbbDataRepository({this.useCompute = false});

  Future<SbbStationResponse> _getSbb(String location) async {
    final response = await _client.get(baseUrl,
        queryParameters: {
          'dataset': 'dienststellen-gemass-opentransportdataswiss',
          'rows': 1,
          'q': location,
        },
        options: Options(responseType: ResponseType.plain));
    final decoded = (useCompute
        ? await compute(jsonDecode, response.data.toString())
        : jsonDecode(response.data)) as Map<String, dynamic>;

    return SbbStationResponse.fromJson(decoded);
  }

  Future<GeoResponse> _getGeo(String location) async {
    final response = await _client.get(geoBaseUrl,
        queryParameters: {
          'type': 'locations',
          'searchText': location,
        },
        options: Options(responseType: ResponseType.plain));
    final decoded = (useCompute
        ? await compute(jsonDecode, response.data.toString())
        : jsonDecode(response.data)) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return GeoResponse.fromJson(decoded);
    } else {
      return GeoResponse.empty();
    }
  }

  Future<LatLong> getPosition(String name) async {
    final split = name.split(',');
    for (var i = split.length; i >= 0; i--) {
      final n = split.sublist(i).join();
      final pos = await _getGeo(n);
      if (pos.results.isNotEmpty) return LatLong.fromGeoAttr(pos.results.first.attrs);
      final pos2 = await _getSbb(n);
      if (pos2.records.isNotEmpty) {
        return LatLong.fromCoordinates(pos2.records.first.geometry.coordinates);
      }
    }
    return null;
  }

  void dispose() => _client.close();
}
