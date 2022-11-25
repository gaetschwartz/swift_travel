import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theming/responsive.dart';

class PlatformButton extends StatelessWidget {
  const PlatformButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.filled = false,
    this.icon,
    this.onLongPress,
  });

  const PlatformButton.filled({
    super.key,
    required this.onPressed,
    required this.child,
    this.filled = true,
    this.icon,
    this.onLongPress,
  });

  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final Widget child;
  final bool filled;
  final Widget? icon;

  @override
  Widget build(final BuildContext context) {
    if (isThemeDarwin(context)) {
      final btn = filled
          ? CupertinoButton.filled(
              onPressed: onPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: icon,
                    ),
                  child,
                ],
              ),
            )
          : CupertinoButton(
              onPressed: onPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: icon,
                    ),
                  child,
                ],
              ),
            );
      if (onLongPress != null) {
        return GestureDetector(
          onLongPress: onLongPress,
          child: btn,
        );
      }
      return btn;
    } else {
      if (filled) {
        if (icon != null) {
          return ElevatedButton.icon(
            onPressed: onPressed,
            icon: icon!,
            label: child,
            onLongPress: onLongPress,
          );
        } else {
          return ElevatedButton(
            onPressed: onPressed,
            onLongPress: onLongPress,
            child: child,
          );
        }
      } else {
        if (icon != null) {
          return TextButton.icon(
            onPressed: onPressed,
            icon: icon!,
            label: child,
            onLongPress: onLongPress,
          );
        } else {
          return TextButton(
            onPressed: onPressed,
            onLongPress: onLongPress,
            child: child,
          );
        }
      }
    }
  }
}
