import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gaets_logging/logging.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/utils/route_uri.dart';
import 'package:theming/dialogs/confirmation_alert.dart';

import 'errors.dart';

const String websiteHost = 'travel.gaetanschwartz.com';

Future<void> shareRoute(BuildContext context, NavRoute route, int i) async {
  final params = encodeRouteUri(Uri.parse(route.requestUrl!), i);
  final log = Logger.of('shareRoute');
  log.log('Params: $params');

  final sharedUri = Uri(
      scheme: 'https',
      host: websiteHost,
      path: 'route',
      queryParameters: params);
  log.log('Shared uri: $sharedUri');

  if (kIsWeb) {
    final b = await confirm(context,
        title: const Text('Copy to  clipboard ?'),
        content: Text(sharedUri.toString()),
        cancel: const Text('No'),
        confirm: const Text('Yes'));
    if (b) {
      await Clipboard.setData(ClipboardData(text: sharedUri.toString()));
    }
  } else {
    try {
      await Share.share(sharedUri.toString());
    } on MissingPluginException {
      log.w('Missing plugin exception');
      ignoreError();
    }
  }
}

Future<void> shareFiles(
  List<File> files, {
  String? subject,
  String? text,
  Rect? sharePositionOrigin,
}) async {
  if (Platform.isWindows) {
    // open the explorer and select the file
    await Process.run('explorer.exe', ['/select,', files.first.path]);
  } else {
    await Share.shareXFiles(
      files.map((e) => XFile(e.path)).toList(),
      subject: subject,
      text: text,
      sharePositionOrigin: sharePositionOrigin,
    );
  }
}

Future<void> shareFile(
  File file, {
  String? subject,
  String? text,
  Rect? sharePositionOrigin,
}) async {
  return shareFiles(
    [file],
    subject: subject,
    text: text,
    sharePositionOrigin: sharePositionOrigin,
  );
}

Future<ui.Image?> screenshot(
  BuildContext context,
  Widget widget, {
  double? pixelRatio,
  double? width,
}) async {
  // show a dialog with the widget
  return showGeneralDialog<ui.Image?>(
    context: context,
    pageBuilder: (context, a1, a2) => _ScreenshotDialog(
      pixelRatio: pixelRatio ?? MediaQuery.of(context).devicePixelRatio,
      width: width,
      child: widget,
    ),
    transitionDuration: Duration.zero,
  );
}

class _ScreenshotDialog extends StatefulWidget {
  const _ScreenshotDialog({
    required this.child,
    required this.pixelRatio,
    required this.width,
  });

  final Widget child;
  final double pixelRatio;
  final double? width;

  @override
  State<_ScreenshotDialog> createState() => _ScreenshotDialogState();
}

class _ScreenshotDialogState extends State<_ScreenshotDialog> {
  final screenshotKey = GlobalKey();

  Future<void> screenshot() async {
    // await Future<void>.delayed(const Duration(milliseconds: 100));
    try {
      final box = screenshotKey.currentContext!.findRenderObject()
          as RenderRepaintBoundary?;
      if (box == null) {
        Navigator.of(context).pop();
        return;
      }

      final image = await box.toImage(pixelRatio: widget.pixelRatio);
      if (mounted) {
        Navigator.of(context).pop(image);
      }
    } on Exception catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => unawaited(screenshot()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: SizedBox.expand(
        child: Material(
          child: Center(
            child: SizedBox(
              width: widget.width,
              child: SingleChildScrollView(
                child: RepaintBoundary(
                  key: screenshotKey,
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
