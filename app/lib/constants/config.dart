import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@riverpod
Future<Config> config(ConfigRef ref) async {
  final content = await rootBundle.loadString('assets/config.json');
  final json = jsonDecode(content) as Map<String, dynamic>;
  final config = Config.fromJson(json);
  return config;
}

@freezed
class Config with _$Config {
  const factory Config({
    String? sncfKey,
    String? triasKey,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}
