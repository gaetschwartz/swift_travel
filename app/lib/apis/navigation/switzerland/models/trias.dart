library switzerland_navigation_api;

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/switzerland/trias_2020.dart';
import 'package:xml/xml.dart';

part 'trias.freezed.dart';

@freezed
class TriasLocation with _$TriasLocation implements NavigationCompletion {
  const factory TriasLocation({
    required final String stopPointName,
    required final String stopPointRef,
    required final TriasGeoPosition geoPosition,
    required final bool complete,
    @Default(1.0) final double probability,
    @Default(<TriasPtMode>[]) final List<TriasPtMode> modes,
    double? dist,
  }) = _TriasLocation;
  const TriasLocation._();

  @override
  String? get id => stopPointRef;

  @override
  String get label => stopPointName;

  @override
  LocationType get type => LocationType.station;

  @override
  GeoCoordinates? get coordinates => geoPosition;

  @override
  Widget Function(BuildContext context)? get iconBuilder => null;
}

@freezed
class TriasPtMode with _$TriasPtMode {
  const factory TriasPtMode(String mode, String? submode) = _TriasPtMode;
}

@freezed
class TriasStationBoard with _$TriasStationBoard implements StationBoard {
  const factory TriasStationBoard({
    required Stop stop,
    required TriasService service,
    required List<TriasPreviousCall> previousCalls,
    required TriasThisCall thisCall,
    required List<TriasOnwardCall> onwardCalls,
  }) = _TriasStationBoard;
  const TriasStationBoard._();

  @override
  List<Object> get errors => [];

  @override
  bool get hasError => errors.isEmpty;

  @override
  String get stopName => stop.displayName;

  @override
  List<StationboardConnection> get connections =>
      [...previousCalls, thisCall, ...onwardCalls];
}

@freezed
class TriasService with _$TriasService {
  const factory TriasService({
    required String operatingDayRef,
    required String journeyRef,
    required String lineRef,
    required String directionRef,
    required List<TriasMode> modes,
    required List<TriasAttribute> attributes,
    required String publishedLineName,
    required String operatorRef,
    required String originStopPointRef,
    required String originText,
    required String destinationStopPointRef,
    required String destinationText,
  }) = _TriasService;

  factory TriasService.fromXML(XmlElement e) {
    return TriasService(
      operatingDayRef: e.getElement('trias:OperatingDayRef')!.text,
      journeyRef: e.getElement('trias:JourneyRef')!.text,
      lineRef: e.getElement('trias:LineRef')!.text,
      directionRef: e.getElement('trias:DirectionRef')!.text,
      modes: e.findElements('trias:Mode').map(TriasMode.fromXML).toList(),
      publishedLineName:
          e.getElement('trias:PublishedLineName')!.getTriasText()!.text,
      operatorRef: e.getElement('trias:OperatorRef')!.text,
      originStopPointRef: e.getElement('trias:OriginStopPointRef')!.text,
      originText: e.getElement('trias:OriginText')!.getTriasText()!.text,
      destinationStopPointRef:
          e.getElement('trias:DestinationStopPointRef')!.text,
      destinationText:
          e.getElement('trias:DestinationText')!.getTriasText()!.text,
      attributes: e
          .findElements('trias:Attribute')
          .map(TriasAttribute.fromXML)
          .toList(),
    );
  }
}

@freezed
class TriasMode with _$TriasMode {
  const factory TriasMode(
    String mode, {
    String? submode,
    String? name,
    String? language,
  }) = _TriasMode;

  factory TriasMode.fromXML(XmlElement e) {
    return TriasMode(
      e.getElement('trias:PtMode')!.text,
      submode: e.getElement('trias:BusSubmode')?.text,
      name: e.getElement('trias:Name')?.getElement('trias:Text')?.text,
      language: e.getElement('trias:Name')?.getElement('trias:Language')?.text,
    );
  }
}

/*
<trias:Attribute>
								<trias:Text>
									<trias:Text>Gratis-Internet mit der App SBB FreeSurf</trias:Text>
									<trias:Language>de</trias:Language>
								</trias:Text>
								<trias:Code>A__FS</trias:Code>
							</trias:Attribute>*/
@freezed
class TriasAttribute with _$TriasAttribute {
  const factory TriasAttribute({
    required String code,
    required String text,
  }) = _TriasAttribute;

  factory TriasAttribute.fromXML(XmlElement e) {
    return TriasAttribute(
      code: e.getElement('trias:Code')!.text,
      text: e.getElement('trias:Text')!.getTriasText()!.text,
    );
  }
}

