import 'dart:developer';

import 'package:share/share.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';
import 'package:swift_travel/constants/constants.dart';

Future<void> shareRoute(CffRoute route, int i) async {
  final String requestUrl = route.requestUrl;
  final Uri uri = Uri.parse(requestUrl);
  final Map<String, String> params = Map.from(uri.queryParameters);
  params["i"] = i.toString();
  final Uri sharedUri = Uri(scheme: urlScheme, host: "route", queryParameters: params);
  log(sharedUri.toString());

  try {
    Share.share(sharedUri.toString());
  } on Exception catch (_) {
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //  content: Text(e.toString()),
    //));
  }
}

// const _translate = <String, String>{"route": "r", "from": "fr"};
