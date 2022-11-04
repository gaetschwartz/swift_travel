import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/settings/properties/property.dart';
import 'package:swift_travel/settings/settings.dart';
import 'package:swift_travel/widgets/listener.dart';
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
    final subtitleColor = theme.textTheme.bodySmall?.color;
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
              horizontalTitleGap: 0,
              dense: true,
              title: DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyLarge!,
                child: title,
              ),
              leading: leading,
              subtitle: isDarwin ? null : subtitle,
              onTap: onTap,
              tileColor: isDarwin
                  ? SettingsColor.tile.resolveFrom(context)
                  : Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: tileBorders.toBorderRadius(borderRadius)),
              trailing: isDarwin
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            verticalDirection: VerticalDirection.down,
                            children: [
                              const Text(''),
                              if (subtitle != null)
                                ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 100),
                                  child: DefaultTextStyle(
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(color: subtitleColor),
                                    softWrap: false,
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.fade,
                                    child: subtitle!,
                                  ),
                                ),
                              if (showChevron)
                                Icon(
                                  CupertinoIcons.chevron_forward,
                                  color: subtitleColor,
                                )
                            ]),
                      ],
                    )
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

class SwiftSettingsPropertyTile<T> extends StatelessWidget with WithLeading {
  const SwiftSettingsPropertyTile({
    super.key,
    required this.title,
    required this.property,
    this.leading,
    this.subtitle,
    this.onTap,
    this.showChevron = true,
    this.tileBorders = TileBorders.none,
    this.valueBuilder = _valueBuilder,
    required this.options,
  });

  final Widget title;
  @override
  final Widget? leading;
  final Widget? subtitle;
  final VoidCallback? onTap;
  final bool showChevron;
  final TileBorders tileBorders;
  final Property<T> property;
  final Widget Function(BuildContext context, T value) valueBuilder;

  final List<ValueOption<T>> options;

  @override
  Widget build(BuildContext context) {
    return SwiftSettingsTile(
      leading: leading,
      title: title,
      subtitle: ListenableBuilder<Property<T>>(
        builder: (context, p, _) => valueBuilder(context, p.value),
        listenable: property,
      ),
      onTap: () async => changeValue(context),
      showChevron: showChevron,
      tileBorders: tileBorders,
    );
  }

  Future<void> changeValue(BuildContext context) async {
    await showPropertyPage<T>(
      context,
      options: options,
      title: title,
      property: property,
    );
  }

  static Widget _valueBuilder(BuildContext _, dynamic val) =>
      Text(val.toString());
}
