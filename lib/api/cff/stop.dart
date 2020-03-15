class Stop {
  final String name;
  final int id;
  final x;
  final y;

  Stop(this.name, {this.id, this.x, this.y});

  Stop.fromMap(Map m)
      : this(
          m["name"] as String,
          id: m["id"] != null ? int.parse(m["id"] as String) : null,
          x: m["x"],
          y: m["y"],
        );
}
