import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:models/cff/types_enum.dart';
import 'package:models/cff/vehicle_iconclass.dart';

class CffIcon extends StatelessWidget {
  const CffIcon(
    this.vehicle, {
    this.size,
    this.color,
    Key key,
  }) : super(key: key);

  CffIcon.fromIconClass(String iconclass, {this.size, this.color, Key key})
      : vehicle = getVehicle(iconclass),
        super(key: key);

  static Vehicle getVehicle(String iconclass) {
    if (iconclass == null) return null;
    final substring = iconclass.substring(iconclass.lastIndexOf('-') + 1);
    return VehicleIconclass.fromJson({'v': substring}).v;
  }

  final Vehicle vehicle;
  final double size;
  final Color color;

  static Widget getIcon(Vehicle v) {
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
        return const FaIcon(FontAwesomeIcons.train);
      case Vehicle.business:
        return const FaIcon(FontAwesomeIcons.store);
      case Vehicle.adr:
        return const FaIcon(FontAwesomeIcons.home);
      case Vehicle.private:
        return const FaIcon(FontAwesomeIcons.building);
      case Vehicle.gondola:
      case Vehicle.ship:
        return const FaIcon(FontAwesomeIcons.ship);
      case Vehicle.cablecar:
      case Vehicle.chairlift:
        return const FaIcon(FontAwesomeIcons.tram);
      case Vehicle.favorite:
        return const FaIcon(FontAwesomeIcons.solidStar);
    }

    log('Unknown icon type : `$v`');
    return const FaIcon(FontAwesomeIcons.question);
  }

  static const List<String> _privatePlaces = ['adr', 'business', 'private'];

  static bool isPrivate(String s) =>
      s != null && _privatePlaces.contains(s.substring(s.lastIndexOf('-') + 1));

  @override
  Widget build(BuildContext context) => IconTheme(
        data: IconTheme.of(context).copyWith(size: size, color: color),
        child: getIcon(vehicle),
      );
}
