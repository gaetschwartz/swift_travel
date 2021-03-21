import 'package:flutter/material.dart';

class ListenerWidget<T extends Listenable> extends StatefulWidget {
  const ListenerWidget({
    required this.builder,
    required this.listenable,
    this.child,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext context, T listenable, Widget? child) builder;
  final T listenable;
  final Widget? child;

  @override
  _ListenerWidgetState<T> createState() => _ListenerWidgetState<T>();
}

class _ListenerWidgetState<T extends Listenable> extends State<ListenerWidget<T>> {
  @override
  void initState() {
    super.initState();
    widget.listenable.addListener(update);
  }

  @override
  void didUpdateWidget(covariant ListenerWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.listenable.removeListener(update);
    widget.listenable.addListener(update);
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, widget.listenable, widget.child);

  @override
  void dispose() {
    widget.listenable.removeListener(update);
    super.dispose();
  }

  void update() {
    if (mounted) {
      setState(() {});
    }
  }
}
