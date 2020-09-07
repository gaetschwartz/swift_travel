import 'package:flutter/cupertino.dart';

@immutable
class Stop {
  final String name;
  final int id;
  final int x;
  final int y;

  const Stop(this.name, {this.id, this.x, this.y});

  Stop.fromMap(Map m)
      : this(
          m["name"] as String,
          id: m["id"] != null ? int.parse(m["id"] as String) : null,
          x: m["x"] as int,
          y: m["y"] as int,
        );
}
