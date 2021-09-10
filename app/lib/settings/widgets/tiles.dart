import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theming/responsive.dart';

mixin WithLeading {
  Widget? get leading;
}

class SwiftSettingsTile extends StatelessWidget with WithLeading {
  const SwiftSettingsTile({
    Key? key,
    required this.title,
    required this.leading,
    this.subtitle,
    this.onTap,
    this.showChevron = true,
  }) : super(key: key);

  final Widget title;
  @override
  final Widget leading;
  final Widget? subtitle;
  final VoidCallback? onTap;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarwin = theme.platform.isDarwin;
    final subtitleColor = theme.textTheme.caption?.color;
    return ListTile(
      horizontalTitleGap: 0,
      title: title,
      leading: leading,
      subtitle: isDarwin ? null : subtitle,
      onTap: onTap,
      trailing: isDarwin
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  if (subtitle != null)
                    SizedBox(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 100),
                            child: DefaultTextStyle(
                              style: theme.textTheme.subtitle1!.copyWith(color: subtitleColor),
                              softWrap: false,
                              textAlign: TextAlign.right,
                              child: subtitle!,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (showChevron) Icon(CupertinoIcons.chevron_forward, color: subtitleColor)
                ])
          : null,
    );
  }
}
