import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/attribute.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/tabs/routes/details/tiles/attributes_page.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/env.dart';
import 'package:swift_travel/utils/strings/format.dart';
import 'package:swift_travel/widgets/cff_icon.dart';
import 'package:swift_travel/widgets/line_icon.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:theming/responsive.dart';

import 'details.dart';

class TransportLegTile extends StatefulWidget {
  const TransportLegTile(
    this.l, {
    Key? key,
  }) : super(key: key);

  final Leg l;

  @override
  _TransportLegTileState createState() => _TransportLegTileState();
}

const _red = Color(0xFFFF5252);

class _TransportLegTileState extends State<TransportLegTile> {
  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(16));
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: shadowListOf(context),
          borderRadius: borderRadius,
          color: Theme.of(context).cardColor,
        ),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {
            Navigator.of(context).push(
              PlatformPageRoute(
                builder: (context) => TransportDetails(leg: widget.l),
              ),
            );
          },
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: [
                        buildHeader(),
                        buildCollapsed(context),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(CupertinoIcons.forward),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget buildCollapsed(BuildContext context) {
    return DefaultTextStyle(
        style: Theme.of(context).textTheme.subtitle2!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: Format.time(widget.l.departure),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (widget.l.depDelay > 0)
                      TextSpan(
                        text: Format.delay(widget.l.depDelay),
                        style: const TextStyle(
                          color: _red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ])),
                  const SizedBox(width: 16),
                  Expanded(child: Text(widget.l.name)),
                ],
              ),
            ),
            if (widget.l.exit != null)
              IconTheme(
                data: const IconThemeData(size: 16, color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: Format.time(widget.l.exit!.arrival),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if (widget.l.exit!.arrDelay > 0)
                          TextSpan(
                            text: Format.delay(widget.l.exit!.arrDelay),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _red,
                            ),
                          ),
                      ])),
                      const SizedBox(width: 16),
                      Expanded(child: Text(widget.l.exit!.name)),
                      InkWell(
                        onTap: () {
                          final darwin = Responsive.isDarwin(context);
                          final list = widget.l.attributes.entries
                              .map((e) =>
                                  Attribute.attributes[e.key]?.copyWith(message: e.value) ??
                                  Attribute(code: e.key, message: e.value))
                              .where((e) => !e.ignore)
                              .toList();
                          list.sort((a, b) => a.code.compareTo(b.code));
                          if (isDebugMode) {
                            list.add(const Attribute(
                              code: 'dummy_code',
                              message: 'This is a dummy unhandled attribute',
                            ));
                          }
                          if (darwin) {
                            showCupertinoModalBottomSheet<void>(
                                context: context,
                                builder: (context) => CupertinoPageScaffold(
                                      resizeToAvoidBottomInset: false,
                                      navigationBar: CupertinoNavigationBar(
                                        automaticallyImplyLeading: false,
                                        middle: Text(
                                            '${widget.l.line} ${AppLoc.of(context).to} ${widget.l.terminal}'),
                                      ),
                                      child: SafeArea(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(height: 8),
                                            ...list.map(AttributesPage.buildAttributeTile),
                                            const SizedBox(height: 8),
                                          ],
                                        ),
                                      ),
                                    ),
                                expand: false);
                          } else {
                            showMaterialModalBottomSheet<void>(
                                context: context,
                                builder: (context) => Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(height: 8),
                                        ...list.map(AttributesPage.buildAttributeTile),
                                        const SizedBox(height: 8),
                                      ],
                                    ),
                                expand: false);
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...widget.l.attributes.entries
                                .map((e) => Attribute.attributes[e.key])
                                .where((e) => e == null || !e.ignore)
                                .map((att) => Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          color: Colors.red,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: att == null ? Attribute.defaultIcon : att.icon,
                                        ),
                                      ),
                                    ))
                                .take(3),
                            if (widget.l.attributes.length > 3) ...[
                              const SizedBox(width: 2),
                              Text('+${widget.l.attributes.length - 3}'),
                            ]
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ));
  }

  Widget buildHeader() {
    return Column(
      children: [
        Row(
          children: <Widget>[
            if (LineIcon.isValidLeg(widget.l))
              LineIcon.fromLeg(widget.l)
            else
              CffIcon(widget.l.type),
            const SizedBox(width: 8),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.l.terminal!,
                  style:
                      Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            if (widget.l.track != null)
              Text(
                'Pl. ${widget.l.track}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ],
    );
  }
}
