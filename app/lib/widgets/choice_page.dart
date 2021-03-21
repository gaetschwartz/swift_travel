import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:vibration/vibration.dart';

import 'if_wrapper.dart';

@immutable
class ChoicePageItem<T> {
  const ChoicePageItem({
    required this.value,
    this.builder,
    this.child,
  }) : assert(
            builder != null || child != null, 'Either the child or the builder must be non null.');

  final T value;
  final Widget Function(BuildContext, bool)? builder;
  final Widget? child;
}

class ChoicePage<T> extends StatefulWidget {
  const ChoicePage({
    required this.items,
    Key? key,
    this.value,
    this.title,
    this.onChanged,
    this.description,
  }) : super(key: key);

  final List<ChoicePageItem<T>> items;
  final T? value;
  final Widget? title;
  final void Function(T)? onChanged;
  final Widget? description;

  @override
  _ChoicePageState<T> createState() => _ChoicePageState<T>();
}

class _ChoicePageState<T> extends State<ChoicePage<T>> {
  int selected = 0;

  @override
  void initState() {
    super.initState();
    initDefaultValue();
  }

  void initDefaultValue() {
    for (var i = 0; i < widget.items.length; i++) {
      if (widget.items[i].value == widget.value) {
        setState(() => selected = i);
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) => PlatformBuilder(
        cupertinoBuilder: (context, child) => CupertinoPageScaffold(
          navigationBar: SwiftCupertinoBar(
              middle: widget.title,
              leading: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.of(context).pop(),
                child: Text(AppLoc.of(context).close),
              )),
          backgroundColor: CupertinoTheme.brightnessOf(context) == Brightness.dark
              ? null
              : CupertinoColors.systemGroupedBackground,
          child: SafeArea(child: child!),
        ),
        materialBuilder: (context, child) => Scaffold(
          appBar: materialAppBar(
            context,
            title: widget.title,
            leading: const CloseButton(),
          ),
          body: child,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Divider(height: 0),
            DecoratedBox(
              decoration: BoxDecoration(
                color: CupertinoTheme.brightnessOf(context) == Brightness.dark
                    ? CupertinoColors.darkBackgroundGray
                    : CupertinoColors.white,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  final item = widget.items[i];
                  return item.child != null
                      ? ListTile(
                          dense: true,
                          onTap: () => tapped(i, item),
                          title: item.child,
                          trailing: i == selected
                              ? Icon(
                                  CupertinoIcons.checkmark_alt,
                                  color: CupertinoTheme.of(context).primaryColor,
                                )
                              : null,
                        )
                      : GestureDetector(
                          onTap: () => tapped(i, item),
                          child: item.builder!(context, selected == i),
                        );
                },
                itemCount: widget.items.length,
                separatorBuilder: (context, index) =>
                    const Divider(height: 0, indent: 12, endIndent: 12),
              ),
            ),
            const Divider(height: 0),
            if (widget.description != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: DefaultTextStyle(
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(color: CupertinoColors.systemGrey),
                  child: widget.description!,
                ),
              )
          ],
        ),
      );

  void tapped(int i, ChoicePageItem<T> item) {
    setState(() => selected = i);
    Vibration.select();
    widget.onChanged?.call(item.value);
  }
}
