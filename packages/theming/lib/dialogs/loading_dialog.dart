import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theming/responsive.dart';

Future<T?> load<T>(
  BuildContext context, {
  required Future<T> Function() future,
  Widget title = const Text('Loading...'),
  ValueChanged<T>? onDone,
  ErrorCallback? onError,
  TargetPlatform? platformOverride,
}) {
  final platform = platformOverride ?? Theme.of(context).platform;
  if (isPlatformDarwin(platform)) {
    return showCupertinoDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (context) => _LoadingDialog<T>(
        future: future,
        onDone: onDone,
        onError: onError,
        title: title,
        isDarwin: true,
      ),
    );
  } else {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 300),
      barrierColor: Colors.black54,
      pageBuilder: (context, animation, secondaryAnimation) =>
          SharedAxisTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        transitionType: SharedAxisTransitionType.scaled,
        fillColor: Colors.transparent,
        child: _LoadingDialog<T>(
            future: future, onDone: onDone, onError: onError, title: title),
      ),
    );
  }
}

typedef ErrorCallback = void Function(Object e, StackTrace s);

class _LoadingDialog<T> extends StatefulWidget {
  const _LoadingDialog({
    required this.title,
    required this.future,
    required this.onDone,
    required this.onError,
    this.isDarwin = false,
    super.key,
  });

  final Future<T> Function() future;
  final ValueChanged<T>? onDone;
  final ErrorCallback? onError;
  final Widget title;
  final bool isDarwin;

  @override
  _LoadingDialogState<T> createState() => _LoadingDialogState<T>();
}

class _LoadingDialogState<T> extends State<_LoadingDialog<T>> {
  @override
  void initState() {
    super.initState();
    unawaited(init());
  }

  Future<void> init() async {
    await widget.future().then((v) {
      Navigator.of(context).pop<T>(v);
      if (widget.onDone != null) {
        widget.onDone?.call(v);
      }
    }, onError: (dynamic e, dynamic s) {
      Navigator.of(context).pop<T>(null);
      if (widget.onError != null) {
        widget.onError?.call(e as Object, s as StackTrace);
      }
      debugPrint(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isDarwin) {
      return CupertinoTheme(
        data: CupertinoTheme.of(context),
        child: Builder(
            builder: (context) => CupertinoAlertDialog(
                  content: Row(
                    children: [
                      const CupertinoActivityIndicator(),
                      const SizedBox(width: 16),
                      DefaultTextStyle(
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navActionTextStyle
                            .copyWith(
                                color: CupertinoDynamicColor.resolve(
                                    CupertinoColors.label, context)),
                        child: widget.title,
                      ),
                    ],
                  ),
                )),
      );
    } else {
      return AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 16),
            DefaultTextStyle(
              style: Theme.of(context).textTheme.titleLarge!,
              child: widget.title,
            ),
          ],
        ),
      );
    }
  }
}
