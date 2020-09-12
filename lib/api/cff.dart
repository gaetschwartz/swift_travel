import "dart:convert";
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:travel_free/api/cff/cff_stationboard.dart';
import 'package:travel_free/utils/extensions.dart';

import 'cff/cff_completion.dart';
import 'cff/cff_route.dart';
import 'cff/stop.dart';

abstract class CffBase {
  Future<List<CffCompletion>> complete(
    String string, {
    bool showCoordinates,
    bool showIds,
    bool nofavorites,
    bool filterNull,
  });

  Future<List<CffCompletion>> findStation(
    double lat,
    double lon, {
    int accuracy,
    bool showCoordinates,
    bool showIds,
  });

  Future<CffStationboard> stationboard(
    String stopName, {
    DateTime when,
    bool arrival,
    int limit,
    bool showTracks,
    bool showSubsequentStops,
    bool showDelays,
    bool showTrackchanges,
    List<TransportationTypes> transportationTypes,
  });

  Future<CffRoute> route(
    Stop departure,
    Stop arrival, {
    DateTime date,
    TimeOfDay time,
    TimeType typeTime,
  });
}

final Provider<CffBase> cffProvider = Provider<CffBase>((ref) => Cff._());

class Cff implements CffBase {
  static const QueryBuilder builder = QueryBuilder("https://timetable.search.ch/api");
  final http.Client _client = http.Client();

  Cff._();

  @override
  Future<List<CffCompletion>> complete(
    String string, {
    bool showCoordinates = false,
    bool showIds = false,
    bool nofavorites = true,
    bool filterNull = true,
  }) async {
    final uri = builder.build("completion", {
      "term": string,
      "show_ids": showIds.toInt(),
      "show_coordinates": showCoordinates.toInt(),
      "nofavorites": nofavorites.toInt()
    });

    final response = await _client.get(uri);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve completion !");
    }
    final List<Map> decode = (json.decode(response.body) as List).cast<Map>();
    final List<CffCompletion> completions = [];

    for (final Map item in decode) {
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

    final response = await _client.get(uri);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve completion !");
    }
    final completions = (json.decode(response.body) as List)
        .map<CffCompletion>((e) => CffCompletion.fromJson(e as Map<String, dynamic>))
        .toList();
    return completions;
  }

  @override
  Future<CffStationboard> stationboard(String stopName,
      {DateTime when,
      bool arrival = false,
      int limit = 0,
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
    if (when != null) print("TODO");
    final s = builder.build("stationboard", params);
    print(s);
    final response = await _client.get(s, headers: {"accept-language": "en"});
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve completion !");
    }
    return CffStationboard.fromJson(json.decode(response.body) as Map<String, dynamic>);
  }

  @override
  Future<CffRoute> route(
    Stop departure,
    Stop arrival, {
    @required DateTime date,
    @required TimeOfDay time,
    TimeType typeTime,
  }) async {
    assert(date != null && time != null);
    final params = {
      "from": departure.name,
      "to": arrival.name,
      "date": "${date.month}/${date.day}/${date.year}",
      "time": "${time.hour}:${time.minute}",
      "type_time": describeEnum(typeTime),
      "show_trackchanges": 1,
    };

    final s = builder.build("route", params);
    print("builder : $s");
    final response = await _client.get(s);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve completion !");
    }

    final map = json.decode(response.body) as Map<String, dynamic>;
    if (map["disruptions"] != null) log(map["disruptions"].toString());
    return CffRoute.fromJson(map);
  }
}

class QueryBuilder {
  final String baseUrl;

  const QueryBuilder(this.baseUrl);

  String build(String action, Map<String, dynamic> parameters) {
    String url = "$baseUrl/$action.json";
    if (parameters.isNotEmpty) {
      final String params = parameters.keys
          .map<String>((k) => "$k=${Uri.encodeComponent(parameters[k].toString())}")
          .join("&");
      url += "?$params";
    }
    return url;
  }
}

enum TransportationTypes { train, tram, bus, ship, cableway }

enum TimeType { depart, arrival }
