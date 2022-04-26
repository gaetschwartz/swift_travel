import 'package:flutter/material.dart';

class ListenableBuilder<T extends Listenable> extends StatefulWidget {
  const ListenableBuilder({
    required this.builder,
    required this.listenable,
    this.child,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext context, T listenable, Widget? child)
      builder;
  final T listenable;
  final Widget? child;

  @override
  _ListenableBuilderState<T> createState() => _ListenableBuilderState<T>();
}

class _ListenableBuilderState<T extends Listenable>
    extends State<ListenableBuilder<T>> {
  @override
  void initState() {
    super.initState();
    widget.listenable.addListener(update);
  }

  @override
  void didUpdateWidget(covariant ListenableBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.listenable != widget.listenable) {
      oldWidget.listenable.removeListener(update);
      widget.listenable.addListener(update);
    }
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, widget.listenable, widget.child);

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
