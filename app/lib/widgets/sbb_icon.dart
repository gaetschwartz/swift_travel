import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/utils/definitions.dart';

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

  static TransportationMode? getVehicle(String? iconclass) {
    if (iconclass == null) {
      return null;
    }
    final substring = iconclass.substring(iconclass.lastIndexOf('-') + 1);
    return TransportationModeX.parse(substring);
  }

  final TransportationMode? vehicle;
  final double? size;
  final Color? color;

  @allowReturningWidgets
  Widget getIcon(TransportationMode? v) {
    switch (v) {
      case TransportationMode.bus:
        return const FaIcon(FontAwesomeIcons.bus);
      case TransportationMode.post:
      case TransportationMode.nightBus:
        return const FaIcon(FontAwesomeIcons.busAlt);
      case TransportationMode.tram:
        return const FaIcon(FontAwesomeIcons.subway);
      case TransportationMode.walk:
        return const FaIcon(FontAwesomeIcons.walking);
      case TransportationMode.strain:
      case TransportationMode.train:
      case TransportationMode.expressTrain:
      case TransportationMode.funicular:
      case TransportationMode.rer:
      case TransportationMode.str:
      case TransportationMode.metro:
      case TransportationMode.nightStrain:
        return const FaIcon(FontAwesomeIcons.train);
      case TransportationMode.business:
        return const FaIcon(FontAwesomeIcons.store);
      case TransportationMode.address:
        return const FaIcon(FontAwesomeIcons.home);
      case TransportationMode.private:
        return const FaIcon(FontAwesomeIcons.building);
      case TransportationMode.gondola:
      case TransportationMode.ship:
        return const FaIcon(FontAwesomeIcons.ship);
      case TransportationMode.cablecar:
      case TransportationMode.chairlift:
        return const FaIcon(FontAwesomeIcons.tram);
      case null:
      case TransportationMode.unknown:
        return const FaIcon(FontAwesomeIcons.question);
    }
  }

  @override
  Widget build(BuildContext context) => IconTheme(
        data: IconTheme.of(context).copyWith(size: size, color: color),
        child: getIcon(vehicle),
      );
}
