import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribute.freezed.dart';

@freezed
class Attribute with _$Attribute {
  factory Attribute({
    required String code,
    String? message,
  }) = _Attribute;
  Attribute._();

  factory Attribute.fromAttribute(MapEntry<String, String> e) =>
      Attribute(code: e.key, message: e.value);

  Widget? get icon => data.icon;
  bool get ignore => data.ignore;

  late final data = AttributeData.fromCode(code);
}

@freezed
class AttributeData with _$AttributeData {
  const factory AttributeData({
    Widget? icon,
    @Default(false) bool ignore,
  }) = _AttributeData;

  static AttributeData fromCode(String code) => _data[code] ?? const AttributeData();

  static bool isHandled(String code) => _data.containsKey(code);

  static const _data = <String, AttributeData>{
    '1_1.1_OM': AttributeData(icon: Icon(Icons.masks_rounded)),
    '0_1.4_WR': AttributeData(icon: Icon(Icons.restaurant)),
    '0_4.8_RZ': AttributeData(icon: Icon(CupertinoIcons.volume_off)),
    '0_8.1_R': AttributeData(icon: Icon(CupertinoIcons.cart_fill)),
    '1_1.1_TT': AttributeData(icon: Icon(CupertinoIcons.train_style_two), ignore: true),
    '1_4.6_FZ': AttributeData(icon: Icon(Icons.toys)),
    '1_4.7_BZ': AttributeData(icon: Icon(CupertinoIcons.briefcase_fill)),
    '1_4.7_FS': AttributeData(icon: Icon(CupertinoIcons.wifi)),
    '1_4.6_FA': AttributeData(icon: Icon(Icons.family_restroom)),
    '1_2.2_BK': AttributeData(icon: Icon(CupertinoIcons.tickets)),
    '0_2.4_WS': AttributeData(icon: Icon(Icons.local_bar)),
    '0_6.5_VN': AttributeData(icon: Icon(Icons.pedal_bike)),
    '0_6.6_VR': AttributeData(icon: Icon(Icons.pedal_bike)),
    '1_6.5_VI': AttributeData(icon: Icon(Icons.pedal_bike)),
    '1_0_NF': AttributeData(icon: Icon(Icons.subdirectory_arrow_right_rounded)),
    '1_0_BE': AttributeData(icon: Icon(Icons.railway_alert), ignore: true),
    '0_8.4_PL': AttributeData(icon: Icon(Icons.format_list_numbered)),
    '0_6.3_GR': AttributeData(icon: Icon(CupertinoIcons.group_solid)),
    '1_6.5_VB': AttributeData(icon: Icon(Icons.pedal_bike)),
    '0_2.7_MI': AttributeData(icon: Icon(Icons.restaurant)),
    '0_1.6_2': AttributeData(icon: Icon(CupertinoIcons.tickets)),
  };
}