/* 
 <trias:OnwardCall>
							<trias:CallAtStop>
								<trias:StopPointRef>8501026</trias:StopPointRef>
								<trias:StopPointName>
									<trias:Text>Genève-Aéroport</trias:Text>
									<trias:Language>de</trias:Language>
								</trias:StopPointName>
								<trias:PlannedBay>
									<trias:Text>1</trias:Text>
									<trias:Language>de</trias:Language>
								</trias:PlannedBay>
								<trias:ServiceArrival>
									<trias:TimetabledTime>2022-02-20T11:41:00Z</trias:TimetabledTime>
									<trias:EstimatedTime>2022-02-20T11:41:00Z</trias:EstimatedTime>
								</trias:ServiceArrival>
								<trias:StopSeqNumber>14</trias:StopSeqNumber>
							</trias:CallAtStop>
						</trias:OnwardCall>
*/
@freezed
class TriasOnwardCall with _$TriasOnwardCall implements StationboardConnection {
  const factory TriasOnwardCall({
    required String stopPointRef,
    required String stopPointName,
    required String plannedBay,
    required TriasServiceTime serviceArrival,
    required String stopSeqNumber,
  }) = _TriasOnwardCall;

  factory TriasOnwardCall.fromXML(XmlElement xml) {
    final call = xml.getElement('trias:CallAtStop')!;
    return TriasOnwardCall(
      stopPointRef: call.getElement('trias:StopPointRef')!.text,
      stopPointName:
          call.getElement('trias:StopPointName')!.getTriasText()!.text,
      plannedBay: call.getElement('trias:PlannedBay')!.getTriasText()!.text,
      serviceArrival:
          TriasServiceTime.fromXML(call.getElement('trias:ServiceArrival')!),
      stopSeqNumber: call.getElement('trias:StopSeqNumber')!.text,
    );
  }

  const TriasOnwardCall._();

  @override
  // TODO: implement arrDelay
  int? get arrDelay => throw UnimplementedError();

  @override
  // TODO: implement bgcolor
  Color? get bgcolor => throw UnimplementedError();

  @override
  // TODO: implement depDelay
  int? get depDelay => throw UnimplementedError();

  @override
  // TODO: implement fgcolor
  Color? get fgcolor => throw UnimplementedError();

  @override
  // TODO: implement g
  String? get g => throw UnimplementedError();

  @override
  // TODO: implement l
  String? get l => throw UnimplementedError();

  @override
  // TODO: implement line
  String? get line => throw UnimplementedError();

  @override
  // TODO: implement number
  String get number => throw UnimplementedError();

  @override
  // TODO: implement operator
  String? get operator => throw UnimplementedError();

  @override
  // TODO: implement subsequentStops
  List<DelayedStop> get subsequentStops => throw UnimplementedError();

  @override
  // TODO: implement terminal
  Stop get terminal => throw UnimplementedError();

  @override
  // TODO: implement time
  DateTime get time => throw UnimplementedError();

  @override
  // TODO: implement track
  String? get track => throw UnimplementedError();

  @override
  // TODO: implement type
  VehicleType get type => throw UnimplementedError();
}

@freezed
class TriasServiceTime with _$TriasServiceTime {
  const factory TriasServiceTime({
    required DateTime timetabledTime,
    required DateTime estimatedTime,
  }) = _TriasServiceTime;
  factory TriasServiceTime.fromXML(XmlElement e) {
    return TriasServiceTime(
      timetabledTime:
          DateTime.parse(e.getElement('trias:TimetabledTime')!.text),
      estimatedTime: DateTime.parse(e.getElement('trias:EstimatedTime')!.text),
    );
  }
  const TriasServiceTime._();

  int get delay => estimatedTime.difference(timetabledTime).inMinutes;
}

