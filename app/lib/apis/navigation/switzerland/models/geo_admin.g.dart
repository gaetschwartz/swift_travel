// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchCompletionImpl _$$SearchCompletionImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SearchCompletionImpl',
      json,
      ($checkedConvert) {
        final val = _$SearchCompletionImpl(
          label: $checkedConvert('label', (v) => v as String?),
          html: $checkedConvert('html', (v) => v as String?),
          iconclass: $checkedConvert('iconclass', (v) => v as String?),
          corrected: $checkedConvert('corrected', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$SearchCompletionImplToJson(
        _$SearchCompletionImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'html': instance.html,
      'iconclass': instance.iconclass,
      'corrected': instance.corrected,
    };

_$GeoAdminResultImpl _$$GeoAdminResultImplFromJson(Map<String, dynamic> json) =>
    _$GeoAdminResultImpl(
      intId: json['id'] as int,
      weight: json['weight'] as int? ?? 0,
      attrs: GeoAdminAttributes.fromJson(json['attrs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GeoAdminResultImplToJson(
        _$GeoAdminResultImpl instance) =>
    <String, dynamic>{
      'id': instance.intId,
      'weight': instance.weight,
      'attrs': instance.attrs.toJson(),
    };

_$GeoAdminAttributesImpl _$$GeoAdminAttributesImplFromJson(
        Map<String, dynamic> json) =>
    _$GeoAdminAttributesImpl(
      origin: json['origin'] as String,
      featureId: json['featureId'] as String?,
      detail: json['detail'] as String,
      rank: json['rank'] as int,
      number: json['num'] as int?,
      y: (json['y'] as num).toDouble(),
      x: (json['x'] as num).toDouble(),
      zoomlevel: json['zoomlevel'] as int,
      htmlLabel: json['label'] as String,
    );

Map<String, dynamic> _$$GeoAdminAttributesImplToJson(
        _$GeoAdminAttributesImpl instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'featureId': instance.featureId,
      'detail': instance.detail,
      'rank': instance.rank,
      'num': instance.number,
      'y': instance.y,
      'x': instance.x,
      'zoomlevel': instance.zoomlevel,
      'label': instance.htmlLabel,
    };
