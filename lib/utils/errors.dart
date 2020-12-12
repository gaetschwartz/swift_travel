import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/main.dart';
import 'package:vibration/vibration.dart';

void report(Object e, StackTrace s, {String name = "", String reason = ""}) {
  if (kDebugMode) debugPrintStack(stackTrace: s, label: "[$name] $reason: $e");

  Vibration.error();

  scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
    content: Text("$e"),
    action: SnackBarAction(
      label: "Details",
      onPressed: () {
        navigatorKey.currentState.push(MaterialPageRoute(
            builder: (context) => ErrorWidget(
                  FlutterErrorDetails(
                    exception: e,
                    stack: s,
                    context: ErrorDescription(reason),
                    library: name,
                  ),
                  isFlutter: false,
                ),
            fullscreenDialog: true));
      },
    ),
  ));

  if (Firebase.apps.isNotEmpty) {
    FirebaseCrashlytics.instance.recordError(e, s, reason: reason, printDetails: false);
  }
}

void reportFlutterError(FlutterErrorDetails details) {
  Vibration.error();

  scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
    content: Text(details.exception.toString()),
    action: SnackBarAction(
      label: "Details",
      onPressed: () {
        navigatorKey.currentState.push(
          MaterialPageRoute(
            builder: (context) => ErrorWidget(details, isFlutter: true),
            fullscreenDialog: true,
          ),
        );
      },
    ),
  ));

  FirebaseCrashlytics.instance.recordFlutterError(details);
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget(
    this.details, {
    Key key,
    @required this.isFlutter,
  }) : super(key: key);

  final FlutterErrorDetails details;
  final bool isFlutter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isFlutter ? "Flutter error" : "Dart error"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              "The app encountered an issue, here are some details for the developer.",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 12),
            Text.rich(
              TextSpan(text: "${details.exception} ", children: [
                TextSpan(
                  text: details.context.toDescription(),
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
              ]),
              style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    details.stack.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
