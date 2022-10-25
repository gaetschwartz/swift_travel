library logging;

import 'package:gaets_logging/src/service.dart';

export 'src/consumer.dart';
export 'src/filter.dart';
export 'src/models.dart';
export 'src/printer.dart';
export 'src/service.dart';

extension FutureX<T> on Future<T> {
  Future<T> log({String? channel}) =>
      Logger.root.future(this, channel: channel);
}
