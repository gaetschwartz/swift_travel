import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

final ctrl = Platform.isIOS || Platform.isMacOS
    ? LogicalKeyboardKey.meta
    : LogicalKeyboardKey.control;

class TabIntent extends Intent {
  const TabIntent(this.tab);

  final int tab;
}

class TabAction extends Action {
  TabAction(this.changeTab);

  final void Function(int tab) changeTab;

  @override
  Object? invoke(covariant TabIntent intent) {
    changeTab(intent.tab);
    return null;
  }
}

class SwitchTabIntent extends Intent {
  const SwitchTabIntent();
}

class EscapeIntent extends Intent {
  const EscapeIntent();
}
