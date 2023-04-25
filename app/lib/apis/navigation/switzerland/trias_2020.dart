import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:gaets_logging/logging.dart';
import 'package:http/http.dart' as http;
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/trias.dart';
import 'package:xml/xml.dart';

/// https://opentransportdata.swiss/en/cookbook/departurearrival-display/
class Trias2020Api implements NavigationCompletionDelegateApi {
  final String apiKey;
  final client = http.Client();

  Trias2020Api(this.apiKey);

  final log = Logger('Trias2020Api');

  @override
  Future<List<NavigationCompletion>> complete(
    String query, {
    bool showCoordinates = true,
    bool showIds = true,
    LocationType? locationType,
  }) async {
    final url = Uri.https('api.opentransportdata.swiss', 'trias2020');
    final search = const Trias2020RequestBuilder().search(_LocationName(query));
    if (kDebugMode) {
      log.i('Querying $url with $search');
    }
    final res = await client.post(
      url,
      headers: {
        'Authorization': apiKey,
        'Content-Type': 'text/xml',
      },
      body: search,
    );
    final body = utf8.decode(res.bodyBytes);
    final locations = parseLocations(body);
    return locations.whereUniqueNullableProperty((e) => e.id).toList();
  }

  static Iterable<TriasLocation> parseLocations(String xml) {
    final xmlDocument = XmlDocument.parse(xml);
    final locations = xmlDocument['trias:Trias']?['trias:ServiceDelivery']
                ?['trias:DeliveryPayload']?['trias:LocationInformationResponse']
            ?.findElements('trias:Location') ??
        [];
    final completions = locations.map((loc) {
      final location = loc['trias:Location']!;
      final geo = location['trias:GeoPosition']!;

      final stopPoint = location['trias:StopPoint'];
      if (stopPoint != null) {
        return _parseStopPoint(stopPoint, loc, geo);
      }

      final stopPlace = location['trias:StopPlace'];
      if (stopPlace != null) {
        return _parseStopPlace(stopPlace, loc, geo);
      }

      throw Exception('Unknown location type');
    });

    return completions;
  }

  static TriasLocation _parseStopPlace(
      XmlElement stopPlace, XmlElement loc, XmlElement geo) {
    final name = stopPlace['trias:StopPlaceName']?.getTriasText()?.innerText;
    final id = stopPlace['trias:StopPlaceRef']?.innerText;

    final probability = _parseDouble(loc['trias:Probability']?.innerText);
    final complete = loc['trias:Complete']?.innerText == 'true';

    final modes = loc.findElements('trias:Mode').map((e) {
      final mode = e['trias:PtMode']!.innerText;
      final submode = e.childElements
          .where(
            (e) =>
                e.name.qualified != 'trias:PtMode' &&
                e.name.local.contains('Submode'),
          )
          .firstOrNull
          ?.innerText;
      return TriasPtMode(mode, submode);
    }).toList();

    return TriasLocation(
      stopPointName: name,
      stopPointRef: id,
      geoPosition: TriasGeoPosition.fromXML(geo),
      complete: complete,
      probability: probability,
      modes: modes,
    );
  }

  static TriasLocation _parseStopPoint(
      XmlElement stopPoint, XmlElement loc, XmlElement geo) {
    final name = stopPoint['trias:StopPointName']?.getTriasText()?.innerText;
    final id = stopPoint['trias:StopPointRef']?.innerText;

    final probability = _parseDouble(loc['trias:Probability']?.innerText);
    final complete = loc['trias:Complete']?.innerText == 'true';
    final modes = loc.findElements('trias:Mode').map((e) {
      final mode = e['trias:PtMode']!.innerText;
      final submode = e.childElements
          .where(
            (e) =>
                e.name.qualified != 'trias:PtMode' &&
                e.name.local.contains('Submode'),
          )
          .firstOrNull
          ?.innerText;
      return TriasPtMode(mode, submode);
    }).toList();

    return TriasLocation(
      stopPointName: name,
      stopPointRef: id,
      geoPosition: TriasGeoPosition.fromXML(geo),
      complete: complete,
      probability: probability,
      modes: modes,
    );
  }

