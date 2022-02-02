import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/settings/widgets/constants.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';
import 'package:swift_travel/utils/definitions.dart';

class CupertinoSettingsSection extends StatelessWidget {
  const CupertinoSettingsSection(
    this.items, {
    Key? key,
    this.header,
    this.headerPadding = defaultTitlePadding,
    this.footer,
  }) : super(key: key);

  final List<Widget> items;

  final Widget? header;
  final EdgeInsetsGeometry headerPadding;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final itemsWithDividers = buildItemsWithDividers();
    final largeScreen = MediaQuery.of(context).size.width >= 768;

    final columnChildren = <Widget>[
      if (header != null)
        DefaultTextStyle(
          style: TextStyle(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w400,
            fontSize: 13.5,
            letterSpacing: -0.5,
          ),
          child: Padding(
            padding: headerPadding,
            child: header,
          ),
        ),
      if (largeScreen)
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Theme.of(context).brightness == Brightness.light
                ? CupertinoColors.white
                : iosTileDarkColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: itemsWithDividers,
          ),
        )
      else
        DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? CupertinoColors.white
                : iosTileDarkColor,
            border: const Border(
              top: BorderSide(
                color: borderColor,
                width: 0.3,
              ),
              bottom: BorderSide(
                color: borderColor,
                width: 0.3,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: itemsWithDividers,
          ),
        ),
      if (footer != null)
        DefaultTextStyle(
          style: const TextStyle(
            color: groupSubtitle,
            fontSize: 13,
            letterSpacing: -0.08,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 7.5,
            ),
            child: footer,
          ),
        )
    ];

    final top = header == null ? 35.0 : 22.0;
    return Padding(
      padding:
          largeScreen ? EdgeInsets.only(top: top, left: 22, right: 22) : EdgeInsets.only(top: top),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnChildren,
      ),
    );
  }

  @allowReturningWidgets
  List<Widget> buildItemsWithDividers() {
    final itemsWithDividers = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      itemsWithDividers.add(items[i]);
      if (i < items.length - 1) {
        // ignore: avoid-unrelated-type-assertions
        final leftPadding = (items[i] is WithLeading && items[i + 1] is WithLeading)
            ? ((items[i] as WithLeading).leading == null ? 15.0 : 54.0)
            : 0.0;

        itemsWithDividers.add(Divider(
          height: 0.3,
          color: Colors.grey.shade400,
          indent: leftPadding,
        ));
      }
    }
    return itemsWithDividers;
  }
}
