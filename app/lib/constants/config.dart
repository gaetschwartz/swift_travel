import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.freezed.dart';
part 'config.g.dart';

final configProvider = FutureProvider<Config>((ref) async {
  const key = 'assets/config.json';
  final content = await rootBundle.loadString(key);
  if (content.isEmpty) {
    throw Exception('Config file provided at $key is empty.');
  }
  final json = jsonDecode(content) as Map<String, dynamic>;
  return Config.fromJson(json);
});

@freezed
class Config with _$Config {
  const factory Config({
    String? sncfKey,
    String? triasKey,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}
