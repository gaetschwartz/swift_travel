import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/settings/properties/property.dart';
import 'package:swift_travel/settings/settings.dart';
import 'package:swift_travel/widgets/property_page.dart';
import 'package:theming/responsive.dart';

mixin WithLeading {
  Widget? get leading;
}

class TileBorders {
  final bool top;
  final bool bottom;

  const TileBorders({this.top = false, this.bottom = false});

  static const none = TileBorders();
  static const all = TileBorders(top: true, bottom: true);

  BorderRadius toBorderRadius(Radius radius) => BorderRadius.vertical(
        top: top ? radius : Radius.zero,
        bottom: bottom ? radius : Radius.zero,
      );
}

typedef BuildVoidCallback = VoidCallback Function(BuildContext context);

class SwiftSettingsTile extends StatelessWidget with WithLeading {
  const SwiftSettingsTile({
    super.key,
    required this.title,
    this.leading,
    this.subtitle,
    this.onTap,
    this.showChevron = true,
    this.tileBorders = TileBorders.none,
    this.showDividers = true,
  });

  final Widget title;
  @override
  final Widget? leading;
  final Widget? subtitle;
  final VoidCallback? onTap;
  final bool showChevron;
  final TileBorders tileBorders;
  final bool showDividers;

  static const borderRadius = Radius.circular(12);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarwin = theme.platform.isDarwin;
    return Column(
      children: [
        if (showDividers && !tileBorders.top)
          const Divider(indent: 56, thickness: 0.2, height: 0),
        Material(
          color: Colors.transparent,
          child: Theme(
            data: Theme.of(context)
                .copyWith(splashFactory: NoSplash.splashFactory),
            child: ListTile(
              // // horizontalTitleGap: 0,
              dense: true,
              title: DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyLarge!,
                child: title,
              ),
              leading: leading,
              subtitle: isDarwin && subtitle != null
                  ? DefaultTextStyle(
                      style: TextStyle(
                          color: CupertinoColors.secondaryLabel
                              .resolveFrom(context)),
                      child: subtitle!,
                    )
                  : subtitle,
              onTap: onTap,
              tileColor: isDarwin
                  ? SettingsColor.tile.resolveFrom(context)
                  : Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: tileBorders.toBorderRadius(borderRadius)),
              trailing: isDarwin
                  ? showChevron
                      ? const CupertinoListTileChevron()
                      : null
                  : null,
            ),
          ),
        ),
        if (showDividers && !tileBorders.bottom)
          const Divider(indent: 56, thickness: 0.2, height: 0),
      ],
    );
  }
}

class SwiftSettingsPropertyTile<T> extends StatefulWidget with WithLeading {
  const SwiftSettingsPropertyTile({
    super.key,
    required this.title,
    required this.property,
    this.leading,
    this.subtitle,
    this.showChevron = true,
    this.tileBorders = TileBorders.none,
    this.valueBuilder = _valueBuilder,
    required this.options,
    this.isAllowedToChangeValue,
  });

  final Widget title;
  @override
  final Widget? leading;
  final Widget? subtitle;
  final bool showChevron;
  final TileBorders tileBorders;
  final Property<T> property;
  final Widget Function(BuildContext context, T value) valueBuilder;
  // is allowed to change the value
  final FutureOr<bool> Function(T value)? isAllowedToChangeValue;

  final List<ValueOption<T>> options;

  @override
  State<SwiftSettingsPropertyTile<T>> createState() =>
      _SwiftSettingsPropertyTileState<T>();

  static Widget _valueBuilder(BuildContext _, dynamic val) =>
      Text(val.toString());
}

class _SwiftSettingsPropertyTileState<T>
    extends State<SwiftSettingsPropertyTile<T>> {
  @override
  Widget build(BuildContext context) {
    return SwiftSettingsTile(
      leading: widget.leading,
      title: widget.title,
      subtitle: AnimatedBuilder(
        builder: (context, _) =>
            widget.valueBuilder(context, widget.property.value),
        animation: widget.property,
      ),
      onTap: () async {
        if (widget.isAllowedToChangeValue == null ||
            await widget.isAllowedToChangeValue!(widget.property.value)) {
          if (mounted) await changeValue(context);
        }
      },
      showChevron: widget.showChevron,
      tileBorders: widget.tileBorders,
    );
  }

  Future<void> changeValue(BuildContext context) async {
    await showPropertyPage<T>(
      context,
      options: widget.options,
      title: widget.title,
      property: widget.property,
    );
  }
}
