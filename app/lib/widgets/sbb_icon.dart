import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';

class SbbIcon extends StatelessWidget {
  const SbbIcon(
    this.vehicle, {
    this.size,
    this.color,
    Key? key,
  }) : super(key: key);

  SbbIcon.fromIconClass(String? iconclass, {this.size, this.color, Key? key})
      : vehicle = getVehicle(iconclass),
        super(key: key);

  static Vehicle? getVehicle(String? iconclass) {
    if (iconclass == null) {
      return null;
    }
    final substring = iconclass.substring(iconclass.lastIndexOf('-') + 1);
    return VehicleX.parse(substring);
  }

  final Vehicle? vehicle;
  final double? size;
  final Color? color;

  Widget getIcon(Vehicle? v) {
    switch (v) {
      case Vehicle.bus:
        return const FaIcon(FontAwesomeIcons.bus);
      case Vehicle.post:
      case Vehicle.nightBus:
        return const FaIcon(FontAwesomeIcons.busAlt);
      case Vehicle.tram:
        return const FaIcon(FontAwesomeIcons.subway);
      case Vehicle.walk:
        return const FaIcon(FontAwesomeIcons.walking);
      case Vehicle.strain:
      case Vehicle.train:
      case Vehicle.expressTrain:
      case Vehicle.funicular:
      case Vehicle.rer:
      case Vehicle.str:
      case Vehicle.metro:
        return const FaIcon(FontAwesomeIcons.train);
      case Vehicle.business:
        return const FaIcon(FontAwesomeIcons.store);
      case Vehicle.address:
        return const FaIcon(FontAwesomeIcons.home);
      case Vehicle.private:
        return const FaIcon(FontAwesomeIcons.building);
      case Vehicle.gondola:
      case Vehicle.ship:
        return const FaIcon(FontAwesomeIcons.ship);
      case Vehicle.cablecar:
      case Vehicle.chairlift:
        return const FaIcon(FontAwesomeIcons.tram);
      case null:
      case Vehicle.unknown:
        return const FaIcon(FontAwesomeIcons.question);
    }
  }

  @override
  Widget build(BuildContext context) => IconTheme(
        data: IconTheme.of(context).copyWith(size: size, color: color),
        child: getIcon(vehicle),
      );
}
