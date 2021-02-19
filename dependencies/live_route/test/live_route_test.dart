import 'package:flutter_test/flutter_test.dart';
import 'package:live_route/lazy.dart';

void main() {
  test('lazy value', () {
    var i = 0;
    final n = Lazy(() => i++)();
    final n2 = () => i++.lazy();
    expect(n, 0);
    expect(n2, 1);
    expect(n, 0);
    expect(n2, 1);
  });
}
