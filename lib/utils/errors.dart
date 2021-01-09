import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/utils/env.dart';
import 'package:vibration/vibration.dart';

void reportDartError(Object e, StackTrace s,
    {String name = '', String reason = '', bool showSnackbar = true}) {
  if (kDebugMode) {
    debugPrintStack(stackTrace: s, label: '[$name] $e $reason');
  }
  if (showSnackbar && (!kDebugMode || Env.doShowErrors)) {
    Vibration.error();
    scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
      content: Text('$e'),
      action: SnackBarAction(
        label: 'Details',
        onPressed: () => navigatorKey.currentState.push(MaterialWithModalsPageRoute(
            builder: (_) => ErrorPage(FlutterErrorDetails(
                  exception: e,
                  stack: s,
                  context: ErrorDescription(reason),
                  library: name,
                )))),
      ),
    ));
  }

  if (Firebase.apps.isNotEmpty) {
    FirebaseCrashlytics.instance.recordError(e, s, reason: reason, printDetails: false);
  }
}

void reportFlutterError(FlutterErrorDetails details) {
  if (kDebugMode) {
    debugPrintStack(stackTrace: details.stack, label: details.exception.toString());
  }
  if (!kDebugMode || Env.doShowErrors) {
    Vibration.error();
    scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
      content: Text(details.exception.toString()),
      action: SnackBarAction(
        label: 'Details',
        onPressed: () => navigatorKey.currentState
            .push(MaterialWithModalsPageRoute(builder: (_) => ErrorPage(details))),
      ),
    ));
  }
  if (Firebase.apps.isNotEmpty) FirebaseCrashlytics.instance.recordFlutterError(details);
}

class ErrorPage extends StatefulWidget {
  const ErrorPage(
    this.details, {
    Key key,
  }) : super(key: key);

  final FlutterErrorDetails details;

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  bool _wrapped = true;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      widget.details.stack.toString(),
      style: Theme.of(context)
          .textTheme
          .bodyText2
          .copyWith(fontFamily: GoogleFonts.firaCode().fontFamily, fontSize: 12),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.details.library ?? "Unknown library"),
        actions: [
          IconButton(
              icon: _wrapped ? Icon(Icons.wrap_text) : Icon(Icons.wrap_text_outlined),
              onPressed: () => setState(() => _wrapped = !_wrapped))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              'The app encountered an issue, here are some details for the developer.',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 12),
            Text.rich(
              TextSpan(text: '${widget.details.exception} ', children: [
                TextSpan(
                  text: widget.details.context.toDescription(),
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
              ]),
              style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
                margin: EdgeInsets.all(4),
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _wrapped
                      ? text
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: text,
                        ),
                )),
          ],
        ),
      ),
    );
  }
}
