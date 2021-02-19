import 'dart:collection';

import 'package:collection/collection.dart';

class UnmodifiableMap<R, S> extends MapView<R, S> with UnmodifiableMapMixin<R, S> {
  const UnmodifiableMap(Map<R, S> map) : super(map);
}
