import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MyExpandable extends StatelessWidget {
  /// Whe widget to show when collapsed
  final Widget collapsed;

  /// The widget to show when expanded
  final Widget expanded;

  /// If the controller is not specified, it will be retrieved from the context
  final ExpandableController controller;

  final ExpandableThemeData _theme;

  final Color backgroundColor;

  MyExpandable({
    Key key,
    this.collapsed,
    this.expanded,
    this.controller,
    ExpandableThemeData theme,
    this.backgroundColor,
  })  : _theme = ExpandableThemeData.combine(theme, const ExpandableThemeData()).nullIfEmpty(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = this.controller ?? ExpandableController.of(context);
    final theme = ExpandableThemeData.withDefaults(_theme, context);

    return AnimatedCrossFade(
      duration: theme.animationDuration,
      firstChild: collapsed ?? Container(),
      secondChild: expanded ?? Container(),
      firstCurve:
          Interval(theme.collapsedFadeStart, theme.collapsedFadeEnd, curve: theme.fadeCurve),
      secondCurve: Interval(theme.expandedFadeStart, theme.expandedFadeEnd, curve: theme.fadeCurve),
      sizeCurve: theme.sizeCurve,
      crossFadeState: controller.expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }
}
