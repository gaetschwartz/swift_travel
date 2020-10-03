import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:swiss_travel/api/cff/cff.dart';
import 'package:swiss_travel/api/cff/models/cff_completion.dart';
import 'package:swiss_travel/api/cff/models/cff_route.dart';
import 'package:swiss_travel/api/cff/models/cff_stationboard.dart';
import 'package:swiss_travel/api/cff/models/stop.dart';

final Provider<CffBase> cffProvider = Provider<CffBase>((ref) => CffRepository._());

class CffRepository implements CffBase {
  static const CffQueryBuilder builder = CffQueryBuilder("https://timetable.search.ch/api");
  final http.Client _client = http.Client();

  CffRepository._();

  Map<String, String> headers = {"accept-language": "en"};

  @override
  Future<List<CffCompletion>> complete(
    String string, {
    bool showCoordinates = false,
    bool showIds = false,
    bool noFavorites = true,
    bool filterNull = true,
  }) async {
    final uri = builder.build("completion", {
      "show_ids": showIds.toInt(),
      "show_coordinates": showCoordinates.toInt(),
      "nofavorites": noFavorites.toInt(),
      "term": string,
    });
    log(uri);

    final response = await _client.get(uri, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve completion : ${response.body}");
    }
    final decode = await compute(jsonDecode, response.body) as Map<String, dynamic>;

    final List<Map> list = (decode as List).cast<Map>();
    final List<CffCompletion> completions = [];

    for (final Map item in list) {
      if (!filterNull || item["label"] != null) {
        completions.add(CffCompletion.fromJson(item as Map<String, dynamic>));
      }
    }

    return completions;
  }

  @override
  Future<List<CffCompletion>> findStation(
    double lat,
    double lon, {
    int accuracy = 10,
    bool showCoordinates = true,
    bool showIds = false,
  }) async {
    final uri = builder.build("completion", {
      "latlon": "$lat,$lon",
      "accuracy": accuracy,
      "show_ids": showIds.toInt(),
      "show_coordinates": showCoordinates.toInt()
    });
    log(uri);
    final response = await _client.get(uri, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't find station : ${response.body}");
    }
    final decode = await compute(jsonDecode, response.body) as List;

    final completions = decode
        .map<CffCompletion>((e) => CffCompletion.fromJson(e as Map<String, dynamic>))
        .toList();
    return completions;
  }

  @override
  Future<CffStationboard> stationboard(String stopName,
      {DateTime when,
      bool arrival = false,
      int limit = 32,
      bool showTracks = false,
      bool showSubsequentStops = false,
      bool showDelays = false,
      bool showTrackchanges = false,
      List<TransportationTypes> transportationTypes = const []}) async {
    final params = {
      "stop": stopName,
      "limit": limit,
      "show_tracks": showTracks.toInt(),
      "show_subsequent_stops": showSubsequentStops.toInt(),
      "show_delays": showDelays.toInt(),
      "show_trackchanges": showTrackchanges.toInt(),
      "mode": arrival ? "arrival" : "depart"
    };
    if (transportationTypes.isNotEmpty) {
      params["transportation_types"] = transportationTypes.join(",");
    }
    if (when != null) throw UnimplementedError("Todo");
    final s = builder.build("stationboard", params);
    log(s);
    final response = await _client.get(s, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve stationboard : ${response.body}");
    }
    final decode = await compute(jsonDecode, response.body) as Map<String, dynamic>;

    return CffStationboard.fromJson(decode);
  }

  @override
  Future<CffRoute> route(
    Stop departure,
    Stop arrival, {
    @required DateTime date,
    @required TimeOfDay time,
    TimeType typeTime = TimeType.depart,
  }) async {
    assert(date != null && time != null);
    final params = {
      "from": departure.name,
      "to": arrival.name,
      "date": "${date.month}/${date.day}/${date.year}",
      "time": "${time.hour}:${time.minute}",
      "time_type": describeEnum(typeTime),
      "show_trackchanges": 1,
    };

    final s = builder.build("route", params);
    log("builder : $s");
    return rawRoute(s);
  }

  @override
  Future<CffRoute> rawRoute(String query) async {
    final response = await _client.get(query, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve raw route : ${response.body}");
    }
    final map = await compute(jsonDecode, response.body) as Map<String, dynamic>;

    if (map["disruptions"] != null) log(map["disruptions"].toString());
    map["requestUrl"] = query;
    return CffRoute.fromJson(map);
  }
}

class CffQueryBuilder {
  final String baseUrl;

  const CffQueryBuilder(this.baseUrl);

  String build(String action, Map<String, dynamic> parameters) {
    String url = "$baseUrl/$action.json";
    if (parameters.isNotEmpty) {
      final String params = parameters.keys.map<String>((k) => "$k=${parameters[k]}").join("&");
      url += "?$params";
    }
    return Uri.encodeFull(url);
  }
}

enum TransportationTypes { train, tram, bus, ship, cableway }

enum TimeType { depart, arrival }

extension BoolX on bool {
  int toInt() => this ? 1 : 0;
}
