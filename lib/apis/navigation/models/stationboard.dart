mixin Staionboard {}

mixin Stop {
  String get name;
  String? get id;
  String? get stopid;
  DateTime? get departure;
  double? get lat;
  double? get lon;
}
