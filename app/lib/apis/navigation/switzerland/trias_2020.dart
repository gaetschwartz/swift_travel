library switzerland_navigation_api;

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/trias.dart';
import 'package:swift_travel/apis/navigation/switzerland/switzerland.dart';
import 'package:xml/xml.dart';

/// https://opentransportdata.swiss/en/cookbook/departurearrival-display/
class Trias2020Api implements BaseNavigationApi {
  final String apiKey;
  final client = http.Client();

  @override
  Locale locale = const Locale('de');

  Trias2020Api(this.apiKey);

  @override
  Future<List<NavigationCompletion>> complete(
    String query, {
    bool showCoordinates = true,
    bool showIds = true,
  }) async {
    final url = Uri.https('api.opentransportdata.swiss', 'trias2020');
    final search = const Trias2020RequestBuilder().search(_LocationName(query));
    final res = await client.post(
      url,
      headers: {
        'Authorization': apiKey,
        'Content-Type': 'text/xml',
      },
      body: search,
    );
    final body = utf8.decode(res.bodyBytes);
    final parseLocations2 = parseLocations(body);
    return parseLocations2;
  }

  static List<TriasLocation> parseLocations(String xml) {
    final xmlDocument = XmlDocument.parse(xml);
    final locations = xmlDocument['trias:Trias']?['trias:ServiceDelivery']
                ?['trias:DeliveryPayload']?['trias:LocationInformationResponse']
            ?.findElements('trias:Location') ??
        [];
    final completions = locations.map((loc) {
      final e = loc['trias:Location']!;
      final stopPoint = e['trias:StopPoint'];
      final name = stopPoint?['trias:StopPointName']?.getTriasText()?.text;
      final id = stopPoint?['trias:StopPointRef']?.text;
      final geo = e['trias:GeoPosition']!;

      final probability = _parseDouble(loc['trias:Probability']?.text);
      final complete = loc['trias:Complete']?.text == 'true';
      final modes = loc.findElements('trias:Mode').map((e) {
        final mode = e['trias:PtMode']!.text;
        final submode = e.childElements
            .where(
              (e) =>
                  e.name.qualified != 'trias:PtMode' &&
                  e.name.local.contains('Submode'),
            )
            .firstOrNull
            ?.text;
        return TriasPtMode(mode, submode);
      }).toList();

      return TriasLocation(
        stopPointName: name ?? 'name',
        stopPointRef: id ?? 'id',
        geoPosition: TriasGeoPosition.fromXML(geo),
        complete: complete,
        probability: probability,
        modes: modes,
      );
    }).toList();

    return completions;
  }

/*Parse this xml 
<?xml version="1.0" encoding="UTF-8"?>
<trias:Trias xmlns:siri="http://www.siri.org.uk/siri" xmlns:trias="http://www.vdv.de/trias" xmlns:acsb="http://www.ifopt.org.uk/acsb" xmlns:ifopt="http://www.ifopt.org.uk/ifopt" xmlns:datex2="http://datex2.eu/schema/1_0/1_0" version="1.1">
    <trias:ServiceDelivery>
        <siri:ResponseTimestamp>2022-02-05T12:53:52Z</siri:ResponseTimestamp>
        <siri:ProducerRef>EFAController10.4.21.6-OJP-EFA02-P</siri:ProducerRef>
        <siri:Status>true</siri:Status>
        <trias:Language>de</trias:Language>
        <trias:CalcTime>30</trias:CalcTime>
        <trias:DeliveryPayload>
            <trias:StopEventResponse>
                <trias:StopEventResponseContext>
                    <trias:Situations></trias:Situations>
                </trias:StopEventResponseContext>
                <trias:StopEventResult>
                    <trias:ResultId>ID-86B98FBA-25C1-4DCA-B257-B883CD723B5F</trias:ResultId>
                    <trias:StopEvent>
                        <trias:ThisCall>
                            <trias:CallAtStop>
                                <trias:StopPointRef>8592813</trias:StopPointRef>
                                <trias:StopPointName>
                                    <trias:Text>Genève, Crêts-de-Champel</trias:Text>
                                    <trias:Language>de</trias:Language>
                                </trias:StopPointName>
                                <trias:ServiceDeparture>
                                    <trias:TimetabledTime>2022-02-05T12:46:00Z</trias:TimetabledTime>
                                    <trias:EstimatedTime>2022-02-05T12:51:00Z</trias:EstimatedTime>
                                </trias:ServiceDeparture>
                                <trias:StopSeqNumber>25</trias:StopSeqNumber>
                            </trias:CallAtStop>
                        </trias:ThisCall>
                        <trias:OnwardCall>
                            <trias:CallAtStop>
                                <trias:StopPointRef>8592778</trias:StopPointRef>
                                <trias:StopPointName>
                                    <trias:Text>Genève, Amandolier</trias:Text>
                                    <trias:Language>de</trias:Language>
                                </trias:StopPointName>
                                <trias:ServiceArrival>
                                    <trias:TimetabledTime>2022-02-05T12:51:00Z</trias:TimetabledTime>
                                    <trias:EstimatedTime>2022-02-05T12:55:00Z</trias:EstimatedTime>
                                </trias:ServiceArrival>
                                <trias:ServiceDeparture>
                                    <trias:TimetabledTime>2022-02-05T12:51:00Z</trias:TimetabledTime>
                                    <trias:EstimatedTime>2022-02-05T12:55:00Z</trias:EstimatedTime>
                                </trias:ServiceDeparture>
                                <trias:StopSeqNumber>5</trias:StopSeqNumber>
                            </trias:CallAtStop>
                        </trias:OnwardCall>
                        <trias:Service>
                            <trias:OperatingDayRef>2022-02-05</trias:OperatingDayRef>
                            <trias:JourneyRef>ojp:92011::H:j22:322:9759</trias:JourneyRef>
                            <trias:LineRef>ojp:92011::H</trias:LineRef>
                            <trias:DirectionRef>outward</trias:DirectionRef>
                            <trias:Mode>
                                <trias:PtMode>bus</trias:PtMode>
                                <trias:BusSubmode>localBus</trias:BusSubmode>
                                <trias:Name>
                                    <trias:Text>Bus</trias:Text>
                                    <trias:Language>de</trias:Language>
                                </trias:Name>
                            </trias:Mode>
                            <trias:PublishedLineName>
                                <trias:Text>11</trias:Text>
                                <trias:Language>de</trias:Language>
                            </trias:PublishedLineName>
                            <trias:OperatorRef>ojp:881</trias:OperatorRef>
                            <trias:OriginStopPointRef>8592843</trias:OriginStopPointRef>
                            <trias:OriginText>
                                <trias:Text>Genève, Jardin Botanique</trias:Text>
                                <trias:Language>de</trias:Language>
                            </trias:OriginText>
                            <trias:DestinationStopPointRef>8592829</trias:DestinationStopPointRef>
                            <trias:DestinationText>
                                <trias:Text>Genève-Eaux-Vives, gare</trias:Text>
                                <trias:Language>de</trias:Language>
                            </trias:DestinationText>
                        </trias:Service><
                    </trias:StopEvent>
                </trias:StopEventResult>
            </trias:StopEventResponse>
        </trias:DeliveryPayload>
    </trias:ServiceDelivery>
</trias:Trias>
*/
  // static TriasStationBoard parseStationboard(String xml) {
  //   final xmlDocument = XmlDocument.parse(xml);
  //   final triasElement = xmlDocument.getElement("Trias")!;
  //   final serviceDeliveryElement = triasElement.getElement("ServiceDelivery")!;
  //   final deliveryPayloadElement =
  //       serviceDeliveryElement.getElement("DeliveryPayload")!;
  //   final stopEventResponseElement =
  //       deliveryPayloadElement.getElement("StopEventResponse")!;
  //   final stopEventResultElement =
  //       stopEventResponseElement.getElement("StopEventResult")!;
  //   final stopEventElement = stopEventResultElement.getElement("StopEvent")!;
  //   final service =
  //       TriasService.fromXML(stopEventElement.getElement("trias:Service")!);
  //   final thisCall =
  //       TriasThisCall.fromXML(stopEventElement.getElement("trias:ThisCall")!);
  //   final onwardCalls = stopEventElement
  //       .findElements("trias:OnwardCall")
  //       .map(TriasOnwardCall.fromXML)
  //       .toList();
  //   final previousCalls = stopEventElement
  //       .findElements("trias:PreviousCall")
  //       .map(TriasPreviousCall.fromXML)
  //       .toList();

