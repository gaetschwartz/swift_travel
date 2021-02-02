// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sbb_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SbbStationResponse _$SbbStationResponseFromJson(Map<String, dynamic> json) {
  return _SbbStationResponse.fromJson(json);
}

/// @nodoc
class _$SbbStationResponseTearOff {
  const _$SbbStationResponseTearOff();

// ignore: unused_element
  _SbbStationResponse call(
      {int nhits, SbbParameters parameters, List<SbbRecord> records}) {
    return _SbbStationResponse(
      nhits: nhits,
      parameters: parameters,
      records: records,
    );
  }

// ignore: unused_element
  SbbStationResponse fromJson(Map<String, Object> json) {
    return SbbStationResponse.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SbbStationResponse = _$SbbStationResponseTearOff();

/// @nodoc
mixin _$SbbStationResponse {
  int get nhits;
  SbbParameters get parameters;
  List<SbbRecord> get records;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SbbStationResponseCopyWith<SbbStationResponse> get copyWith;
}

/// @nodoc
abstract class $SbbStationResponseCopyWith<$Res> {
  factory $SbbStationResponseCopyWith(
          SbbStationResponse value, $Res Function(SbbStationResponse) then) =
      _$SbbStationResponseCopyWithImpl<$Res>;
  $Res call({int nhits, SbbParameters parameters, List<SbbRecord> records});

  $SbbParametersCopyWith<$Res> get parameters;
}

/// @nodoc
class _$SbbStationResponseCopyWithImpl<$Res>
    implements $SbbStationResponseCopyWith<$Res> {
  _$SbbStationResponseCopyWithImpl(this._value, this._then);

  final SbbStationResponse _value;
  // ignore: unused_field
  final $Res Function(SbbStationResponse) _then;

  @override
  $Res call({
    Object nhits = freezed,
    Object parameters = freezed,
    Object records = freezed,
  }) {
    return _then(_value.copyWith(
      nhits: nhits == freezed ? _value.nhits : nhits as int,
      parameters: parameters == freezed
          ? _value.parameters
          : parameters as SbbParameters,
      records: records == freezed ? _value.records : records as List<SbbRecord>,
    ));
  }

  @override
  $SbbParametersCopyWith<$Res> get parameters {
    if (_value.parameters == null) {
      return null;
    }
    return $SbbParametersCopyWith<$Res>(_value.parameters, (value) {
      return _then(_value.copyWith(parameters: value));
    });
  }
}

/// @nodoc
abstract class _$SbbStationResponseCopyWith<$Res>
    implements $SbbStationResponseCopyWith<$Res> {
  factory _$SbbStationResponseCopyWith(
          _SbbStationResponse value, $Res Function(_SbbStationResponse) then) =
      __$SbbStationResponseCopyWithImpl<$Res>;
  @override
  $Res call({int nhits, SbbParameters parameters, List<SbbRecord> records});

  @override
  $SbbParametersCopyWith<$Res> get parameters;
}

/// @nodoc
class __$SbbStationResponseCopyWithImpl<$Res>
    extends _$SbbStationResponseCopyWithImpl<$Res>
    implements _$SbbStationResponseCopyWith<$Res> {
  __$SbbStationResponseCopyWithImpl(
      _SbbStationResponse _value, $Res Function(_SbbStationResponse) _then)
      : super(_value, (v) => _then(v as _SbbStationResponse));

  @override
  _SbbStationResponse get _value => super._value as _SbbStationResponse;

  @override
  $Res call({
    Object nhits = freezed,
    Object parameters = freezed,
    Object records = freezed,
  }) {
    return _then(_SbbStationResponse(
      nhits: nhits == freezed ? _value.nhits : nhits as int,
      parameters: parameters == freezed
          ? _value.parameters
          : parameters as SbbParameters,
      records: records == freezed ? _value.records : records as List<SbbRecord>,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_SbbStationResponse implements _SbbStationResponse {
  const _$_SbbStationResponse({this.nhits, this.parameters, this.records});

  factory _$_SbbStationResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_SbbStationResponseFromJson(json);

  @override
  final int nhits;
  @override
  final SbbParameters parameters;
  @override
  final List<SbbRecord> records;

  @override
  String toString() {
    return 'SbbStationResponse(nhits: $nhits, parameters: $parameters, records: $records)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SbbStationResponse &&
            (identical(other.nhits, nhits) ||
                const DeepCollectionEquality().equals(other.nhits, nhits)) &&
            (identical(other.parameters, parameters) ||
                const DeepCollectionEquality()
                    .equals(other.parameters, parameters)) &&
            (identical(other.records, records) ||
                const DeepCollectionEquality().equals(other.records, records)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nhits) ^
      const DeepCollectionEquality().hash(parameters) ^
      const DeepCollectionEquality().hash(records);

  @JsonKey(ignore: true)
  @override
  _$SbbStationResponseCopyWith<_SbbStationResponse> get copyWith =>
      __$SbbStationResponseCopyWithImpl<_SbbStationResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SbbStationResponseToJson(this);
  }
}

abstract class _SbbStationResponse implements SbbStationResponse {
  const factory _SbbStationResponse(
      {int nhits,
      SbbParameters parameters,
      List<SbbRecord> records}) = _$_SbbStationResponse;

  factory _SbbStationResponse.fromJson(Map<String, dynamic> json) =
      _$_SbbStationResponse.fromJson;

  @override
  int get nhits;
  @override
  SbbParameters get parameters;
  @override
  List<SbbRecord> get records;
  @override
  @JsonKey(ignore: true)
  _$SbbStationResponseCopyWith<_SbbStationResponse> get copyWith;
}

SbbParameters _$SbbParametersFromJson(Map<String, dynamic> json) {
  return _SbbParameters.fromJson(json);
}

/// @nodoc
class _$SbbParametersTearOff {
  const _$SbbParametersTearOff();

// ignore: unused_element
  _SbbParameters call(
      {String dataset,
      String timezone,
      String q,
      int rows,
      int start,
      String format}) {
    return _SbbParameters(
      dataset: dataset,
      timezone: timezone,
      q: q,
      rows: rows,
      start: start,
      format: format,
    );
  }

// ignore: unused_element
  SbbParameters fromJson(Map<String, Object> json) {
    return SbbParameters.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SbbParameters = _$SbbParametersTearOff();

/// @nodoc
mixin _$SbbParameters {
  String get dataset;
  String get timezone;
  String get q;
  int get rows;
  int get start;
  String get format;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SbbParametersCopyWith<SbbParameters> get copyWith;
}

/// @nodoc
abstract class $SbbParametersCopyWith<$Res> {
  factory $SbbParametersCopyWith(
          SbbParameters value, $Res Function(SbbParameters) then) =
      _$SbbParametersCopyWithImpl<$Res>;
  $Res call(
      {String dataset,
      String timezone,
      String q,
      int rows,
      int start,
      String format});
}

/// @nodoc
class _$SbbParametersCopyWithImpl<$Res>
    implements $SbbParametersCopyWith<$Res> {
  _$SbbParametersCopyWithImpl(this._value, this._then);

  final SbbParameters _value;
  // ignore: unused_field
  final $Res Function(SbbParameters) _then;

  @override
  $Res call({
    Object dataset = freezed,
    Object timezone = freezed,
    Object q = freezed,
    Object rows = freezed,
    Object start = freezed,
    Object format = freezed,
  }) {
    return _then(_value.copyWith(
      dataset: dataset == freezed ? _value.dataset : dataset as String,
      timezone: timezone == freezed ? _value.timezone : timezone as String,
      q: q == freezed ? _value.q : q as String,
      rows: rows == freezed ? _value.rows : rows as int,
      start: start == freezed ? _value.start : start as int,
      format: format == freezed ? _value.format : format as String,
    ));
  }
}

/// @nodoc
abstract class _$SbbParametersCopyWith<$Res>
    implements $SbbParametersCopyWith<$Res> {
  factory _$SbbParametersCopyWith(
          _SbbParameters value, $Res Function(_SbbParameters) then) =
      __$SbbParametersCopyWithImpl<$Res>;
  @override
  $Res call(
      {String dataset,
      String timezone,
      String q,
      int rows,
      int start,
      String format});
}

/// @nodoc
class __$SbbParametersCopyWithImpl<$Res>
    extends _$SbbParametersCopyWithImpl<$Res>
    implements _$SbbParametersCopyWith<$Res> {
  __$SbbParametersCopyWithImpl(
      _SbbParameters _value, $Res Function(_SbbParameters) _then)
      : super(_value, (v) => _then(v as _SbbParameters));

  @override
  _SbbParameters get _value => super._value as _SbbParameters;

  @override
  $Res call({
    Object dataset = freezed,
    Object timezone = freezed,
    Object q = freezed,
    Object rows = freezed,
    Object start = freezed,
    Object format = freezed,
  }) {
    return _then(_SbbParameters(
      dataset: dataset == freezed ? _value.dataset : dataset as String,
      timezone: timezone == freezed ? _value.timezone : timezone as String,
      q: q == freezed ? _value.q : q as String,
      rows: rows == freezed ? _value.rows : rows as int,
      start: start == freezed ? _value.start : start as int,
      format: format == freezed ? _value.format : format as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SbbParameters implements _SbbParameters {
  const _$_SbbParameters(
      {this.dataset,
      this.timezone,
      this.q,
      this.rows,
      this.start,
      this.format});

  factory _$_SbbParameters.fromJson(Map<String, dynamic> json) =>
      _$_$_SbbParametersFromJson(json);

  @override
  final String dataset;
  @override
  final String timezone;
  @override
  final String q;
  @override
  final int rows;
  @override
  final int start;
  @override
  final String format;

  @override
  String toString() {
    return 'SbbParameters(dataset: $dataset, timezone: $timezone, q: $q, rows: $rows, start: $start, format: $format)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SbbParameters &&
            (identical(other.dataset, dataset) ||
                const DeepCollectionEquality()
                    .equals(other.dataset, dataset)) &&
            (identical(other.timezone, timezone) ||
                const DeepCollectionEquality()
                    .equals(other.timezone, timezone)) &&
            (identical(other.q, q) ||
                const DeepCollectionEquality().equals(other.q, q)) &&
            (identical(other.rows, rows) ||
                const DeepCollectionEquality().equals(other.rows, rows)) &&
            (identical(other.start, start) ||
                const DeepCollectionEquality().equals(other.start, start)) &&
            (identical(other.format, format) ||
                const DeepCollectionEquality().equals(other.format, format)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dataset) ^
      const DeepCollectionEquality().hash(timezone) ^
      const DeepCollectionEquality().hash(q) ^
      const DeepCollectionEquality().hash(rows) ^
      const DeepCollectionEquality().hash(start) ^
      const DeepCollectionEquality().hash(format);

  @JsonKey(ignore: true)
  @override
  _$SbbParametersCopyWith<_SbbParameters> get copyWith =>
      __$SbbParametersCopyWithImpl<_SbbParameters>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SbbParametersToJson(this);
  }
}

abstract class _SbbParameters implements SbbParameters {
  const factory _SbbParameters(
      {String dataset,
      String timezone,
      String q,
      int rows,
      int start,
      String format}) = _$_SbbParameters;

  factory _SbbParameters.fromJson(Map<String, dynamic> json) =
      _$_SbbParameters.fromJson;

  @override
  String get dataset;
  @override
  String get timezone;
  @override
  String get q;
  @override
  int get rows;
  @override
  int get start;
  @override
  String get format;
  @override
  @JsonKey(ignore: true)
  _$SbbParametersCopyWith<_SbbParameters> get copyWith;
}

SbbRecord _$SbbRecordFromJson(Map<String, dynamic> json) {
  return _SbbRecord.fromJson(json);
}

/// @nodoc
class _$SbbRecordTearOff {
  const _$SbbRecordTearOff();

// ignore: unused_element
  _SbbRecord call(
      {String datasetid,
      String recordid,
      SbbFields fields,
      SbbGeometry geometry,
      String recordTimeStanp}) {
    return _SbbRecord(
      datasetid: datasetid,
      recordid: recordid,
      fields: fields,
      geometry: geometry,
      recordTimeStanp: recordTimeStanp,
    );
  }

// ignore: unused_element
  SbbRecord fromJson(Map<String, Object> json) {
    return SbbRecord.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SbbRecord = _$SbbRecordTearOff();

/// @nodoc
mixin _$SbbRecord {
  String get datasetid;
  String get recordid;
  SbbFields get fields;
  SbbGeometry get geometry;
  String get recordTimeStanp;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SbbRecordCopyWith<SbbRecord> get copyWith;
}

/// @nodoc
abstract class $SbbRecordCopyWith<$Res> {
  factory $SbbRecordCopyWith(SbbRecord value, $Res Function(SbbRecord) then) =
      _$SbbRecordCopyWithImpl<$Res>;
  $Res call(
      {String datasetid,
      String recordid,
      SbbFields fields,
      SbbGeometry geometry,
      String recordTimeStanp});

  $SbbFieldsCopyWith<$Res> get fields;
  $SbbGeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class _$SbbRecordCopyWithImpl<$Res> implements $SbbRecordCopyWith<$Res> {
  _$SbbRecordCopyWithImpl(this._value, this._then);

  final SbbRecord _value;
  // ignore: unused_field
  final $Res Function(SbbRecord) _then;

  @override
  $Res call({
    Object datasetid = freezed,
    Object recordid = freezed,
    Object fields = freezed,
    Object geometry = freezed,
    Object recordTimeStanp = freezed,
  }) {
    return _then(_value.copyWith(
      datasetid: datasetid == freezed ? _value.datasetid : datasetid as String,
      recordid: recordid == freezed ? _value.recordid : recordid as String,
      fields: fields == freezed ? _value.fields : fields as SbbFields,
      geometry: geometry == freezed ? _value.geometry : geometry as SbbGeometry,
      recordTimeStanp: recordTimeStanp == freezed
          ? _value.recordTimeStanp
          : recordTimeStanp as String,
    ));
  }

  @override
  $SbbFieldsCopyWith<$Res> get fields {
    if (_value.fields == null) {
      return null;
    }
    return $SbbFieldsCopyWith<$Res>(_value.fields, (value) {
      return _then(_value.copyWith(fields: value));
    });
  }

  @override
  $SbbGeometryCopyWith<$Res> get geometry {
    if (_value.geometry == null) {
      return null;
    }
    return $SbbGeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value));
    });
  }
}

/// @nodoc
abstract class _$SbbRecordCopyWith<$Res> implements $SbbRecordCopyWith<$Res> {
  factory _$SbbRecordCopyWith(
          _SbbRecord value, $Res Function(_SbbRecord) then) =
      __$SbbRecordCopyWithImpl<$Res>;
  @override
  $Res call(
      {String datasetid,
      String recordid,
      SbbFields fields,
      SbbGeometry geometry,
      String recordTimeStanp});

  @override
  $SbbFieldsCopyWith<$Res> get fields;
  @override
  $SbbGeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class __$SbbRecordCopyWithImpl<$Res> extends _$SbbRecordCopyWithImpl<$Res>
    implements _$SbbRecordCopyWith<$Res> {
  __$SbbRecordCopyWithImpl(_SbbRecord _value, $Res Function(_SbbRecord) _then)
      : super(_value, (v) => _then(v as _SbbRecord));

  @override
  _SbbRecord get _value => super._value as _SbbRecord;

  @override
  $Res call({
    Object datasetid = freezed,
    Object recordid = freezed,
    Object fields = freezed,
    Object geometry = freezed,
    Object recordTimeStanp = freezed,
  }) {
    return _then(_SbbRecord(
      datasetid: datasetid == freezed ? _value.datasetid : datasetid as String,
      recordid: recordid == freezed ? _value.recordid : recordid as String,
      fields: fields == freezed ? _value.fields : fields as SbbFields,
      geometry: geometry == freezed ? _value.geometry : geometry as SbbGeometry,
      recordTimeStanp: recordTimeStanp == freezed
          ? _value.recordTimeStanp
          : recordTimeStanp as String,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_SbbRecord implements _SbbRecord {
  _$_SbbRecord(
      {this.datasetid,
      this.recordid,
      this.fields,
      this.geometry,
      this.recordTimeStanp});

  factory _$_SbbRecord.fromJson(Map<String, dynamic> json) =>
      _$_$_SbbRecordFromJson(json);

  @override
  final String datasetid;
  @override
  final String recordid;
  @override
  final SbbFields fields;
  @override
  final SbbGeometry geometry;
  @override
  final String recordTimeStanp;

  @override
  String toString() {
    return 'SbbRecord(datasetid: $datasetid, recordid: $recordid, fields: $fields, geometry: $geometry, recordTimeStanp: $recordTimeStanp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SbbRecord &&
            (identical(other.datasetid, datasetid) ||
                const DeepCollectionEquality()
                    .equals(other.datasetid, datasetid)) &&
            (identical(other.recordid, recordid) ||
                const DeepCollectionEquality()
                    .equals(other.recordid, recordid)) &&
            (identical(other.fields, fields) ||
                const DeepCollectionEquality().equals(other.fields, fields)) &&
            (identical(other.geometry, geometry) ||
                const DeepCollectionEquality()
                    .equals(other.geometry, geometry)) &&
            (identical(other.recordTimeStanp, recordTimeStanp) ||
                const DeepCollectionEquality()
                    .equals(other.recordTimeStanp, recordTimeStanp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(datasetid) ^
      const DeepCollectionEquality().hash(recordid) ^
      const DeepCollectionEquality().hash(fields) ^
      const DeepCollectionEquality().hash(geometry) ^
      const DeepCollectionEquality().hash(recordTimeStanp);

  @JsonKey(ignore: true)
  @override
  _$SbbRecordCopyWith<_SbbRecord> get copyWith =>
      __$SbbRecordCopyWithImpl<_SbbRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SbbRecordToJson(this);
  }
}

abstract class _SbbRecord implements SbbRecord {
  factory _SbbRecord(
      {String datasetid,
      String recordid,
      SbbFields fields,
      SbbGeometry geometry,
      String recordTimeStanp}) = _$_SbbRecord;

  factory _SbbRecord.fromJson(Map<String, dynamic> json) =
      _$_SbbRecord.fromJson;

  @override
  String get datasetid;
  @override
  String get recordid;
  @override
  SbbFields get fields;
  @override
  SbbGeometry get geometry;
  @override
  String get recordTimeStanp;
  @override
  @JsonKey(ignore: true)
  _$SbbRecordCopyWith<_SbbRecord> get copyWith;
}

SbbFields _$SbbFieldsFromJson(Map<String, dynamic> json) {
  return _SbbFields.fromJson(json);
}

/// @nodoc
class _$SbbFieldsTearOff {
  const _$SbbFieldsTearOff();

// ignore: unused_element
  _SbbFields call(
      {int bpuic,
      int isHaltestelle,
      double zLv03,
      String kantonsname,
      double eWgs84,
      List<double> geopos,
      double eLv03,
      double zWgs84,
      String abkuerzung,
      String kantonskuerzel,
      String lod,
      String bezirksnum,
      String landIso2Geo,
      int goNummer,
      String bpvhVerkehrsmittelTextDe,
      int kantonsnum,
      double zLv95,
      double nWgs84,
      String bezeichnungOffiziell,
      int bfsNummer,
      String gemeindename,
      double nLv03,
      double eLv95,
      double nLv95,
      String goAbkuerzungDe,
      String bezirksname,
      String ortschaftsname,
      String goBezeichnungDe,
      String bpvhVerkehrsmittel,
      int nummer,
      String dstAbk,
      int goIdentifikation}) {
    return _SbbFields(
      bpuic: bpuic,
      isHaltestelle: isHaltestelle,
      zLv03: zLv03,
      kantonsname: kantonsname,
      eWgs84: eWgs84,
      geopos: geopos,
      eLv03: eLv03,
      zWgs84: zWgs84,
      abkuerzung: abkuerzung,
      kantonskuerzel: kantonskuerzel,
      lod: lod,
      bezirksnum: bezirksnum,
      landIso2Geo: landIso2Geo,
      goNummer: goNummer,
      bpvhVerkehrsmittelTextDe: bpvhVerkehrsmittelTextDe,
      kantonsnum: kantonsnum,
      zLv95: zLv95,
      nWgs84: nWgs84,
      bezeichnungOffiziell: bezeichnungOffiziell,
      bfsNummer: bfsNummer,
      gemeindename: gemeindename,
      nLv03: nLv03,
      eLv95: eLv95,
      nLv95: nLv95,
      goAbkuerzungDe: goAbkuerzungDe,
      bezirksname: bezirksname,
      ortschaftsname: ortschaftsname,
      goBezeichnungDe: goBezeichnungDe,
      bpvhVerkehrsmittel: bpvhVerkehrsmittel,
      nummer: nummer,
      dstAbk: dstAbk,
      goIdentifikation: goIdentifikation,
    );
  }

// ignore: unused_element
  SbbFields fromJson(Map<String, Object> json) {
    return SbbFields.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SbbFields = _$SbbFieldsTearOff();

/// @nodoc
mixin _$SbbFields {
  int get bpuic;
  int get isHaltestelle;
  double get zLv03;
  String get kantonsname;
  double get eWgs84;
  List<double> get geopos;
  double get eLv03;
  double get zWgs84;
  String get abkuerzung;
  String get kantonskuerzel;
  String get lod;
  String get bezirksnum;
  String get landIso2Geo;
  int get goNummer;
  String get bpvhVerkehrsmittelTextDe;
  int get kantonsnum;
  double get zLv95;
  double get nWgs84;
  String get bezeichnungOffiziell;
  int get bfsNummer;
  String get gemeindename;
  double get nLv03;
  double get eLv95;
  double get nLv95;
  String get goAbkuerzungDe;
  String get bezirksname;
  String get ortschaftsname;
  String get goBezeichnungDe;
  String get bpvhVerkehrsmittel;
  int get nummer;
  String get dstAbk;
  int get goIdentifikation;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SbbFieldsCopyWith<SbbFields> get copyWith;
}

/// @nodoc
abstract class $SbbFieldsCopyWith<$Res> {
  factory $SbbFieldsCopyWith(SbbFields value, $Res Function(SbbFields) then) =
      _$SbbFieldsCopyWithImpl<$Res>;
  $Res call(
      {int bpuic,
      int isHaltestelle,
      double zLv03,
      String kantonsname,
      double eWgs84,
      List<double> geopos,
      double eLv03,
      double zWgs84,
      String abkuerzung,
      String kantonskuerzel,
      String lod,
      String bezirksnum,
      String landIso2Geo,
      int goNummer,
      String bpvhVerkehrsmittelTextDe,
      int kantonsnum,
      double zLv95,
      double nWgs84,
      String bezeichnungOffiziell,
      int bfsNummer,
      String gemeindename,
      double nLv03,
      double eLv95,
      double nLv95,
      String goAbkuerzungDe,
      String bezirksname,
      String ortschaftsname,
      String goBezeichnungDe,
      String bpvhVerkehrsmittel,
      int nummer,
      String dstAbk,
      int goIdentifikation});
}

/// @nodoc
class _$SbbFieldsCopyWithImpl<$Res> implements $SbbFieldsCopyWith<$Res> {
  _$SbbFieldsCopyWithImpl(this._value, this._then);

  final SbbFields _value;
  // ignore: unused_field
  final $Res Function(SbbFields) _then;

  @override
  $Res call({
    Object bpuic = freezed,
    Object isHaltestelle = freezed,
    Object zLv03 = freezed,
    Object kantonsname = freezed,
    Object eWgs84 = freezed,
    Object geopos = freezed,
    Object eLv03 = freezed,
    Object zWgs84 = freezed,
    Object abkuerzung = freezed,
    Object kantonskuerzel = freezed,
    Object lod = freezed,
    Object bezirksnum = freezed,
    Object landIso2Geo = freezed,
    Object goNummer = freezed,
    Object bpvhVerkehrsmittelTextDe = freezed,
    Object kantonsnum = freezed,
    Object zLv95 = freezed,
    Object nWgs84 = freezed,
    Object bezeichnungOffiziell = freezed,
    Object bfsNummer = freezed,
    Object gemeindename = freezed,
    Object nLv03 = freezed,
    Object eLv95 = freezed,
    Object nLv95 = freezed,
    Object goAbkuerzungDe = freezed,
    Object bezirksname = freezed,
    Object ortschaftsname = freezed,
    Object goBezeichnungDe = freezed,
    Object bpvhVerkehrsmittel = freezed,
    Object nummer = freezed,
    Object dstAbk = freezed,
    Object goIdentifikation = freezed,
  }) {
    return _then(_value.copyWith(
      bpuic: bpuic == freezed ? _value.bpuic : bpuic as int,
      isHaltestelle: isHaltestelle == freezed
          ? _value.isHaltestelle
          : isHaltestelle as int,
      zLv03: zLv03 == freezed ? _value.zLv03 : zLv03 as double,
      kantonsname:
          kantonsname == freezed ? _value.kantonsname : kantonsname as String,
      eWgs84: eWgs84 == freezed ? _value.eWgs84 : eWgs84 as double,
      geopos: geopos == freezed ? _value.geopos : geopos as List<double>,
      eLv03: eLv03 == freezed ? _value.eLv03 : eLv03 as double,
      zWgs84: zWgs84 == freezed ? _value.zWgs84 : zWgs84 as double,
      abkuerzung:
          abkuerzung == freezed ? _value.abkuerzung : abkuerzung as String,
      kantonskuerzel: kantonskuerzel == freezed
          ? _value.kantonskuerzel
          : kantonskuerzel as String,
      lod: lod == freezed ? _value.lod : lod as String,
      bezirksnum:
          bezirksnum == freezed ? _value.bezirksnum : bezirksnum as String,
      landIso2Geo:
          landIso2Geo == freezed ? _value.landIso2Geo : landIso2Geo as String,
      goNummer: goNummer == freezed ? _value.goNummer : goNummer as int,
      bpvhVerkehrsmittelTextDe: bpvhVerkehrsmittelTextDe == freezed
          ? _value.bpvhVerkehrsmittelTextDe
          : bpvhVerkehrsmittelTextDe as String,
      kantonsnum: kantonsnum == freezed ? _value.kantonsnum : kantonsnum as int,
      zLv95: zLv95 == freezed ? _value.zLv95 : zLv95 as double,
      nWgs84: nWgs84 == freezed ? _value.nWgs84 : nWgs84 as double,
      bezeichnungOffiziell: bezeichnungOffiziell == freezed
          ? _value.bezeichnungOffiziell
          : bezeichnungOffiziell as String,
      bfsNummer: bfsNummer == freezed ? _value.bfsNummer : bfsNummer as int,
      gemeindename: gemeindename == freezed
          ? _value.gemeindename
          : gemeindename as String,
      nLv03: nLv03 == freezed ? _value.nLv03 : nLv03 as double,
      eLv95: eLv95 == freezed ? _value.eLv95 : eLv95 as double,
      nLv95: nLv95 == freezed ? _value.nLv95 : nLv95 as double,
      goAbkuerzungDe: goAbkuerzungDe == freezed
          ? _value.goAbkuerzungDe
          : goAbkuerzungDe as String,
      bezirksname:
          bezirksname == freezed ? _value.bezirksname : bezirksname as String,
      ortschaftsname: ortschaftsname == freezed
          ? _value.ortschaftsname
          : ortschaftsname as String,
      goBezeichnungDe: goBezeichnungDe == freezed
          ? _value.goBezeichnungDe
          : goBezeichnungDe as String,
      bpvhVerkehrsmittel: bpvhVerkehrsmittel == freezed
          ? _value.bpvhVerkehrsmittel
          : bpvhVerkehrsmittel as String,
      nummer: nummer == freezed ? _value.nummer : nummer as int,
      dstAbk: dstAbk == freezed ? _value.dstAbk : dstAbk as String,
      goIdentifikation: goIdentifikation == freezed
          ? _value.goIdentifikation
          : goIdentifikation as int,
    ));
  }
}

/// @nodoc
abstract class _$SbbFieldsCopyWith<$Res> implements $SbbFieldsCopyWith<$Res> {
  factory _$SbbFieldsCopyWith(
          _SbbFields value, $Res Function(_SbbFields) then) =
      __$SbbFieldsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int bpuic,
      int isHaltestelle,
      double zLv03,
      String kantonsname,
      double eWgs84,
      List<double> geopos,
      double eLv03,
      double zWgs84,
      String abkuerzung,
      String kantonskuerzel,
      String lod,
      String bezirksnum,
      String landIso2Geo,
      int goNummer,
      String bpvhVerkehrsmittelTextDe,
      int kantonsnum,
      double zLv95,
      double nWgs84,
      String bezeichnungOffiziell,
      int bfsNummer,
      String gemeindename,
      double nLv03,
      double eLv95,
      double nLv95,
      String goAbkuerzungDe,
      String bezirksname,
      String ortschaftsname,
      String goBezeichnungDe,
      String bpvhVerkehrsmittel,
      int nummer,
      String dstAbk,
      int goIdentifikation});
}

/// @nodoc
class __$SbbFieldsCopyWithImpl<$Res> extends _$SbbFieldsCopyWithImpl<$Res>
    implements _$SbbFieldsCopyWith<$Res> {
  __$SbbFieldsCopyWithImpl(_SbbFields _value, $Res Function(_SbbFields) _then)
      : super(_value, (v) => _then(v as _SbbFields));

  @override
  _SbbFields get _value => super._value as _SbbFields;

  @override
  $Res call({
    Object bpuic = freezed,
    Object isHaltestelle = freezed,
    Object zLv03 = freezed,
    Object kantonsname = freezed,
    Object eWgs84 = freezed,
    Object geopos = freezed,
    Object eLv03 = freezed,
    Object zWgs84 = freezed,
    Object abkuerzung = freezed,
    Object kantonskuerzel = freezed,
    Object lod = freezed,
    Object bezirksnum = freezed,
    Object landIso2Geo = freezed,
    Object goNummer = freezed,
    Object bpvhVerkehrsmittelTextDe = freezed,
    Object kantonsnum = freezed,
    Object zLv95 = freezed,
    Object nWgs84 = freezed,
    Object bezeichnungOffiziell = freezed,
    Object bfsNummer = freezed,
    Object gemeindename = freezed,
    Object nLv03 = freezed,
    Object eLv95 = freezed,
    Object nLv95 = freezed,
    Object goAbkuerzungDe = freezed,
    Object bezirksname = freezed,
    Object ortschaftsname = freezed,
    Object goBezeichnungDe = freezed,
    Object bpvhVerkehrsmittel = freezed,
    Object nummer = freezed,
    Object dstAbk = freezed,
    Object goIdentifikation = freezed,
  }) {
    return _then(_SbbFields(
      bpuic: bpuic == freezed ? _value.bpuic : bpuic as int,
      isHaltestelle: isHaltestelle == freezed
          ? _value.isHaltestelle
          : isHaltestelle as int,
      zLv03: zLv03 == freezed ? _value.zLv03 : zLv03 as double,
      kantonsname:
          kantonsname == freezed ? _value.kantonsname : kantonsname as String,
      eWgs84: eWgs84 == freezed ? _value.eWgs84 : eWgs84 as double,
      geopos: geopos == freezed ? _value.geopos : geopos as List<double>,
      eLv03: eLv03 == freezed ? _value.eLv03 : eLv03 as double,
      zWgs84: zWgs84 == freezed ? _value.zWgs84 : zWgs84 as double,
      abkuerzung:
          abkuerzung == freezed ? _value.abkuerzung : abkuerzung as String,
      kantonskuerzel: kantonskuerzel == freezed
          ? _value.kantonskuerzel
          : kantonskuerzel as String,
      lod: lod == freezed ? _value.lod : lod as String,
      bezirksnum:
          bezirksnum == freezed ? _value.bezirksnum : bezirksnum as String,
      landIso2Geo:
          landIso2Geo == freezed ? _value.landIso2Geo : landIso2Geo as String,
      goNummer: goNummer == freezed ? _value.goNummer : goNummer as int,
      bpvhVerkehrsmittelTextDe: bpvhVerkehrsmittelTextDe == freezed
          ? _value.bpvhVerkehrsmittelTextDe
          : bpvhVerkehrsmittelTextDe as String,
      kantonsnum: kantonsnum == freezed ? _value.kantonsnum : kantonsnum as int,
      zLv95: zLv95 == freezed ? _value.zLv95 : zLv95 as double,
      nWgs84: nWgs84 == freezed ? _value.nWgs84 : nWgs84 as double,
      bezeichnungOffiziell: bezeichnungOffiziell == freezed
          ? _value.bezeichnungOffiziell
          : bezeichnungOffiziell as String,
      bfsNummer: bfsNummer == freezed ? _value.bfsNummer : bfsNummer as int,
      gemeindename: gemeindename == freezed
          ? _value.gemeindename
          : gemeindename as String,
      nLv03: nLv03 == freezed ? _value.nLv03 : nLv03 as double,
      eLv95: eLv95 == freezed ? _value.eLv95 : eLv95 as double,
      nLv95: nLv95 == freezed ? _value.nLv95 : nLv95 as double,
      goAbkuerzungDe: goAbkuerzungDe == freezed
          ? _value.goAbkuerzungDe
          : goAbkuerzungDe as String,
      bezirksname:
          bezirksname == freezed ? _value.bezirksname : bezirksname as String,
      ortschaftsname: ortschaftsname == freezed
          ? _value.ortschaftsname
          : ortschaftsname as String,
      goBezeichnungDe: goBezeichnungDe == freezed
          ? _value.goBezeichnungDe
          : goBezeichnungDe as String,
      bpvhVerkehrsmittel: bpvhVerkehrsmittel == freezed
          ? _value.bpvhVerkehrsmittel
          : bpvhVerkehrsmittel as String,
      nummer: nummer == freezed ? _value.nummer : nummer as int,
      dstAbk: dstAbk == freezed ? _value.dstAbk : dstAbk as String,
      goIdentifikation: goIdentifikation == freezed
          ? _value.goIdentifikation
          : goIdentifikation as int,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_SbbFields implements _SbbFields {
  _$_SbbFields(
      {this.bpuic,
      this.isHaltestelle,
      this.zLv03,
      this.kantonsname,
      this.eWgs84,
      this.geopos,
      this.eLv03,
      this.zWgs84,
      this.abkuerzung,
      this.kantonskuerzel,
      this.lod,
      this.bezirksnum,
      this.landIso2Geo,
      this.goNummer,
      this.bpvhVerkehrsmittelTextDe,
      this.kantonsnum,
      this.zLv95,
      this.nWgs84,
      this.bezeichnungOffiziell,
      this.bfsNummer,
      this.gemeindename,
      this.nLv03,
      this.eLv95,
      this.nLv95,
      this.goAbkuerzungDe,
      this.bezirksname,
      this.ortschaftsname,
      this.goBezeichnungDe,
      this.bpvhVerkehrsmittel,
      this.nummer,
      this.dstAbk,
      this.goIdentifikation});

  factory _$_SbbFields.fromJson(Map<String, dynamic> json) =>
      _$_$_SbbFieldsFromJson(json);

  @override
  final int bpuic;
  @override
  final int isHaltestelle;
  @override
  final double zLv03;
  @override
  final String kantonsname;
  @override
  final double eWgs84;
  @override
  final List<double> geopos;
  @override
  final double eLv03;
  @override
  final double zWgs84;
  @override
  final String abkuerzung;
  @override
  final String kantonskuerzel;
  @override
  final String lod;
  @override
  final String bezirksnum;
  @override
  final String landIso2Geo;
  @override
  final int goNummer;
  @override
  final String bpvhVerkehrsmittelTextDe;
  @override
  final int kantonsnum;
  @override
  final double zLv95;
  @override
  final double nWgs84;
  @override
  final String bezeichnungOffiziell;
  @override
  final int bfsNummer;
  @override
  final String gemeindename;
  @override
  final double nLv03;
  @override
  final double eLv95;
  @override
  final double nLv95;
  @override
  final String goAbkuerzungDe;
  @override
  final String bezirksname;
  @override
  final String ortschaftsname;
  @override
  final String goBezeichnungDe;
  @override
  final String bpvhVerkehrsmittel;
  @override
  final int nummer;
  @override
  final String dstAbk;
  @override
  final int goIdentifikation;

  @override
  String toString() {
    return 'SbbFields(bpuic: $bpuic, isHaltestelle: $isHaltestelle, zLv03: $zLv03, kantonsname: $kantonsname, eWgs84: $eWgs84, geopos: $geopos, eLv03: $eLv03, zWgs84: $zWgs84, abkuerzung: $abkuerzung, kantonskuerzel: $kantonskuerzel, lod: $lod, bezirksnum: $bezirksnum, landIso2Geo: $landIso2Geo, goNummer: $goNummer, bpvhVerkehrsmittelTextDe: $bpvhVerkehrsmittelTextDe, kantonsnum: $kantonsnum, zLv95: $zLv95, nWgs84: $nWgs84, bezeichnungOffiziell: $bezeichnungOffiziell, bfsNummer: $bfsNummer, gemeindename: $gemeindename, nLv03: $nLv03, eLv95: $eLv95, nLv95: $nLv95, goAbkuerzungDe: $goAbkuerzungDe, bezirksname: $bezirksname, ortschaftsname: $ortschaftsname, goBezeichnungDe: $goBezeichnungDe, bpvhVerkehrsmittel: $bpvhVerkehrsmittel, nummer: $nummer, dstAbk: $dstAbk, goIdentifikation: $goIdentifikation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SbbFields &&
            (identical(other.bpuic, bpuic) ||
                const DeepCollectionEquality().equals(other.bpuic, bpuic)) &&
            (identical(other.isHaltestelle, isHaltestelle) ||
                const DeepCollectionEquality()
                    .equals(other.isHaltestelle, isHaltestelle)) &&
            (identical(other.zLv03, zLv03) ||
                const DeepCollectionEquality().equals(other.zLv03, zLv03)) &&
            (identical(other.kantonsname, kantonsname) ||
                const DeepCollectionEquality()
                    .equals(other.kantonsname, kantonsname)) &&
            (identical(other.eWgs84, eWgs84) ||
                const DeepCollectionEquality().equals(other.eWgs84, eWgs84)) &&
            (identical(other.geopos, geopos) ||
                const DeepCollectionEquality().equals(other.geopos, geopos)) &&
            (identical(other.eLv03, eLv03) ||
                const DeepCollectionEquality().equals(other.eLv03, eLv03)) &&
            (identical(other.zWgs84, zWgs84) ||
                const DeepCollectionEquality().equals(other.zWgs84, zWgs84)) &&
            (identical(other.abkuerzung, abkuerzung) ||
                const DeepCollectionEquality()
                    .equals(other.abkuerzung, abkuerzung)) &&
            (identical(other.kantonskuerzel, kantonskuerzel) ||
                const DeepCollectionEquality()
                    .equals(other.kantonskuerzel, kantonskuerzel)) &&
            (identical(other.lod, lod) ||
                const DeepCollectionEquality().equals(other.lod, lod)) &&
            (identical(other.bezirksnum, bezirksnum) ||
                const DeepCollectionEquality()
                    .equals(other.bezirksnum, bezirksnum)) &&
            (identical(other.landIso2Geo, landIso2Geo) ||
                const DeepCollectionEquality()
                    .equals(other.landIso2Geo, landIso2Geo)) &&
            (identical(other.goNummer, goNummer) ||
                const DeepCollectionEquality()
                    .equals(other.goNummer, goNummer)) &&
            (identical(other.bpvhVerkehrsmittelTextDe, bpvhVerkehrsmittelTextDe) ||
                const DeepCollectionEquality().equals(
                    other.bpvhVerkehrsmittelTextDe,
                    bpvhVerkehrsmittelTextDe)) &&
            (identical(other.kantonsnum, kantonsnum) ||
                const DeepCollectionEquality()
                    .equals(other.kantonsnum, kantonsnum)) &&
            (identical(other.zLv95, zLv95) ||
                const DeepCollectionEquality().equals(other.zLv95, zLv95)) &&
            (identical(other.nWgs84, nWgs84) ||
                const DeepCollectionEquality().equals(other.nWgs84, nWgs84)) &&
            (identical(other.bezeichnungOffiziell, bezeichnungOffiziell) ||
                const DeepCollectionEquality().equals(
                    other.bezeichnungOffiziell, bezeichnungOffiziell)) &&
            (identical(other.bfsNummer, bfsNummer) ||
                const DeepCollectionEquality()
                    .equals(other.bfsNummer, bfsNummer)) &&
            (identical(other.gemeindename, gemeindename) ||
                const DeepCollectionEquality()
                    .equals(other.gemeindename, gemeindename)) &&
            (identical(other.nLv03, nLv03) ||
                const DeepCollectionEquality().equals(other.nLv03, nLv03)) &&
            (identical(other.eLv95, eLv95) ||
                const DeepCollectionEquality().equals(other.eLv95, eLv95)) &&
            (identical(other.nLv95, nLv95) ||
                const DeepCollectionEquality().equals(other.nLv95, nLv95)) &&
            (identical(other.goAbkuerzungDe, goAbkuerzungDe) ||
                const DeepCollectionEquality()
                    .equals(other.goAbkuerzungDe, goAbkuerzungDe)) &&
            (identical(other.bezirksname, bezirksname) || const DeepCollectionEquality().equals(other.bezirksname, bezirksname)) &&
            (identical(other.ortschaftsname, ortschaftsname) || const DeepCollectionEquality().equals(other.ortschaftsname, ortschaftsname)) &&
            (identical(other.goBezeichnungDe, goBezeichnungDe) || const DeepCollectionEquality().equals(other.goBezeichnungDe, goBezeichnungDe)) &&
            (identical(other.bpvhVerkehrsmittel, bpvhVerkehrsmittel) || const DeepCollectionEquality().equals(other.bpvhVerkehrsmittel, bpvhVerkehrsmittel)) &&
            (identical(other.nummer, nummer) || const DeepCollectionEquality().equals(other.nummer, nummer)) &&
            (identical(other.dstAbk, dstAbk) || const DeepCollectionEquality().equals(other.dstAbk, dstAbk)) &&
            (identical(other.goIdentifikation, goIdentifikation) || const DeepCollectionEquality().equals(other.goIdentifikation, goIdentifikation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bpuic) ^
      const DeepCollectionEquality().hash(isHaltestelle) ^
      const DeepCollectionEquality().hash(zLv03) ^
      const DeepCollectionEquality().hash(kantonsname) ^
      const DeepCollectionEquality().hash(eWgs84) ^
      const DeepCollectionEquality().hash(geopos) ^
      const DeepCollectionEquality().hash(eLv03) ^
      const DeepCollectionEquality().hash(zWgs84) ^
      const DeepCollectionEquality().hash(abkuerzung) ^
      const DeepCollectionEquality().hash(kantonskuerzel) ^
      const DeepCollectionEquality().hash(lod) ^
      const DeepCollectionEquality().hash(bezirksnum) ^
      const DeepCollectionEquality().hash(landIso2Geo) ^
      const DeepCollectionEquality().hash(goNummer) ^
      const DeepCollectionEquality().hash(bpvhVerkehrsmittelTextDe) ^
      const DeepCollectionEquality().hash(kantonsnum) ^
      const DeepCollectionEquality().hash(zLv95) ^
      const DeepCollectionEquality().hash(nWgs84) ^
      const DeepCollectionEquality().hash(bezeichnungOffiziell) ^
      const DeepCollectionEquality().hash(bfsNummer) ^
      const DeepCollectionEquality().hash(gemeindename) ^
      const DeepCollectionEquality().hash(nLv03) ^
      const DeepCollectionEquality().hash(eLv95) ^
      const DeepCollectionEquality().hash(nLv95) ^
      const DeepCollectionEquality().hash(goAbkuerzungDe) ^
      const DeepCollectionEquality().hash(bezirksname) ^
      const DeepCollectionEquality().hash(ortschaftsname) ^
      const DeepCollectionEquality().hash(goBezeichnungDe) ^
      const DeepCollectionEquality().hash(bpvhVerkehrsmittel) ^
      const DeepCollectionEquality().hash(nummer) ^
      const DeepCollectionEquality().hash(dstAbk) ^
      const DeepCollectionEquality().hash(goIdentifikation);

  @JsonKey(ignore: true)
  @override
  _$SbbFieldsCopyWith<_SbbFields> get copyWith =>
      __$SbbFieldsCopyWithImpl<_SbbFields>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SbbFieldsToJson(this);
  }
}

abstract class _SbbFields implements SbbFields {
  factory _SbbFields(
      {int bpuic,
      int isHaltestelle,
      double zLv03,
      String kantonsname,
      double eWgs84,
      List<double> geopos,
      double eLv03,
      double zWgs84,
      String abkuerzung,
      String kantonskuerzel,
      String lod,
      String bezirksnum,
      String landIso2Geo,
      int goNummer,
      String bpvhVerkehrsmittelTextDe,
      int kantonsnum,
      double zLv95,
      double nWgs84,
      String bezeichnungOffiziell,
      int bfsNummer,
      String gemeindename,
      double nLv03,
      double eLv95,
      double nLv95,
      String goAbkuerzungDe,
      String bezirksname,
      String ortschaftsname,
      String goBezeichnungDe,
      String bpvhVerkehrsmittel,
      int nummer,
      String dstAbk,
      int goIdentifikation}) = _$_SbbFields;

  factory _SbbFields.fromJson(Map<String, dynamic> json) =
      _$_SbbFields.fromJson;

  @override
  int get bpuic;
  @override
  int get isHaltestelle;
  @override
  double get zLv03;
  @override
  String get kantonsname;
  @override
  double get eWgs84;
  @override
  List<double> get geopos;
  @override
  double get eLv03;
  @override
  double get zWgs84;
  @override
  String get abkuerzung;
  @override
  String get kantonskuerzel;
  @override
  String get lod;
  @override
  String get bezirksnum;
  @override
  String get landIso2Geo;
  @override
  int get goNummer;
  @override
  String get bpvhVerkehrsmittelTextDe;
  @override
  int get kantonsnum;
  @override
  double get zLv95;
  @override
  double get nWgs84;
  @override
  String get bezeichnungOffiziell;
  @override
  int get bfsNummer;
  @override
  String get gemeindename;
  @override
  double get nLv03;
  @override
  double get eLv95;
  @override
  double get nLv95;
  @override
  String get goAbkuerzungDe;
  @override
  String get bezirksname;
  @override
  String get ortschaftsname;
  @override
  String get goBezeichnungDe;
  @override
  String get bpvhVerkehrsmittel;
  @override
  int get nummer;
  @override
  String get dstAbk;
  @override
  int get goIdentifikation;
  @override
  @JsonKey(ignore: true)
  _$SbbFieldsCopyWith<_SbbFields> get copyWith;
}

SbbGeometry _$SbbGeometryFromJson(Map<String, dynamic> json) {
  return _SbbGeometry.fromJson(json);
}

/// @nodoc
class _$SbbGeometryTearOff {
  const _$SbbGeometryTearOff();

// ignore: unused_element
  _SbbGeometry call({String type, List<double> coordinates}) {
    return _SbbGeometry(
      type: type,
      coordinates: coordinates,
    );
  }

// ignore: unused_element
  SbbGeometry fromJson(Map<String, Object> json) {
    return SbbGeometry.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SbbGeometry = _$SbbGeometryTearOff();

/// @nodoc
mixin _$SbbGeometry {
  String get type;
  List<double> get coordinates;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SbbGeometryCopyWith<SbbGeometry> get copyWith;
}

/// @nodoc
abstract class $SbbGeometryCopyWith<$Res> {
  factory $SbbGeometryCopyWith(
          SbbGeometry value, $Res Function(SbbGeometry) then) =
      _$SbbGeometryCopyWithImpl<$Res>;
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class _$SbbGeometryCopyWithImpl<$Res> implements $SbbGeometryCopyWith<$Res> {
  _$SbbGeometryCopyWithImpl(this._value, this._then);

  final SbbGeometry _value;
  // ignore: unused_field
  final $Res Function(SbbGeometry) _then;

  @override
  $Res call({
    Object type = freezed,
    Object coordinates = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed ? _value.type : type as String,
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates as List<double>,
    ));
  }
}

/// @nodoc
abstract class _$SbbGeometryCopyWith<$Res>
    implements $SbbGeometryCopyWith<$Res> {
  factory _$SbbGeometryCopyWith(
          _SbbGeometry value, $Res Function(_SbbGeometry) then) =
      __$SbbGeometryCopyWithImpl<$Res>;
  @override
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class __$SbbGeometryCopyWithImpl<$Res> extends _$SbbGeometryCopyWithImpl<$Res>
    implements _$SbbGeometryCopyWith<$Res> {
  __$SbbGeometryCopyWithImpl(
      _SbbGeometry _value, $Res Function(_SbbGeometry) _then)
      : super(_value, (v) => _then(v as _SbbGeometry));

  @override
  _SbbGeometry get _value => super._value as _SbbGeometry;

  @override
  $Res call({
    Object type = freezed,
    Object coordinates = freezed,
  }) {
    return _then(_SbbGeometry(
      type: type == freezed ? _value.type : type as String,
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates as List<double>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SbbGeometry implements _SbbGeometry {
  _$_SbbGeometry({this.type, this.coordinates});

  factory _$_SbbGeometry.fromJson(Map<String, dynamic> json) =>
      _$_$_SbbGeometryFromJson(json);

  @override
  final String type;
  @override
  final List<double> coordinates;

  @override
  String toString() {
    return 'SbbGeometry(type: $type, coordinates: $coordinates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SbbGeometry &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.coordinates, coordinates) ||
                const DeepCollectionEquality()
                    .equals(other.coordinates, coordinates)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(coordinates);

  @JsonKey(ignore: true)
  @override
  _$SbbGeometryCopyWith<_SbbGeometry> get copyWith =>
      __$SbbGeometryCopyWithImpl<_SbbGeometry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SbbGeometryToJson(this);
  }
}

abstract class _SbbGeometry implements SbbGeometry {
  factory _SbbGeometry({String type, List<double> coordinates}) =
      _$_SbbGeometry;

  factory _SbbGeometry.fromJson(Map<String, dynamic> json) =
      _$_SbbGeometry.fromJson;

  @override
  String get type;
  @override
  List<double> get coordinates;
  @override
  @JsonKey(ignore: true)
  _$SbbGeometryCopyWith<_SbbGeometry> get copyWith;
}
