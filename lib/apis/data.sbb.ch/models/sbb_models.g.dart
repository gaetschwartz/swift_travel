// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sbb_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LatLon _$_$_LatLonFromJson(Map<String, dynamic> json) {
  return _$_LatLon(
    (json['lat'] as num).toDouble(),
    (json['lon'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_LatLonToJson(_$_LatLon instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

_$_SbbStationResponse _$_$_SbbStationResponseFromJson(
    Map<String, dynamic> json) {
  return _$_SbbStationResponse(
    nhits: json['nhits'] as int?,
    parameters: json['parameters'] == null
        ? null
        : SbbParameters.fromJson(json['parameters'] as Map<String, dynamic>),
    records: (json['records'] as List<dynamic>?)
        ?.map((e) => SbbRecord.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_SbbStationResponseToJson(
        _$_SbbStationResponse instance) =>
    <String, dynamic>{
      'nhits': instance.nhits,
      'parameters': instance.parameters?.toJson(),
      'records': instance.records?.map((e) => e.toJson()).toList(),
    };

_$_SbbParameters _$_$_SbbParametersFromJson(Map<String, dynamic> json) {
  return _$_SbbParameters(
    dataset: json['dataset'] as String?,
    timezone: json['timezone'] as String?,
    q: json['q'] as String?,
    rows: json['rows'] as int?,
    start: json['start'] as int?,
    format: json['format'] as String?,
  );
}

Map<String, dynamic> _$_$_SbbParametersToJson(_$_SbbParameters instance) =>
    <String, dynamic>{
      'dataset': instance.dataset,
      'timezone': instance.timezone,
      'q': instance.q,
      'rows': instance.rows,
      'start': instance.start,
      'format': instance.format,
    };

_$_SbbRecord _$_$_SbbRecordFromJson(Map<String, dynamic> json) {
  return _$_SbbRecord(
    datasetid: json['datasetid'] as String?,
    recordid: json['recordid'] as String?,
    fields: json['fields'] == null
        ? null
        : SbbFields.fromJson(json['fields'] as Map<String, dynamic>),
    geometry: json['geometry'] == null
        ? null
        : SbbGeometry.fromJson(json['geometry'] as Map<String, dynamic>),
    recordTimeStanp: json['recordTimeStanp'] as String?,
  );
}

Map<String, dynamic> _$_$_SbbRecordToJson(_$_SbbRecord instance) =>
    <String, dynamic>{
      'datasetid': instance.datasetid,
      'recordid': instance.recordid,
      'fields': instance.fields?.toJson(),
      'geometry': instance.geometry?.toJson(),
      'recordTimeStanp': instance.recordTimeStanp,
    };

_$_SbbFields _$_$_SbbFieldsFromJson(Map<String, dynamic> json) {
  return _$_SbbFields(
    bpuic: json['bpuic'] as int?,
    isHaltestelle: json['isHaltestelle'] as int?,
    zLv03: (json['zLv03'] as num?)?.toDouble(),
    kantonsname: json['kantonsname'] as String?,
    eWgs84: (json['eWgs84'] as num?)?.toDouble(),
    geopos: (json['geopos'] as List<dynamic>?)
        ?.map((e) => (e as num).toDouble())
        .toList(),
    eLv03: (json['eLv03'] as num?)?.toDouble(),
    zWgs84: (json['zWgs84'] as num?)?.toDouble(),
    abkuerzung: json['abkuerzung'] as String?,
    kantonskuerzel: json['kantonskuerzel'] as String?,
    lod: json['lod'] as String?,
    bezirksnum: json['bezirksnum'] as String?,
    landIso2Geo: json['landIso2Geo'] as String?,
    goNummer: json['goNummer'] as int?,
    bpvhVerkehrsmittelTextDe: json['bpvhVerkehrsmittelTextDe'] as String?,
    kantonsnum: json['kantonsnum'] as int?,
    zLv95: (json['zLv95'] as num?)?.toDouble(),
    nWgs84: (json['nWgs84'] as num?)?.toDouble(),
    bezeichnungOffiziell: json['bezeichnungOffiziell'] as String?,
    bfsNummer: json['bfsNummer'] as int?,
    gemeindename: json['gemeindename'] as String?,
    nLv03: (json['nLv03'] as num?)?.toDouble(),
    eLv95: (json['eLv95'] as num?)?.toDouble(),
    nLv95: (json['nLv95'] as num?)?.toDouble(),
    goAbkuerzungDe: json['goAbkuerzungDe'] as String?,
    bezirksname: json['bezirksname'] as String?,
    ortschaftsname: json['ortschaftsname'] as String?,
    goBezeichnungDe: json['goBezeichnungDe'] as String?,
    bpvhVerkehrsmittel: json['bpvhVerkehrsmittel'] as String?,
    nummer: json['nummer'] as int?,
    dstAbk: json['dstAbk'] as String?,
    goIdentifikation: json['goIdentifikation'] as int?,
  );
}

Map<String, dynamic> _$_$_SbbFieldsToJson(_$_SbbFields instance) =>
    <String, dynamic>{
      'bpuic': instance.bpuic,
      'isHaltestelle': instance.isHaltestelle,
      'zLv03': instance.zLv03,
      'kantonsname': instance.kantonsname,
      'eWgs84': instance.eWgs84,
      'geopos': instance.geopos,
      'eLv03': instance.eLv03,
      'zWgs84': instance.zWgs84,
      'abkuerzung': instance.abkuerzung,
      'kantonskuerzel': instance.kantonskuerzel,
      'lod': instance.lod,
      'bezirksnum': instance.bezirksnum,
      'landIso2Geo': instance.landIso2Geo,
      'goNummer': instance.goNummer,
      'bpvhVerkehrsmittelTextDe': instance.bpvhVerkehrsmittelTextDe,
      'kantonsnum': instance.kantonsnum,
      'zLv95': instance.zLv95,
      'nWgs84': instance.nWgs84,
      'bezeichnungOffiziell': instance.bezeichnungOffiziell,
      'bfsNummer': instance.bfsNummer,
      'gemeindename': instance.gemeindename,
      'nLv03': instance.nLv03,
      'eLv95': instance.eLv95,
      'nLv95': instance.nLv95,
      'goAbkuerzungDe': instance.goAbkuerzungDe,
      'bezirksname': instance.bezirksname,
      'ortschaftsname': instance.ortschaftsname,
      'goBezeichnungDe': instance.goBezeichnungDe,
      'bpvhVerkehrsmittel': instance.bpvhVerkehrsmittel,
      'nummer': instance.nummer,
      'dstAbk': instance.dstAbk,
      'goIdentifikation': instance.goIdentifikation,
    };

_$_SbbGeometry _$_$_SbbGeometryFromJson(Map<String, dynamic> json) {
  return _$_SbbGeometry(
    type: json['type'] as String?,
    coordinates: (json['coordinates'] as List<dynamic>?)
        ?.map((e) => (e as num).toDouble())
        .toList(),
  );
}

Map<String, dynamic> _$_$_SbbGeometryToJson(_$_SbbGeometry instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
