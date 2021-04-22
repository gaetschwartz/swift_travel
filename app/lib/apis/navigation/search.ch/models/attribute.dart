import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribute.freezed.dart';

@freezed
class Attribute with _$Attribute {
  const factory Attribute({
    required String code,
    Widget? icon,
    String? message,
    @Default(false) bool ignore,
  }) = _Attribute;

  static const attributes = <String, Attribute>{
    '1_1.1_OM': Attribute(code: '1_1.1_OM', icon: Icon(Icons.masks_rounded)),
    '0_1.4_WR': Attribute(code: '0_1.4_WR', icon: Icon(Icons.restaurant)),
    '0_4.8_RZ': Attribute(code: '0_4.8_RZ', icon: Icon(CupertinoIcons.volume_off)),
    '0_8.1_R': Attribute(code: '0_8.1_R', icon: Icon(CupertinoIcons.cart_fill)),
    '1_1.1_TT':
        Attribute(code: '1_1.1_TT', icon: Icon(CupertinoIcons.train_style_two), ignore: true),
    '1_4.6_FZ': Attribute(code: '1_4.6_FZ', icon: Icon(Icons.toys)),
    '1_4.7_BZ': Attribute(code: '1_4.7_BZ', icon: Icon(CupertinoIcons.briefcase_fill)),
    '1_4.7_FS': Attribute(code: '1_4.7_FS', icon: Icon(CupertinoIcons.wifi)),
    '1_4.6_FA': Attribute(code: '1_4.6_FA', icon: Icon(Icons.family_restroom)),
    '1_2.2_BK': Attribute(code: '1_2.2_BK', icon: Icon(CupertinoIcons.tickets)),
    '0_2.4_WS': Attribute(code: '0_2.4_WS', icon: Icon(Icons.local_bar)),
    '0_6.5_VN': Attribute(code: '0_6.5_VN', icon: Icon(Icons.pedal_bike)),
    '0_6.6_VR': Attribute(code: '0_6.6_VR', icon: Icon(Icons.pedal_bike)),
    '1_6.5_VI': Attribute(code: '1_6.5_VI', icon: Icon(Icons.pedal_bike)),
    '1_0_NF': Attribute(code: '1_0_NF', icon: Icon(Icons.subdirectory_arrow_right_rounded)),
    '1_0_BE': Attribute(code: '1_0_BE', icon: Icon(Icons.railway_alert), ignore: true),
    '0_8.4_PL': Attribute(code: '0_8.4_PL', icon: Icon(Icons.format_list_numbered)),
    '0_6.3_GR': Attribute(code: '0_6.3_GR', icon: Icon(CupertinoIcons.group_solid)),
    '1_6.5_VB': Attribute(code: '1_6.5_VB', icon: Icon(Icons.pedal_bike)),
    '0_2.7_MI': Attribute(code: '0_2.7_MI', icon: Icon(Icons.restaurant)),
    '0_1.6_2': Attribute(code: '0_1.6_2', icon: Icon(FluentIcons.ticket_24_regular))
  };

  static const defaultIcon = Icon(CupertinoIcons.exclamationmark_bubble);
}
