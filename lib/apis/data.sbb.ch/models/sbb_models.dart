// main.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sbb_models.freezed.dart';
part 'sbb_models.g.dart';

@freezed
class SbbStationResponse with _$SbbStationResponse {
  @JsonSerializable(explicitToJson: true)
  const factory SbbStationResponse({
    int? nhits,
    SbbParameters? parameters,
    List<SbbRecord>? records,
  }) = _SbbStationResponse;

  factory SbbStationResponse.fromJson(Map<String, dynamic> json) =>
      _$SbbStationResponseFromJson(json);
}

@freezed
class SbbParameters with _$SbbParameters {
  const factory SbbParameters({
    String? dataset,
    String? timezone,
    String? q,
    int? rows,
    int? start,
    String? format,
  }) = _SbbParameters;

  factory SbbParameters.fromJson(Map<String, dynamic> json) => _$SbbParametersFromJson(json);
}

@freezed
class SbbRecord with _$SbbRecord {
  @JsonSerializable(explicitToJson: true)
  const factory SbbRecord({
    String? datasetid,
    String? recordid,
    SbbFields? fields,
    SbbGeometry? geometry,
    String? recordTimeStanp,
  }) = _SbbRecord;

  factory SbbRecord.fromJson(Map<String, dynamic> json) => _$SbbRecordFromJson(json);
}

@freezed
class SbbFields with _$SbbFields {
  @JsonSerializable(explicitToJson: true)
  const factory SbbFields({
    int? bpuic,
    int? isHaltestelle,
    double? zLv03,
    String? kantonsname,
    double? eWgs84,
    List<double>? geopos,
    double? eLv03,
    double? zWgs84,
    String? abkuerzung,
    String? kantonskuerzel,
    String? lod,
    String? bezirksnum,
    String? landIso2Geo,
    int? goNummer,
    String? bpvhVerkehrsmittelTextDe,
    int? kantonsnum,
    double? zLv95,
    double? nWgs84,
    String? bezeichnungOffiziell,
    int? bfsNummer,
    String? gemeindename,
    double? nLv03,
    double? eLv95,
    double? nLv95,
    String? goAbkuerzungDe,
    String? bezirksname,
    String? ortschaftsname,
    String? goBezeichnungDe,
    String? bpvhVerkehrsmittel,
    int? nummer,
    String? dstAbk,
    int? goIdentifikation,
  }) = _SbbFields;

  factory SbbFields.fromJson(Map<String, dynamic> json) => _$SbbFieldsFromJson(json);
}

@freezed
class SbbGeometry with _$SbbGeometry {
  const factory SbbGeometry({
    String? type,
    List<double>? coordinates,
  }) = _SbbGeometry;

  factory SbbGeometry.fromJson(Map<String, dynamic> json) => _$SbbGeometryFromJson(json);
}
