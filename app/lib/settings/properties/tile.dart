import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/settings/properties/property.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/listener.dart';

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
  final List<ActionsSheetAction<T>> items;
  final Widget? pageTitle;
  final Widget? pageDescription;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) => Column(children: [
        const Divider(height: 0),
        ListenableBuilder<Property<T>>(
            listenable: property,
            builder: (context, prop, _) {
              final showSwitch = prop.value is bool;
              return ListTile(
                leading: icon,
                title: title,
                subtitle: subtitle,
                onTap: showSwitch
                    ? () async {
                        prop.setValue((prop.value == false) as T);
                      }
                    : () async {
                        final res = await showChoiceSheet<T>(context, items,
                            defaultValue: prop.value,
                            cancel: ActionsSheetAction(
                                title: Text(AppLocalizations.of(context).cancel)));
                        if (res != null) {
                          prop.setValue(res);
                        }
                      },
                horizontalTitleGap: 0,
                trailing: showSwitch
                    ? Switch.adaptive(
                        value: prop.value as bool, onChanged: (v) => prop.setValue(v as T))
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
              );
            })
      ]);
}
