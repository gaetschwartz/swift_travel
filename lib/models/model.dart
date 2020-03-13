import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:travel_free/api/cff.dart';

class Model {
  static Model get i => Injector.get<Model>();
  final CFF cff = CFF();
}
