import 'package:flutter/material.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/utils/strings/strings.dart';

class RouteWidget extends StatelessWidget {
  const RouteWidget({
    Key? key,
    this.title,
    required this.from,
    required this.to,
    this.icon,
    this.onTap,
    this.trailing,
    this.onLongPress,
    this.fromOverride,
    this.toOverride,
  }) : super(key: key);

  final Widget? icon;
  final Widget from;
  final Widget to;
  final Widget? title;
  final Widget? trailing;
  final String? fromOverride;
  final String? toOverride;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: icon,
              )
            else
              const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) ...[
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.subtitle1!,
                      child: title!,
                    ),
                    const SizedBox(height: 8),
                  ],
                  Row(
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).primaryColor),
                              borderRadius: const BorderRadius.all(Radius.circular(4)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              child: Text(
                                fromOverride ?? AppLoc.of(context).from.toCamelCase(),
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.topLeft,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).primaryColor),
                              borderRadius: const BorderRadius.all(Radius.circular(4)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              child: Text(
                                toOverride ?? AppLoc.of(context).to.toCamelCase(),
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      const SizedBox(width: 8),
                      DefaultTextStyle(
                        style: Theme.of(context).textTheme.subtitle2!,
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              from,
                              const SizedBox(height: 8),
                              to,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (trailing != null)
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: trailing,
              )
            else
              const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