  //   throw UnimplementedError();
  // }

  @override
  void dispose() {
    client.close();
  }

  @override
  Future<List<NavigationCompletion>> find(double lat, double lon) async {
    final url = Uri.https('api.opentransportdata.swiss', 'trias2020');
    final res = await client.post(
      url,
      headers: {
        'Authorization': apiKey,
        'Content-Type': 'application/xml',
      },
      body: const Trias2020RequestBuilder().search(_GeoPosition(
        lon: lon,
        lat: lat,
      )),
    );
    return parseLocations(res.body);
  }

  @override
  Future<NavRoute> rawRoute(Uri query) {
    // TODO: implement rawRoute
    throw UnimplementedError();
  }

  @override
  Future<NavRoute> route(String departure, String arrival,
      {required DateTime date,
      required TimeOfDay time,
      TimeType timeType = TimeType.arrival}) {
    // TODO: implement route
    throw UnimplementedError();
  }

  @override
  Future<StationBoard> stationboard(
    Stop stop, {
    DateTime? when,
    TimeType timeType = TimeType.departure,
    List<TransportationTypes> transportationTypes = const [],
  }) {
    // TODO: implement stationboard
    throw UnimplementedError();
  }
}

double _parseDouble(String? value) {
  if (value == null) throw ArgumentError('value parsed to double is null');
  return double.parse(value);
}

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
