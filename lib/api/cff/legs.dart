import 'package:travel_free/api/cff/stop.dart';

class Legs {
  final String type;
  final String track;
  final String terminal;
  final String fgcolor;
  final String number;
  final String bgcolor;
  final String tripid;
  final Map<String, dynamic> exit;
  final int runningtime;
  final String stopid;
  final String line;
  final List<Stop> stops;
  final String sbbName;
  final String name;
  final String departure;
  final DateTime arrival;
  final int normalTime;
  final int waittime;

  Legs(
      {this.type,
      this.track,
      this.terminal,
      this.fgcolor,
      this.number,
      this.bgcolor,
      this.tripid,
      this.exit,
      this.runningtime,
      this.stopid,
      this.line,
      this.stops,
      this.sbbName,
      this.name,
      this.departure,
      this.arrival,
      this.normalTime,
      this.waittime});

  Legs.fromMap(Map m)
      : this(
            type: m["type"] as String,
            track: m["track"] as String,
            terminal: m["terminal"] as String,
            fgcolor: m["fgcolor"] as String,
            number: m["number"] as String,
            bgcolor: m["bgcolor"] as String,
            tripid: m["tripid"] as String,
            exit: m["exit"] as Map<String, dynamic>,
            runningtime: m["runningtime"] as int,
            stopid: m["stopid"] as String,
            line: m["line"] as String,
            stops: m["stops"] !=null ? (m["stops"] as List).map((f) => Stop.fromMap(f as Map)).toList() : null,
            sbbName: m["sbb_name"] as String,
            name: m["name"] as String,
            departure: m["departure"] as String,
            arrival: m["arrival"] != null ? DateTime.parse(m["arrival"] as String): null,
            normalTime: m["normal_time"] as int,
            waittime: m["waittime"] as int);
}
