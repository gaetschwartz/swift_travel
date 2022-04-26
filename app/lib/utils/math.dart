import 'dart:math' as math;

class Sum {
  final List<Addend> addends = [];
  final bool squareRoot;

  Sum({this.squareRoot = false});

  void add(Addend addend) => addends.add(addend);

  /// Returns the sum, computionnally expensive so only used once all addends are added.
  double get value => addends.fold(
      0,
      squareRoot
          ? (previousValue, element) => previousValue + math.sqrt(element.value)
          : (previousValue, element) => previousValue + (element.value));

  String get overview {
    final s = value;
    final b =
        StringBuffer("  Sum: ${value.toStringAsPrecision(4)}\n  Overview:\n");
    for (var i = 0; i < addends.length; i++) {
      final a = addends[i];
      b.writeln(
          "    ${a.name}: \t ${a.repr} (${(a.value * 100 / s).toStringAsFixed(2)}%)");
    }
    return b.toString();
  }

  ComputedSum get computed => ComputedSum.fromSum(this);
}

class ComputedSum extends Sum {
  ComputedSum.fromSum(Sum sum)
      : _addends = List.unmodifiable(sum.addends),
        super(squareRoot: sum.squareRoot);

  ComputedSum.fromAddends(List<Addend> addends, {bool squareRoot = false})
      : _addends = List.unmodifiable(addends),
        super(squareRoot: squareRoot);

  final List<Addend> _addends;

  @override
  List<Addend> get addends => _addends;

  @override
  late final double value = _value;
  double get _value => super.value;

  @override
  void add(Addend addend) {
    throw UnsupportedError("Can't add on a Computed sum");
  }
}

abstract class Addend {
  const Addend(this.name);

  double get value;
  final String name;

  String get repr;
}

class WeighedAddend extends Addend {
  const WeighedAddend(this._value, this.weight, String name) : super(name);

  final double _value;
  final double weight;

  @override
  double get value => _value * weight;

  @override
  String toString() {
    return "WeighedAddend($_value, $weight, $name)";
  }

  @override
  String get repr =>
      "${_value.toStringAsFixed(3)}*${weight.toStringAsFixed(3)}=${value.toStringAsFixed(3)}";
}
