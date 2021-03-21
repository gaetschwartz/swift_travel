import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/pages/settings/properties/property.dart';
import 'package:swift_travel/widgets/choice_page.dart';
import 'package:swift_travel/widgets/listener.dart';
import 'package:theming/responsive.dart';

class PropertyTile<T> extends StatelessWidget {
  const PropertyTile(
    this.property, {
    required this.items,
    this.icon,
    this.title,
    this.trailingBuilder,
    this.showChevron = true,
    this.pageTitle,
    this.pageDescription,
    this.subtitle,
    this.titleBuilder,
    Key? key,
  }) : super(key: key);

  final Property<T> property;
  final Widget? icon;
  final Widget? title;
  final Widget Function(T)? titleBuilder;
  final Widget Function(T)? trailingBuilder;
  final bool showChevron;
  final List<ChoicePageItem<T>> items;
  final Widget? pageTitle;
  final Widget? pageDescription;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    final showSwitch = T == bool;
    return Column(children: [
      const Divider(height: 0),
      ListenerWidget<Property<T>>(
          listenable: property,
          builder: (context, prop, _) => ListTile(
                leading: icon,
                title: title,
                subtitle: subtitle,
                onTap: showSwitch
                    ? () {
                        prop.value = (prop.value == false) as T;
                      }
                    : () async {
                        final choicePage = ChoicePage<T>(
                          items: items,
                          value: prop.value,
                          title: pageTitle ?? title,
                          onChanged: (a) => prop.value = a,
                          description: pageDescription,
                        );
                        if (Responsive.isDarwin(context)) {
                          await showCupertinoModalBottomSheet<void>(
                              context: context, builder: (context) => choicePage);
                        } else {
                          await showMaterialModalBottomSheet<void>(
                              context: context, builder: (context) => choicePage);
                        }
                      },
                horizontalTitleGap: 0,
                trailing: showSwitch
                    ? Switch.adaptive(
                        value: prop.value as bool, onChanged: (v) => prop.value = v as T)
                    : DefaultTextStyle(
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(color: CupertinoColors.systemGrey),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (trailingBuilder != null) trailingBuilder!.call(prop.value),
                            if (showChevron) ...[
                              const SizedBox(width: 8),
                              const Icon(CupertinoIcons.chevron_forward),
                            ]
                          ],
                        ),
                      ),
              ))
    ]);
  }
}