@freezed
class TriasPreviousCall
    with _$TriasPreviousCall
    implements StationboardConnection {
  const factory TriasPreviousCall({
    required String stopPointRef,
    required String stopPointName,
    required String plannedBay,
    required TriasServiceTime serviceArrival,
    required TriasServiceTime serviceDeparture,
    required String stopSeqNumber,
  }) = _TriasPreviousCall;

  factory TriasPreviousCall.fromXML(XmlElement xml) {
    final call = xml.getElement('trias:CallAtStop')!;
    return TriasPreviousCall(
      stopPointRef: call.getElement('trias:StopPointRef')!.text,
      stopPointName:
          call.getElement('trias:StopPointName')!.getTriasText()!.text,
      plannedBay: call.getElement('trias:PlannedBay')!.getTriasText()!.text,
      serviceArrival:
          TriasServiceTime.fromXML(call.getElement('trias:ServiceArrival')!),
      serviceDeparture:
          TriasServiceTime.fromXML(call.getElement('trias:ServiceDeparture')!),
      stopSeqNumber: call.getElement('trias:StopSeqNumber')!.text,
    );
  }
  const TriasPreviousCall._();

  @override
  // TODO: implement arrDelay
  int? get arrDelay => throw UnimplementedError();

  @override
  // TODO: implement bgcolor
  Color? get bgcolor => throw UnimplementedError();

  @override
  // TODO: implement depDelay
  int? get depDelay => throw UnimplementedError();

  @override
  // TODO: implement fgcolor
  Color? get fgcolor => throw UnimplementedError();

  @override
  // TODO: implement g
  String? get g => throw UnimplementedError();

  @override
  // TODO: implement l
  String? get l => throw UnimplementedError();

  @override
  // TODO: implement line
  String? get line => throw UnimplementedError();

  @override
  // TODO: implement number
  String get number => throw UnimplementedError();

  @override
  // TODO: implement operator
  String? get operator => throw UnimplementedError();

  @override
  // TODO: implement subsequentStops
  List<DelayedStop> get subsequentStops => throw UnimplementedError();

  @override
  // TODO: implement terminal
  Stop get terminal => throw UnimplementedError();

  @override
  // TODO: implement time
  DateTime get time => throw UnimplementedError();

  @override
  // TODO: implement track
  String? get track => throw UnimplementedError();

  @override
  // TODO: implement type
  VehicleType get type => throw UnimplementedError();
}

@freezed
class TriasThisCall with _$TriasThisCall implements StationboardConnection {
  const factory TriasThisCall({
    required String stopPointRef,
    required String stopPointName,
    required String plannedBay,
    required String estimatedBay,
    required TriasServiceTime serviceDeparture,
    required String stopSeqNumber,
  }) = _TriasThisCall;

  factory TriasThisCall.fromXML(XmlElement xml) {
    final call = xml.getElement('trias:CallAtStop')!;
    return TriasThisCall(
      stopPointRef: call.getElement('trias:StopPointRef')!.text,
      stopPointName:
          call.getElement('trias:StopPointName')!.getTriasText()!.text,
      plannedBay: call.getElement('trias:PlannedBay')!.getTriasText()!.text,
      estimatedBay: call.getElement('trias:EstimatedBay')!.getTriasText()!.text,
      serviceDeparture:
          TriasServiceTime.fromXML(call.getElement('trias:ServiceDeparture')!),
      stopSeqNumber: call.getElement('trias:StopSeqNumber')!.text,
    );
  }
  const TriasThisCall._();

  @override
  int? get arrDelay => null;

  @override
  int? get depDelay => serviceDeparture.delay;

  @override
  // TODO: implement bgcolor
  Color? get bgcolor => throw UnimplementedError();

  @override
  // TODO: implement fgcolor
  Color? get fgcolor => throw UnimplementedError();

  @override
  // TODO: implement g
  String? get g => throw UnimplementedError();

  @override
  // TODO: implement l
  String? get l => throw UnimplementedError();

  @override
  // TODO: implement line
  String? get line => throw UnimplementedError();

  @override
  // TODO: implement number
  String get number => throw UnimplementedError();

  @override
  // TODO: implement operator
  String? get operator => throw UnimplementedError();

  @override
  // TODO: implement subsequentStops
  List<DelayedStop> get subsequentStops => throw UnimplementedError();

  @override
  // TODO: implement terminal
  Stop get terminal => throw UnimplementedError();

  @override
  // TODO: implement time
  DateTime get time => throw UnimplementedError();

  @override
  // TODO: implement track
  String? get track => throw UnimplementedError();

  @override
  // TODO: implement type
  VehicleType get type => throw UnimplementedError();
}

@freezed
class TriasGeoPosition with _$TriasGeoPosition, GeoCoordinates {
  const factory TriasGeoPosition({
    required double latitude,
    required double longitude,
  }) = _TriasGeoPosition;

  factory TriasGeoPosition.fromXML(XmlElement xml) {
    return TriasGeoPosition(
      latitude: double.parse(xml.getElement('trias:Latitude')!.text),
      longitude: double.parse(xml.getElement('trias:Longitude')!.text),
    );
  }
}
