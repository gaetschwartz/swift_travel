// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Config _$$_ConfigFromJson(Map<String, dynamic> json) => _$_Config(
      sncfKey: json['sncfKey'] as String?,
      triasKey: json['triasKey'] as String?,
    );

Map<String, dynamic> _$$_ConfigToJson(_$_Config instance) => <String, dynamic>{
      'sncfKey': instance.sncfKey,
      'triasKey': instance.triasKey,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$configHash() => r'2df2e7aec87e4c1b2d2e89bbeb85bb57c83f887c';

/// See also [config].
@ProviderFor(config)
final configProvider = AutoDisposeFutureProvider<Config>.internal(
  config,
  name: r'configProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$configHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConfigRef = AutoDisposeFutureProviderRef<Config>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