  @override
  void dispose() {
    client.close();
  }

  Future<List<NavigationCompletion>> find(double lat, double lon) async {
    final url = Uri.https('api.opentransportdata.swiss', 'trias2020');
    final coord = TriasGeoPosition(longitude: lon, latitude: lat);
    final search = const Trias2020RequestBuilder().search(_GeoPosition(
      lon: lon,
      lat: lat,
    ));
    if (kDebugMode) {
      log.i('Querying $url with $search');
    }
    final res = await client.post(
      url,
      headers: {
        'Authorization': apiKey,
        'Content-Type': 'text/xml',
      },
      body: search,
    );
    if (kDebugMode) {
      log.log(XmlDocument.parse(utf8.decode(res.bodyBytes))
          .toXmlString(pretty: true));
    }
    return parseLocations(utf8.decode(res.bodyBytes))
        .map(
          (e) => e.copyWith(
            dist: e.coordinates != null
                ? GeoCoordinates.distance(e.coordinates!, coord)
                : null,
          ),
        )
        .whereUniqueNullableProperty((e) => e.id)
        .toList();
  }
}

double? _parseDouble(String? value) =>
    value == null ? null : double.parse(value);

/// Hacky way to build xml request, because everyone hates xml and we don't want to use a library
/// for this. Also, f*ck you xml. This is the only way to do it. I'm sorry.
class Trias2020RequestBuilder {
  const Trias2020RequestBuilder();

  String search(
    _QueryType query, {
    int maxResults = 10,
    bool includePtModes = false,
    String? restrctionType = 'stop',
  }) {
    return '''
<?xml version="1.0" encoding="UTF-8"?>
<Trias version="1.1" xmlns="http://www.vdv.de/trias" xmlns:siri="http://www.siri.org.uk/siri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.vdv.de/trias ../trias-xsd-v1.1/Trias.xsd">
    <ServiceRequest>
        <siri:RequestTimestamp>${DateTime.now().toIso8601String()}</siri:RequestTimestamp>
        <siri:RequestorRef>API-Explorer</siri:RequestorRef>
        <RequestPayload>
            <LocationInformationRequest>
                <InitialInput>${query.render()}</InitialInput>
                <Restrictions>
                    ${restrctionType == null ? '' : '<Type>$restrctionType</Type>'}
                    <NumberOfResults>$maxResults</NumberOfResults>
                    <IncludePtModes>$includePtModes</IncludePtModes>
                </Restrictions>
            </LocationInformationRequest>
        </RequestPayload>
    </ServiceRequest>
</Trias>''';
  }
}

@immutable
// ignore: one_member_abstracts
abstract class _QueryType {
  String render();
}

class _LocationName implements _QueryType {
  final String query;
  const _LocationName(this.query);

  @override
  String render() => '<LocationName>$query</LocationName>';
}

class _GeoPosition implements _QueryType {
  final double lon;
  final double lat;
  const _GeoPosition({required this.lon, required this.lat});

  @override
  String render() =>
      '<GeoPosition><Longitude>$lon</Longitude><Latitude>$lat</Latitude></GeoPosition>';
}

extension XmlNodeExt on XmlNode {
  XmlElement? operator [](String name) => getElement(name);

  XmlElement? getTriasText() => getElement('trias:Text');
}

extension IterX<T> on Iterable<T> {
  Iterable<T> whereUniqueProperty<R>(R Function(T) property) sync* {
    final seen = <R>{};
    for (final e in this) {
      final p = property(e);
      if (seen.add(p)) {
        yield e;
      }
    }
  }

  Iterable<T> whereUniqueNullableProperty<R>(R? Function(T) property) sync* {
    final seen = <R>{};
    for (final e in this) {
      final p = property(e);
      // if it is null, we don't care about it and just yield it
      if (p == null || seen.add(p)) {
        yield e;
      }
    }
  }
}
