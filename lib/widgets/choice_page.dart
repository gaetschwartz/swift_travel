import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:vibration/vibration.dart';

@immutable
class ChoicePageItem<T> {
  final T value;
  final Widget Function(BuildContext, bool) builder;
  final Widget child;

  const ChoicePageItem({
    @required this.value,
    this.builder,
    this.child,
  }) : assert(builder != null || child != null);
}

class ChoicePage<T> extends StatefulWidget {
  final List<ChoicePageItem<T>> items;
  final T value;
  final Widget title;
  final void Function(T) onChanged;
  final Widget description;

  const ChoicePage({
    Key key,
    @required this.items,
    this.value,
    this.title,
    this.onChanged,
    this.description,
  }) : super(key: key);

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
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: cupertinoBar(context, middle: widget.title),
      backgroundColor: CupertinoTheme.brightnessOf(context) == Brightness.dark
          ? null
          : CupertinoColors.systemGroupedBackground,
      child: ListView(
        primary: true,
        children: [
          const SizedBox(height: 32),
          divider(),
          DecoratedBox(
            decoration: BoxDecoration(
              color: CupertinoTheme.brightnessOf(context) == Brightness.dark
                  ? CupertinoColors.darkBackgroundGray
                  : CupertinoColors.white,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, i) {
                final item = widget.items[i];
                return item.child != null
                    ? ListTile(
                        dense: true,
                        onTap: () => tapped(i, item),
                        title: item.child,
                        leading: i == selected
                            ? Icon(
                                FluentIcons.checkmark_24_regular,
                                color: CupertinoTheme.of(context).primaryColor,
                              )
                            : const SizedBox(),
                      )
                    : GestureDetector(
                        onTap: () => tapped(i, item),
                        child: item.builder(context, selected == i),
                      );
              },
              itemCount: widget.items.length,
              separatorBuilder: (context, index) => divider(),
            ),
          ),
          divider(),
          if (widget.description != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DefaultTextStyle(
                style: CupertinoTheme.of(context)
                    .textTheme
                    .textStyle
                    .copyWith(color: CupertinoColors.systemGrey),
                child: widget.description,
              ),
            )
        ],
      ),
    );
  }

  Divider divider() => const Divider(height: 0, indent: 8, endIndent: 8);

  void tapped(int i, ChoicePageItem<T> item) {
    setState(() => selected = i);
    Vibration.select();
    widget.onChanged?.call(item.value);
  }
}
