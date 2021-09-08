import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/settings/properties/property.dart';
import 'package:theming/responsive.dart';

class SettingsSwitchTile extends StatefulWidget {
  const SettingsSwitchTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.initialValue,
    this.subtitle,
    this.onChanged,
  })  : listenable = null,
        super(key: key);

  final Widget title;
  final Widget icon;
  final Widget? subtitle;
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final ValueListenable<bool>? listenable;

  SettingsSwitchTile.property({
    Key? key,
    required this.title,
    required this.icon,
    this.subtitle,
    required Property<bool> property,
  })  : initialValue = property.value,
        onChanged = ((v) => property.setValue(v)),
        listenable = property,
        super(key: key);

  @override
  State<SettingsSwitchTile> createState() => _SettingsSwitchTileState();
}

class _SettingsSwitchTileState extends State<SettingsSwitchTile> {
  late bool value = widget.initialValue;

  @override
  void initState() {
    super.initState();
    widget.listenable?.addListener(onListenableChanged);
  }

  @override
  void dispose() {
    super.dispose();
    widget.listenable?.removeListener(onListenableChanged);
  }

  void onListenableChanged() {
    final listenableValue = widget.listenable!.value;

    if (listenableValue != value) {
      setState(() {
        value = listenableValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarwin = theme.platform.isDarwin;
    return ListTile(
      title: widget.title,
      leading: widget.icon,
      subtitle: widget.subtitle,
      onTap: isDarwin
          ? null
          : () {
              setState(() {
                value = !value;
              });
            },
      trailing: Switch.adaptive(
          value: value,
          onChanged: (v) {
            setState(() => value = v);
            widget.onChanged?.call(v);
          }),
    );
  }
}
