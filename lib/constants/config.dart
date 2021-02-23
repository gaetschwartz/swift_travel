import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.freezed.dart';
part 'config.g.dart';

final configProvider = FutureProvider<Config>((ref) async {
  final string = await rootBundle.loadString('assets/config.json');
  final json = jsonDecode(string) as Map;
  return Config.fromJson(json as Map<String, dynamic>);
});

@freezed
class Config with _$Config {
  const factory Config({
    String? sncfKey,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}
