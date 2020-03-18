import "dart:convert";

import 'package:http/http.dart' as http;
import 'package:travel_free/api/cff/completions.dart';
import 'package:travel_free/api/cff/route.dart';
import 'package:travel_free/api/cff/timetable.dart';
import 'package:travel_free/utils/extensions.dart';

import 'cff/stop.dart';

class CFF {
  static final QueryBuilder builder =
      QueryBuilder("https://timetable.search.ch/api");
  final http.Client _client = http.Client();

  Future<List<Completion>> complete(String string,
      {bool showCoordinates = false,
      bool showIds = false,
      bool nofavorites = false}) async {
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
        .map<Completion>((e) => Completion.fromMap(e as Map))
        .toList();
    return completions;
  }

  Future<List<StationCompletion>> findStation(double lat, double lon,
      {int accuracy = 10,
      bool showCoordinates = false,
      bool showIds = false}) async {
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
        .map<StationCompletion>((e) => StationCompletion.fromMap(e as Map))
        .toList();
    return completions;
  }

  Future<TimeTable> timetable(Stop stop,
      {DateTime when,
      bool arrival = false,
      int limit = 0,
      bool showTracks = false,
      bool showSubsequentStops = false,
      bool showDelays = false,
      bool showTrackchanges = false,
      List<String> transportationTypes = const []}) async {
    final params = {
      "stop": stop.name,
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
    return TimeTable.fromMap(json.decode(response.body) as Map);
  }

  Future<Itinerary> route(Stop departure, Stop arrival,
      {DateTime when, String typeTime}) async {
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
    final response = await _client.get(builder.build("route", params));
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve completion !");
    }
    //print(response.body);

    return Itinerary.fromMap(json.decode(response.body) as Map);
  }
}

class QueryBuilder {
  final String baseUrl;

  QueryBuilder(this.baseUrl);

  String build(String work, Map<String, dynamic> parameters) {
    String url = "$baseUrl/$work.json";
    if (parameters.isNotEmpty) {
      final String params = parameters.keys
          .map<String>((key) =>
              "$key=${Uri.encodeComponent(parameters[key].toString())}")
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
