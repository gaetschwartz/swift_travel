import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';

void main(List<String> arguments) async {
  var s = await fromCsv('assets/dataset.csv', columnDelimiter: '|');
  print(s.series.map((e) => e.name));
  print(s.rows.join('\n'));
  print(s.rows.map((e) => e.map((e2) => e2.runtimeType)).join('\n'));

  final cities = <String>{};

  for (var c in s.series.firstWhere((s) => s.name == 'src').data) {
    if (c is String) cities.add(c);
  }

  for (var c in s.series.firstWhere((s) => s.name == 'dest').data) {
    if (c is String) cities.add(c);
  }

  final citiesMap = <String, int>{};

  var i = 0;
  for (var c in cities) {
    citiesMap[c] = i;
    i++;
  }

  final samples = DataFrame.fromSeries(s.series.map((e) =>
      e.name == 'src' || e.name == 'dest' ? Series(e.name, e.data.map((d) => citiesMap[d])) : e));

  print(samples.series.map((e) => e.name));
  print(samples.rows.join('\n'));
  print(samples.rows.map((e) => e.map((e2) => e2.runtimeType)).join('\n'));

  final splits = splitData(samples, [3 / 4]);
  final validationData = splits[0];
  final testData = splits[1];

  final validator = CrossValidator.kFold(validationData, numberOfFolds: 5);

  final createClassifier = (DataFrame samples) => KnnClassifier(samples, 'dest', 3);

  final scores = await validator.evaluate(createClassifier, MetricType.accuracy);
  final accuracy = scores.mean();
  print('accuracy on k fold validation: ${accuracy.toStringAsFixed(2)}');

  final testSplits = splitData(testData, [3 / 4]);
  testSplits.map((e) => e.rows.length);
  final classifier = createClassifier(testSplits[0]);
  final finalScore = classifier.assess(testSplits[1], MetricType.accuracy);

  print(finalScore.toStringAsFixed(2)); // approx. 0.75
}
