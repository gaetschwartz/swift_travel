import 'package:travel_free/api/cff/stop.dart';

class Connection {
  final DateTime time;
  final String g;
  final String l;
  final String type;
  final String line;
  final String ope;
  final String number;
  final String color;
  final String typeName;
  final Stop terminal;

  Connection(
      {this.time,
      this.g,
      this.l,
      this.type,
      this.line,
      this.ope,
      this.number,
      this.color,
      this.typeName,
      this.terminal});

  Connection.fromMap(Map m)
      : this(
            time: DateTime.parse(m["time"] as String),
            g: m["*G"] as String,
            l: m["*L"] as String,
            type: m["type"] == "express_train" ? "train" : m["type"] as String,
            line: m["line"] as String,
            ope: m["operator"] as String,
            number: m["number"] as String,
            color: m["color"] as String,
            typeName: m["type_name"] as String,
            terminal: Stop.fromMap(m["terminal"] as Map));
  @override
  String toString() {
    return "time : $time\ng : $g\nl : $l\ntype : $type\nline : $line\nope : $ope\nnumber : $number\ncolor : $color\ntypeName : $typeName";
  }

  
}
