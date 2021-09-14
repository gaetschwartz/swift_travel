import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/settings/properties/property.dart';
import 'package:swift_travel/widgets/listener.dart';
import 'package:theming/responsive.dart';

mixin WithLeading {
  Widget? get leading;
}

enum TileBorders { bottom, top, none }

typedef BuildVoidCallback = VoidCallback Function(BuildContext context);

class SwiftSettingsTile<T extends Object?> extends StatelessWidget
    with WithLeading {
  const SwiftSettingsTile({
    Key? key,
    required this.title,
    required this.leading,
    this.subtitle,
    this.onTap,
    this.generateOnTap,
    this.showChevron = true,
    this.tileBorders = TileBorders.none,
  })  : property = null,
        super(key: key);

  SwiftSettingsTile.property({
    Key? key,
    required this.title,
    required this.leading,
    this.showChevron = true,
    this.tileBorders = TileBorders.none,
    required Property<T> property,
    Widget Function(BuildContext context, T value) valueBuilder = _valueBuilder,
    required BuildVoidCallback generateOnTap,
  })  : subtitle = ListenableBuilder<Property<T>>(
            builder: (context, prop, child) =>
                valueBuilder(context, prop.value),
            listenable: property),
        onTap = null,
        property = property,
        generateOnTap = generateOnTap,
        super(key: key);

  static Widget _valueBuilder(BuildContext context, Object? object) =>
      Text(object.toString());

  final Widget title;
  @override
  final Widget leading;
  final Widget? subtitle;
  final VoidCallback? onTap;
  final BuildVoidCallback? generateOnTap;
  final bool showChevron;
  final TileBorders tileBorders;
  final Property<T>? property;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(16);
    final theme = Theme.of(context);
    final isDarwin = theme.platform.isDarwin;
    final subtitleColor = theme.textTheme.caption?.color;
    return Material(
      color: Colors.transparent,
      child: ListTile(
        horizontalTitleGap: 0,
        title: title,
        leading: leading,
        subtitle: isDarwin ? null : subtitle,
        onTap: onTap ?? generateOnTap?.call(context),
        tileColor: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: tileBorders == TileBorders.top ? radius : Radius.zero,
          bottom: tileBorders == TileBorders.bottom ? radius : Radius.zero,
        )),
        trailing: isDarwin
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    if (subtitle != null)
                      SizedBox(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 100),
                              child: DefaultTextStyle(
                                style: theme.textTheme.subtitle1!
                                    .copyWith(color: subtitleColor),
                                softWrap: false,
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.fade,
                                child: subtitle!,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (showChevron)
                      Icon(CupertinoIcons.chevron_forward, color: subtitleColor)
                  ])
            : null,
      ),
    );
  }
}
