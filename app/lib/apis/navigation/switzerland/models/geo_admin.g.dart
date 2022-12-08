// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchCompletion _$$_SearchCompletionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SearchCompletion',
      json,
      ($checkedConvert) {
        final val = _$_SearchCompletion(
          label: $checkedConvert('label', (v) => v as String?),
          html: $checkedConvert('html', (v) => v as String?),
          iconclass: $checkedConvert('iconclass', (v) => v as String?),
          corrected: $checkedConvert('corrected', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_SearchCompletionToJson(_$_SearchCompletion instance) =>
    <String, dynamic>{
      'label': instance.label,
      'html': instance.html,
      'iconclass': instance.iconclass,
      'corrected': instance.corrected,
    };

_$_GeoAdminResult _$$_GeoAdminResultFromJson(Map<String, dynamic> json) =>
    _$_GeoAdminResult(
      intId: json['id'] as int,
      weight: json['weight'] as int? ?? 0,
      attrs: GeoAdminAttributes.fromJson(json['attrs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GeoAdminResultToJson(_$_GeoAdminResult instance) =>
    <String, dynamic>{
      'id': instance.intId,
      'weight': instance.weight,
      'attrs': instance.attrs.toJson(),
    };

_$_GeoAdminAttributes _$$_GeoAdminAttributesFromJson(
        Map<String, dynamic> json) =>
    _$_GeoAdminAttributes(
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

Map<String, dynamic> _$$_GeoAdminAttributesToJson(
        _$_GeoAdminAttributes instance) =>
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
