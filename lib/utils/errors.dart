import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/404.dart';
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
      content: Text('The app encountered an issue.'),
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
      content: Text('The app encountered an issue.'),
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
        title: Text("Something went wrong"),
        leading: CloseButton(),
        actions: [
          IconButton(
              icon: _wrapped ? Icon(Icons.wrap_text) : Icon(CupertinoIcons.text_badge_checkmark),
              onPressed: () => setState(() => _wrapped = !_wrapped))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          children: [
            ErrorDataWidget(
              "Exception:",
              widget.details.exception.toString(),
              wrapped: _wrapped,
            ),
            ErrorDataWidget(
              "Context:",
              widget.details.context.toString(),
              wrapped: _wrapped,
            ),
            ErrorDataWidget(
              "Library:",
              widget.details.library,
              wrapped: _wrapped,
            ),
            ErrorDataWidget(
              "StackTrace:",
              widget.details.stack.toString(),
              wrapped: _wrapped,
            ),
            ErrorDataWidget(
              "Silent:",
              widget.details.silent.toString(),
              wrapped: _wrapped,
            ),
          ],
        ),
      ),
    );
  }
}
