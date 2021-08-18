mixin SbbDisplayNameMixin {
  String get name;
  String get displayName {
    final indexOf = name.indexOf("@");
    return indexOf >= 0 ? name.substring(0, indexOf).trim() : name;
  }
}
