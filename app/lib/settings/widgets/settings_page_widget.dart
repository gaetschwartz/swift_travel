import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/settings/settings.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';

class SettingsPageWidget extends StatelessWidget {
  const SettingsPageWidget({
    super.key,
    this.title,
    required this.children,
  });

  final Widget? title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return PlatformSettingsScaffold(
      title: title,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(children: children),
      ),
    );
  }
}

class PlatformSettingsScaffold extends StatelessWidget {
  const PlatformSettingsScaffold({
    super.key,
    required this.child,
    this.title,
    this.action,
  });

  final Widget child;
  final Widget? title;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      cupertinoBuilder: (context, child) => Material(
        child: CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: SettingsColor.background.resolveFrom(context),
          navigationBar: SwiftCupertinoBar(middle: title, trailing: action),
          child: child!,
        ),
      ),
      materialBuilder: (context, child) => Scaffold(
        body: child,
        appBar: AppBar(
          title: title,
          actions: [
            if (action != null) action!,
          ],
        ),
      ),
      child: child,
    );
  }
}
