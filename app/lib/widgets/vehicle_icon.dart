import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/utils/definitions.dart';

class VehicleIcon extends StatelessWidget {
  const VehicleIcon(
    this.vehicle, {
    this.size,
    this.color,
    super.key,
  });

  final VehicleType? vehicle;
  final double? size;
  final Color? color;

  @allowReturningWidgets
  Widget getIcon(VehicleType? v) {
    switch (v) {
      case VehicleType.bus:
        return const FaIcon(FontAwesomeIcons.bus);
      case VehicleType.post:
      case VehicleType.nightBus:
        return const FaIcon(FontAwesomeIcons.busSimple);
      case VehicleType.tram:
        return const FaIcon(FontAwesomeIcons.trainSubway);
      case VehicleType.walk:
        return const FaIcon(FontAwesomeIcons.personWalking);
      case VehicleType.strain:
      case VehicleType.train:
      case VehicleType.expressTrain:
      case VehicleType.funicular:
      case VehicleType.rer:
      case VehicleType.str:
      case VehicleType.metro:
      case VehicleType.nightStrain:
        return const FaIcon(FontAwesomeIcons.train);
      case VehicleType.business:
        return const FaIcon(FontAwesomeIcons.store);
      case VehicleType.gondola:
      case VehicleType.ship:
        return const FaIcon(FontAwesomeIcons.ship);
      case VehicleType.cablecar:
      case VehicleType.chairlift:
        return const FaIcon(FontAwesomeIcons.trainTram);
      case VehicleType.address:
        return const FaIcon(FontAwesomeIcons.house);
      case null:
      case VehicleType.unknown:
        return const FaIcon(FontAwesomeIcons.question);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconTheme.of(context).copyWith(size: size, color: color),
      child: getIcon(vehicle),
    );
  }
}

class LocationTypeIcon extends StatelessWidget {
  const LocationTypeIcon(
    this.place, {
    this.size,
    this.color,
    super.key,
  });

  final LocationType? place;
  final double? size;
  final Color? color;

  @allowReturningWidgets
  Widget getIcon(LocationType? p) {
    switch (p) {
      case LocationType.address:
        return const FaIcon(FontAwesomeIcons.house);
      case LocationType.business:
        return const FaIcon(FontAwesomeIcons.store);
      case LocationType.station:
        return const FaIcon(FontAwesomeIcons.train);
      case null:
      case LocationType.unknown:
        return const FaIcon(FontAwesomeIcons.question);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconTheme.of(context).copyWith(size: size, color: color),
      child: getIcon(place),
    );
  }
}
