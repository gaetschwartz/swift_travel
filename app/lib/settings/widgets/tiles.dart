import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theming/responsive.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.title,
    required this.icon,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  final Widget title;
  final Widget icon;
  final Widget? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarwin = theme.platform.isDarwin;
    return ListTile(
      title: title,
      leading: icon,
      subtitle: isDarwin ? null : subtitle,
      onTap: onTap,
      trailing: isDarwin
          ? Row(children: [
              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: DefaultTextStyle(style: theme.textTheme.subtitle2!, child: subtitle!),
                ),
              const Icon(CupertinoIcons.chevron_forward)
            ])
          : null,
    );
  }
}
