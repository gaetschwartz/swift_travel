import 'package:flutter/foundation.dart';
import 'package:swift_travel/blocs/links.dart';

@visibleForTesting
int encodeArgsToInt(List<bool> values) {
  var out = 0;

  for (var i = 0; i < values.length; i++) {
    out |= values[i].toInt() << i;
  }

  return out;
}

@visibleForTesting
List<bool> decodeIntToArgs(int input, int length) {
  final out = <bool>[];

  for (var i = 0; i < length; i++) {
    out.add((1 << i) & input == 1 << i);
  }

  return out;
}

extension BoolX on bool {
  int toInt() => this ? 1 : 0;
}

Map<String, String> decodeRouteUri(Uri uri) {
  final oldParams = Map.from(uri.queryParameters).cast<String, String>();
  oldParams.remove('i');

  final params = <String, String>{};

  final date = parseDateTime(oldParams);

  oldParams.remove('dtm');

  for (final e in oldParams.entries) {
    params[translate[e.key] ?? e.key] = translate[e.value] ?? e.value;
  }

  params['date'] = '${date.month}/${date.day}/${date.year}';
  params['time'] = '${date.hour}:${date.minute}';

  if (!params.containsKey('from') ||
      !params.containsKey('to') ||
      !uri.queryParameters.containsKey('i')) {
    throw InvalidRouteException(uri.queryParameters);
  }
  return params;
}

DateTime parseDateTime(Map<String, String> oldParams) {
  final millis = int.parse(oldParams['dtm'], radix: 32) * 1000;
  return DateTime.fromMillisecondsSinceEpoch(millis);
}

Map<String, String> encodeRouteUri(Uri uri, int i) {
  final params = <String, String>{};
  final oldParams = Map.from(uri.queryParameters).cast<String, String>();

  final date = oldParams['date'].split('/');
  if (date.length != 3) throw FormatException('Date is supposed to contain 3 parts');
  final time = oldParams['time'].split(':');
  if (time.length != 2) throw FormatException('Time is supposed to contain 2 parts');

  final year = int.parse(date[2]);
  final month = int.parse(date[0]);
  final day = int.parse(date[1]);

  final datetime = DateTime(
    year,
    month,
    day,
    int.parse(time[0]),
    int.parse(time[1]),
  );

  oldParams.remove('time');
  oldParams.remove('date');

  for (final e in oldParams.entries) {
    final newKey =
        translate.entries.firstWhere((e2) => e.key == e2.value, orElse: () => null)?.key ?? e.key;
    final newValue =
        translate.entries.firstWhere((e2) => e.value == e2.value, orElse: () => null)?.key ??
            e.value;
    params[newKey] = newValue;
  }

  final d = datetime.millisecondsSinceEpoch ~/ 1000;

  params['dtm'] = d.toRadixString(32);
  params['i'] = i.toString();
  return params;
}

const translate = <String, String>{
  'fr': 'from',
  'dt': 'date',
  'to': 'to',
  'tt': 'time_type',
  'stc': 'show_trackchanges',
  'sd': 'show_delays',
  'dpt': 'depart',
  'arv': 'arrival',
  'time': 'tm',
};
