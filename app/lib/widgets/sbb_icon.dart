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

  static PlaceType? getVehicle(String? iconclass) {
    if (iconclass == null) {
      return null;
    }
    final substring = iconclass.substring(iconclass.lastIndexOf('-') + 1);
    return TransportationModeX.parse(substring);
  }

  final PlaceType? vehicle;
  final double? size;
  final Color? color;

  @allowReturningWidgets
  Widget getIcon(PlaceType? v) {
    switch (v) {
      case PlaceType.bus:
        return const FaIcon(FontAwesomeIcons.bus);
      case PlaceType.post:
      case PlaceType.nightBus:
        return const FaIcon(FontAwesomeIcons.busSimple);
      case PlaceType.tram:
        return const FaIcon(FontAwesomeIcons.trainSubway);
      case PlaceType.walk:
        return const FaIcon(FontAwesomeIcons.personWalking);
      case PlaceType.strain:
      case PlaceType.train:
      case PlaceType.expressTrain:
      case PlaceType.funicular:
      case PlaceType.rer:
      case PlaceType.str:
      case PlaceType.metro:
      case PlaceType.nightStrain:
        return const FaIcon(FontAwesomeIcons.train);
      case PlaceType.business:
        return const FaIcon(FontAwesomeIcons.store);
      case PlaceType.address:
        return const FaIcon(FontAwesomeIcons.house);
      case PlaceType.private:
        return const FaIcon(FontAwesomeIcons.building);
      case PlaceType.gondola:
      case PlaceType.ship:
        return const FaIcon(FontAwesomeIcons.ship);
      case PlaceType.cablecar:
      case PlaceType.chairlift:
        return const FaIcon(FontAwesomeIcons.trainTram);
      case null:
      case PlaceType.unknown:
        return const FaIcon(FontAwesomeIcons.question);
    }
  }

  @override
  Widget build(BuildContext context) => IconTheme(
        data: IconTheme.of(context).copyWith(size: size, color: color),
        child: getIcon(vehicle),
      );
}
