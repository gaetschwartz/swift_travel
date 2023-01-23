// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gaets_logging/logging.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/page_not_found.dart';
import 'package:vibration/vibration.dart';

const _doShowSnackbars = !kDebugMode || Env.doShowErrors;

void ignoreError() {}

final _log = Logger.of('error_reporter');

class ErrorEvent {
  final DateTime time;
  final FlutterErrorDetails errorDetails;

  const ErrorEvent(this.time, this.errorDetails);

  Map<String, dynamic> toJson() {
    return {
      'time': time.toIso8601String(),
      'error_details': {
        'exception': errorDetails.exceptionAsString(),
        'stack': errorDetails.stack.toString(),
        'library': errorDetails.library,
        'context': errorDetails.context.toString(),
        'summary': errorDetails.summary.toString(),
      }
    };
  }
}

final errorEvents = <ErrorEvent>[];

// ignore: avoid_void_async
void reportDartError(
  Object e,
  StackTrace s, {
  String library = '',
  String context = '',
  bool showSnackbar = true,
}) async {
  _log.log('Caught an error: ');
  debugPrintStack(stackTrace: s, label: '[$library] $e $context');

  final details = createErrorDetails(
    error: e,
    stackTrace: s,
    context: context,
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

  errorEvents.add(ErrorEvent(DateTime.now(), details));
}

FlutterErrorDetails createErrorDetails({
  required Object error,
  required StackTrace stackTrace,
  required String context,
  required String library,
}) {
  return FlutterErrorDetails(
    exception: error,
    stack: stackTrace,
    context: ErrorDescription(context),
    library: library,
  );
}

// ignore: avoid_void_async
void reportFlutterError(FlutterErrorDetails details) async {
  _log.log('Caught a Flutter error: ${details.exception}');
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

  errorEvents.add(ErrorEvent(DateTime.now(), details));
}

class ErrorPage extends StatefulWidget {
  const ErrorPage(
    this.details, {
    super.key,
  });

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
            title: const Text('Error report'),
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
