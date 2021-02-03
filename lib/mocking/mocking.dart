import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mocking.g.dart';

@JsonLiteral('route.json', asConst: true)
const mockRoute = kDebugMode ? _$mockRouteJsonLiteral : null;
