import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/page_not_found.dart';
import 'package:swift_travel/utils/env.dart';
import 'package:vibration/vibration.dart';

void reportDartError(Object e, StackTrace s,
    {String name = '', String reason = '', bool showSnackbar = true}) {
  if (kDebugMode) {
    debugPrintStack(stackTrace: s, label: '[$name] $e $reason');
  }
  if (showSnackbar && (!kDebugMode || Env.doShowErrors)) {
    Vibration.error();
    final details = FlutterErrorDetails(
      exception: e,
      stack: s,
      context: ErrorDescription(reason),
      library: name,
    );
    scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
      content: const Text('The app encountered an issue.'),
      action: SnackBarAction(
        key: Key(details.hashCode.toRadixString(16)),
        label: 'Details',
        onPressed: () {
          scaffoldMessengerKey.currentState.removeCurrentSnackBar();
          navigatorKey.currentState
              .push(MaterialWithModalsPageRoute(builder: (_) => ErrorPage(details)));
        },
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
      key: Key(details.hashCode.toRadixString(16)),
      content: const Text('The app encountered an issue.'),
      action: SnackBarAction(
        label: 'Details',
        onPressed: () {
          scaffoldMessengerKey.currentState.removeCurrentSnackBar();
          navigatorKey.currentState
              .push(MaterialWithModalsPageRoute(builder: (_) => ErrorPage(details)));
        },
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
    return Theme(
      data: ThemeData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Something went wrong'),
          leading: const CloseButton(),
          actions: [
            IconButton(
                icon: _wrapped
                    ? const Icon(Icons.wrap_text)
                    : const Icon(CupertinoIcons.text_badge_checkmark),
                onPressed: () => setState(() => _wrapped = !_wrapped))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListView(
            children: [
              ErrorDataWidget(
                'Exception:',
                widget.details.exceptionAsString(),
                wrapped: _wrapped,
              ),
              ErrorDataWidget(
                'Context:',
                widget.details.context.toString(),
                wrapped: _wrapped,
              ),
              ErrorDataWidget(
                'Library:',
                widget.details.library,
                wrapped: _wrapped,
              ),
              ErrorDataWidget(
                'StackTrace:',
                widget.details.stack.toString(),
                wrapped: _wrapped,
              ),
              ErrorDataWidget(
                'Silent:',
                widget.details.silent.toString(),
                wrapped: _wrapped,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
