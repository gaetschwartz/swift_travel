import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theming/responsive.dart';

Future<String?> input(
  BuildContext context, {
  required Widget title,
  Widget? content,
  TextInputType keyboardType = TextInputType.text,
  bool isSensitive = false,
  Widget submit = const Text('Submit'),
  Widget cancel = const Text('Cancel'),
  String initialText = '',
  InputDecoration? inputDecoration,
  bool barrierDismissible = true,
  String barrierLabel = 'Close',
  bool useRootNavigator = true,
  bool autofocus = true,
  TargetPlatform? platformOverride,
  void Function(TextEditingController controller)? registerController,
  void Function()? unRegisterController,
}) {
  final platform = platformOverride ?? Theme.of(context).platform;
  if (isPlatformDarwin(platform)) {
    return showCupertinoDialog<String>(
        context: context,
        useRootNavigator: useRootNavigator,
        barrierDismissible: barrierDismissible,
        builder: (context) => _IOSTextInputDialog(
              autofocus: autofocus,
              title: title,
              content: content,
              keyboardType: keyboardType,
              isSensitive: isSensitive,
              submit: submit,
              initialText: initialText,
              cancel: cancel,
              registerController: registerController,
              unRegisterController: unRegisterController,
            ),
        routeSettings: RouteSettings(name: 'input-${title.hashCode}'));
  } else {
    return showGeneralDialog<String>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      transitionDuration: const Duration(milliseconds: 150),
      barrierColor: Colors.black54,
      useRootNavigator: useRootNavigator,
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          FadeScaleTransition(
        animation: animation,
        child: child,
      ),
      pageBuilder: (context, animation, secondaryAnimation) => _TextInputDialog(
        title: title,
        content: content,
        initialText: initialText,
        keyboardType: keyboardType,
        isSensitive: isSensitive,
        submit: submit,
        cancel: cancel,
        decoration: inputDecoration,
      ),
    );
  }
}

class _IOSTextInputDialog extends StatefulWidget {
  const _IOSTextInputDialog({
    required this.title,
    required this.content,
    required this.keyboardType,
    required this.isSensitive,
    required this.submit,
    required this.initialText,
    required this.cancel,
    required this.registerController,
    required this.unRegisterController,
    required this.autofocus,
  });

  final Widget title;
  final Widget? content;
  final Widget submit;
  final Widget cancel;
  final TextInputType keyboardType;
  final bool isSensitive;
  final String initialText;
  final void Function(TextEditingController controller)? registerController;
  final void Function()? unRegisterController;
  final bool autofocus;

  @override
  __IOSTextInputDialogState createState() => __IOSTextInputDialogState();
}

class __IOSTextInputDialogState extends State<_IOSTextInputDialog> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.initialText);

  @override
  void initState() {
    super.initState();

    widget.registerController?.call(_controller);
  }

  @override
  void dispose() {
    widget.unRegisterController?.call();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CupertinoAlertDialog(
        title: widget.title,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.content != null) widget.content!,
            const SizedBox(height: 8),
            CupertinoTextField(
              obscureText: widget.isSensitive,
              autofocus: widget.autofocus,
              controller: _controller,
              keyboardType: widget.keyboardType,
              style: CupertinoTheme.of(context).textTheme.textStyle,
              onSubmitted: (s) => Navigator.of(context).pop<String>(s),
            ),
          ],
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: widget.cancel,
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () =>
                Navigator.of(context).pop<String>(_controller.text),
            child: widget.submit,
          )
        ],
      );
}

class _TextInputDialog extends StatefulWidget {
  const _TextInputDialog({
    required this.title,
    required this.content,
    required this.keyboardType,
    required this.isSensitive,
    required this.submit,
    required this.initialText,
    required this.cancel,
    required this.decoration,
  });

  final Widget title;
  final Widget? content;
  final Widget submit;
  final Widget cancel;

  final TextInputType keyboardType;
  final bool isSensitive;
  final InputDecoration? decoration;
  final String initialText;

  @override
  __TextInputDialogState createState() => __TextInputDialogState();
}

class __TextInputDialogState extends State<_TextInputDialog> {
  TextEditingController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: widget.title,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.content != null) widget.content!,
            TextField(
              obscureText: widget.isSensitive,
              autofocus: true,
              controller: _controller,
              keyboardType: widget.keyboardType,
              onSubmitted: (s) => Navigator.of(context).pop<String>(s),
              decoration: widget.decoration,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: widget.cancel,
          ),
          TextButton(
            onPressed: () =>
                Navigator.of(context).pop<String>(_controller!.text),
            child: widget.submit,
          )
        ],
      );
}
