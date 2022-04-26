import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gaets_logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/page_not_found.dart';
import 'package:vibration/vibration.dart';

const _doShowSnackbars = !kDebugMode || Env.doShowErrors;

void ignoreError() {}

// ignore: avoid_void_async
void reportDartError(
  Object e,
  StackTrace s, {
  String library = '',
  String reason = '',
  bool showSnackbar = true,
}) async {
  log.log('Caught an error: ');
  debugPrintStack(stackTrace: s, label: '[$library] $e $reason');

  final details = FlutterErrorDetails(
    exception: e,
    stack: s,
    context: ErrorDescription(reason),
    library: library,
  );

  if (_doShowSnackbars && showSnackbar) {
    try {
      Vibration.instance.error();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        scaffoldMessengerKey.currentState!
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            key: Key(details.hashCode.toRadixString(32)),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 1),
            content: const Text('The app encountered an issue.'),
            action: SnackBarAction(
              label: 'Details',
              onPressed: () {
                scaffoldMessengerKey.currentState!.removeCurrentSnackBar();
                navigatorKey.currentState!.push<void>(
                    MaterialPageRoute(builder: (_) => ErrorPage(details)));
              },
            ),
          ));
      });
      // ignore: avoid_catches_without_on_clauses
    } catch (e, s) {
      debugPrintStack(stackTrace: s, label: e.toString());
    }
  }

  if (await _doReport) {
    //await FirebaseCrashlytics.instance.recordError(e, s, reason: reason, printDetails: false);
  }
}

// ignore: avoid_void_async
void reportFlutterError(FlutterErrorDetails details) async {
  log.log('Caught a Flutter error: ${details.exception}');
  debugPrintStack(
      stackTrace: details.stack, label: details.exception.toString());

  if (_doShowSnackbars) {
    try {
      Vibration.instance.error();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        scaffoldMessengerKey.currentState!
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            key: Key(details.hashCode.toRadixString(32)),
            duration: const Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
            content: const Text('The app encountered an issue.'),
            action: SnackBarAction(
              label: 'Details',
              onPressed: () {
                scaffoldMessengerKey.currentState!.removeCurrentSnackBar();
                navigatorKey.currentState!.push<void>(
                    MaterialPageRoute(builder: (_) => ErrorPage(details)));
              },
            ),
          ));
      });
      // ignore: avoid_catches_without_on_clauses
    } catch (e, s) {
      debugPrintStack(stackTrace: s, label: e.toString());
    }
  }
  if (await _doReport) {
    //await FirebaseCrashlytics.instance.recordFlutterError(details);
  }
}

Future<bool> get _doReport async {
  final instance = await SharedPreferences.getInstance();
  return !kIsWeb &&
      Firebase.apps.isNotEmpty &&
      (instance
              .getBool(PreferencesBloc.prefix + PreferencesBloc.analyticsKey) ??
          true);
}

class ErrorPage extends StatefulWidget {
  const ErrorPage(
    this.details, {
    Key? key,
  }) : super(key: key);

  final FlutterErrorDetails? details;

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  bool _wrapped = true;

  @override
  Widget build(BuildContext context) => Theme(
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
          body: ListView(
            children: [
              ErrorDataWidget(
                'Exception:',
                widget.details!.exception.toString(),
                wrapped: _wrapped,
              ),
              ErrorDataWidget(
                'StackTrace:',
                widget.details!.stack.toString(),
                wrapped: _wrapped,
              ),
              ErrorDataWidget(
                'Context:',
                widget.details!.context.toString(),
                wrapped: _wrapped,
              ),
              ErrorDataWidget(
                'Summary:',
                widget.details!.summary.toString(),
                wrapped: _wrapped,
              ),
              ErrorDataWidget(
                'Library:',
                widget.details!.library,
                wrapped: _wrapped,
              ),
            ],
          ),
        ),
      );
}
