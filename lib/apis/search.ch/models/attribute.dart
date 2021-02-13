import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribute.freezed.dart';

@freezed
abstract class Attribute with _$Attribute {
  const factory Attribute({required String code, Widget? icon, String? message}) = _Attribute;

  static const attributes = <String, Attribute>{
    '1_1.1_OM': Attribute(code: '1_1.1_OM', icon: Icon(Icons.masks_rounded)),
    '0_1.4_WR': Attribute(code: '0_1.4_WR', icon: Icon(Icons.restaurant)),
    '0_4.8_RZ': Attribute(code: '0_4.8_RZ', icon: Icon(CupertinoIcons.volume_off)),
    '0_8.1_R': Attribute(code: '0_8.1_R', icon: Icon(CupertinoIcons.cart_fill)),
    '1_1.1_TT': Attribute(code: '0_8.1_R', icon: Icon(CupertinoIcons.train_style_two)),
    '1_4.6_FZ': Attribute(code: '1_4.6_FZ', icon: Icon(Icons.toys)),
    '1_4.7_BZ': Attribute(code: '1_4.7_BZ', icon: Icon(CupertinoIcons.briefcase_fill)),
    '1_4.7_FS': Attribute(code: '1_4.7_FS', icon: Icon(CupertinoIcons.wifi)),
    '1_4.6_FA': Attribute(code: '1_4.6_FA', icon: Icon(Icons.family_restroom)),
    '1_2.2_BK': Attribute(code: '1_2.2_BK', icon: Icon(CupertinoIcons.ticket)),
  };
}
