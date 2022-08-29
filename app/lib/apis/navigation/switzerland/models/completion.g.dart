// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbCompletion _$$_SbbCompletionFromJson(Map<String, dynamic> json) =>
    _$_SbbCompletion(
      label: json['label'] as String,
      dist: (json['dist'] as num?)?.toDouble(),
      iconClass: json['iconclass'] as String?,
      html: json['html'] as String?,
      id: json['id'] as String?,
      favoriteName: json['favoriteName'] as String?,
      origin: $enumDecodeNullable(_$DataOriginEnumMap, json['origin']) ??
          DataOrigin.data,
    );

Map<String, dynamic> _$$_SbbCompletionToJson(_$_SbbCompletion instance) {
  final val = <String, dynamic>{
    'label': instance.label,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dist', instance.dist);
  writeNotNull('iconclass', instance.iconClass);
  writeNotNull('html', instance.html);
  writeNotNull('id', instance.id);
  writeNotNull('favoriteName', instance.favoriteName);
  val['origin'] = _$DataOriginEnumMap[instance.origin]!;
  return val;
}

const _$DataOriginEnumMap = {
  DataOrigin.favorites: 'favorites',
  DataOrigin.history: 'history',
  DataOrigin.data: 'data',
  DataOrigin.currentLocation: 'currentLocation',
  DataOrigin.prediction: 'prediction',
  DataOrigin.loading: 'loading',
  DataOrigin.contacts: 'contacts',
};
