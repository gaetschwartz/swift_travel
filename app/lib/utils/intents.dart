import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

final ctrl = Platform.isIOS || Platform.isMacOS
    ? LogicalKeyboardKey.meta
    : LogicalKeyboardKey.control;

class TabIntent extends Intent {
  const TabIntent(this.tab);

  final int tab;
}

class TabAction extends Action {
  TabAction(this.controller);

  final CupertinoTabController Function() controller;

  @override
  Object? invoke(covariant TabIntent intent) {
    controller().index = intent.tab;
    return null;
  }
}

class SwitchTabIntent extends Intent {
  const SwitchTabIntent();
}

class EscapeIntent extends Intent {
  const EscapeIntent();
}
