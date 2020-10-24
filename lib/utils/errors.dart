import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

void report(Object e, StackTrace s, {String name, String text = ""}) {
  try {
    FirebaseCrashlytics.instance.recordError(e, s);
  } on FirebaseException catch (_) {} finally {
    debugPrintStack(stackTrace: s, label: "[$name] $e");
  }
}
