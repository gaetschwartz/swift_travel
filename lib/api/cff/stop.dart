class Stop {
  final String name;
  final int id;
  final  x;
  final  y;

  Stop(this.name, {this.id, this.x, this.y});

  Stop.fromMap(Map m)
      : this(
          m["name"] as String,
          id: int.parse(m["id"] as String),
          x: m["x"] ,
          y: m["y"] ,
        );
}
