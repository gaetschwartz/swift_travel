mixin SbbDisplayNameMixin {
  String get name;
  String get displayName => name.split('@').first;
}
