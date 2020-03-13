class Stop {
  final String name;
  final int id;
  final int x;
  final int y;

  Stop(this.name, {this.id, this.x, this.y});

  Stop.fromMap(Map m)
      : this(
          m["name"] as String,
          id: int.parse(m["id"] as String),
          x: int.parse(m["id"] as String),
          y: int.parse(m["id"] as String),
        );
}
