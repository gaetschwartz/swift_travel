import 'package:ml_algo/ml_algo.dart';
import 'package:ml_algo/src/model_selection/assessable.dart';
import 'package:ml_dataframe/ml_dataframe.dart';

Future<void> main(List<String> arguments) async {
  final s = await fromCsv('assets/dataset.csv', columnDelimiter: '|');

  final cities = <String>{};

  for (final c in s.series.firstWhere((s) => s.name == 'src').data) {
    if (c is String) {
      cities.add(c.trim());
    }
  }

  for (final c in s.series.firstWhere((s) => s.name == 'dest').data) {
    if (c is String) {
      cities.add(c.trim());
    }
  }

  final citiesMap = <String, int>{};

  var i = 0;
  for (final c in cities) {
    final name = c.trim();
    citiesMap[name] ??= i++;
  }

  print(citiesMap);

  /* for (final k in citiesMap.keys) {
    citiesMap[k] = 1 << citiesMap[k];
  }*/

  print(citiesMap);

  final samples = DataFrame.fromSeries(s.series.map((e) => e.name == 'src' || e.name == 'dest'
      ? Series(e.name, e.data.map<int>((dynamic d) => citiesMap[(d as String).trim()]),
          isDiscrete: true)
      : e));

  // print(samples.series.map((e) => e.name));
  // print(samples.rows.join('\n'));

  final splits = splitData(samples, [3 / 4]);
  final validationData = splits[0];
  final testData = splits[1];

  final validator = CrossValidator.kFold(validationData);

  Assessable createClassifier(DataFrame samples) => SoftmaxRegressor(samples, ['src', 'dest']);

  final scores = await validator.evaluate(createClassifier, MetricType.accuracy);
  final accuracy = scores.mean();
  print('accuracy on k fold validation: ${accuracy.toStringAsFixed(2)}');

  final testSplits = splitData(testData, [3 / 4])..map((e) => e.rows.length);
  final classifier = createClassifier(testSplits[0]);
  final finalScore = classifier.assess(testSplits[1], MetricType.accuracy);

  print(finalScore.toStringAsFixed(2)); // approx. 0.75
}
