import "dart:convert";

import 'package:http/http.dart' as http;
import 'package:travel_free/api/cff/cff_route.dart';
import 'package:travel_free/api/cff/cff_stationboard.dart';
import 'package:travel_free/api/cff/completion.dart';
import 'package:travel_free/utils/extensions.dart';

import 'cff/stop.dart';

abstract class CFFBase {
  Future<List<Completion>> complete(
    String string, {
    bool showCoordinates = false,
    bool showIds = false,
    bool nofavorites = false,
  });

  Future<List<Completion>> findStation(
    double lat,
    double lon, {
    int accuracy = 10,
    bool showCoordinates = false,
    bool showIds = false,
  });

  Future<CffStationboard> timetable(
    String stopName, {
    DateTime when,
    bool arrival = false,
    int limit = 0,
    bool showTracks = false,
    bool showSubsequentStops = false,
    bool showDelays = false,
    bool showTrackchanges = false,
    List<String> transportationTypes = const [],
  });

  Future<CffRoute> route(Stop departure, Stop arrival, {DateTime when, String typeTime});
}

class CFF implements CFFBase {
  static const QueryBuilder builder = QueryBuilder("https://timetable.search.ch/api");
  final http.Client _client = http.Client();

  @override
  Future<List<Completion>> complete(String string,
      {bool showCoordinates = false, bool showIds = false, bool nofavorites = false}) async {
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
    final completions = (json.decode(response.body) as List)
        .map<Completion>((e) => Completion.fromJson(e as Map<String, dynamic>))
        .toList();
    return completions;
  }

  @override
  Future<List<Completion>> findStation(double lat, double lon,
      {int accuracy = 10, bool showCoordinates = false, bool showIds = false}) async {
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
        .map<Completion>((e) => Completion.fromJson(e as Map<String, dynamic>))
        .toList();
    return completions;
  }

  @override
  Future<CffStationboard> timetable(String stopName,
      {DateTime when,
      bool arrival = false,
      int limit = 0,
      bool showTracks = false,
      bool showSubsequentStops = false,
      bool showDelays = false,
      bool showTrackchanges = false,
      List<String> transportationTypes = const []}) async {
    final params = {
      "stop": stopName,
      'limit': limit,
      "show_tracks": showTracks.toInt(),
      "show_subsequent_stops": showSubsequentStops.toInt(),
      "show_delays": showDelays.toInt(),
      "show_trackchanges": showTrackchanges.toInt(),
      "mode": arrival ? "arrival" : "depart"
    };
    if (transportationTypes.isNotEmpty) {
      params["transportation_types"] = transportationTypes.join(", ");
    }
    if (when != null) print("TODO");
    final s = builder.build("stationboard", params);
    final response = await _client.get(s);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve completion !");
    }
    return CffStationboard.fromJson(json.decode(response.body) as Map<String, dynamic>);
  }

  @override
  Future<CffRoute> route(Stop departure, Stop arrival, {DateTime when, String typeTime}) async {
    if (when == null) throw StateError("Departure must not be null");
    final params = {
      "from": departure.name,
      'to': arrival.name,
      'date': "${when.month}/${when.day}/${when.year}",
      'time': "${when.hour}:${when.minute}",
      "type_time": typeTime,
      "show_trackchanges": 1,
    };

    final s = builder.build("route", params);
    print("builder : $s");
    final response = await _client.get(s);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve completion !");
    }

    return CffRoute.fromJson(json.decode(response.body) as Map<String, dynamic>);
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

abstract class TransportationTypes {
  static const String train = "train";
  static const String tram = "tram";
  static const String bus = "bus";
  static const String ship = "ship";
  static const String cableway = "cableway";
}
