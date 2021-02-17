import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/apis/search.ch/models/attribute.dart';
import 'package:swift_travel/apis/search.ch/models/leg.dart';
import 'package:swift_travel/apis/search.ch/models/stop.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/tabs/routes/details/tiles/attributes_page.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/env.dart';
import 'package:swift_travel/utils/string_utils/format.dart';
import 'package:swift_travel/widgets/cff_icon.dart';
import 'package:swift_travel/widgets/line_icon.dart';
import 'package:theming/responsive.dart';

class TransportLegTile extends StatefulWidget {
  const TransportLegTile({
    Key? key,
    required this.l,
  }) : super(key: key);

  final Leg l;

  @override
  _TransportLegTileState createState() => _TransportLegTileState();
}

const _red = Color(0xFFFF5252);

class _TransportLegTileState extends State<TransportLegTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: shadowListOf(context),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Theme.of(context).cardColor,
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              platformRoute(
                builder: (context) {
                  return TransportDetails(leg: widget.l);
                },
                isDarwin: Responsive.isDarwin(context),
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
              padding: const EdgeInsets.only(top: 8.0),
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
                  padding: const EdgeInsets.only(top: 8.0),
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
                            showCupertinoModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                builder: (context) => SafeArea(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(height: 8),
                                          ...list.map(AttributesPage.buildAttributeTile),
                                          const SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                expand: false);
                          } else {
                            showMaterialModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
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

class TransportDetails extends StatefulWidget {
  const TransportDetails({
    Key? key,
    required this.leg,
  }) : super(key: key);

  final Leg leg;

  @override
  _TransportDetailsState createState() => _TransportDetailsState();
}

class _TransportDetailsState extends State<TransportDetails> {
  late final stops = _stops(widget.leg, context);
  late final List<Attribute> attributes = widget.leg.attributes.entries
      .map((e) =>
          Attribute.attributes[e.key]?.copyWith(message: e.value) ??
          Attribute(code: e.key, message: e.value))
      .where((e) => !e.ignore)
      .toList();

  @override
  Widget build(BuildContext context) {
    final empty = attributes.isEmpty;
    final dividerCount = empty ? 0 : 1;
    return Scaffold(
      appBar:
          AppBar(title: Text('${widget.leg.line} ${AppLoc.of(context).to} ${widget.leg.terminal}')),
      body: ListView.builder(
        itemBuilder: (context, i) {
          if (i < attributes.length) {
            return buildAttributeTile(attributes[i]);
          } else if (!empty && i == attributes.length) {
            return const Divider();
          } else {
            return stops[i - attributes.length - dividerCount];
          }
        },
        itemCount: attributes.length + dividerCount + stops.length,
      ),
    );
  }

  Widget buildAttributeTile(Attribute att) {
    return ListTile(
      leading: IconTheme(
        data: const IconThemeData(color: Colors.white, size: 20),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: att.icon ?? const Icon(CupertinoIcons.info_circle),
          ),
        ),
      ),
      horizontalTitleGap: 8,
      title: Text(att.message!),
      dense: true,
      trailing: isDebugMode && att.icon == null ? const Text('Unhandled') : null,
    );
  }

  Widget _buildLine(bool isVisible) {
    return Container(
      width: isVisible ? 2 : 0,
      color: Colors.grey.shade400,
    );
  }

  Widget _buildCircle(BuildContext context, Leg l) {
    return Container(
      decoration: BoxDecoration(color: parseColor(l.bgcolor, Colors.black), shape: BoxShape.circle),
      width: 12,
      height: 12,
    );
  }

  Widget _buildStop(
    Leg l,
    Stop stop,
    BuildContext context, {
    bool bold = false,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 28,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: _buildLine(!isFirst)),
                _buildCircle(context, l),
                Expanded(child: _buildLine(!isLast)),
              ],
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                stop.name,
                style: TextStyle(fontWeight: bold ? FontWeight.bold : null),
              ),
            ),
            if (stop.departure != null) ...[
              const SizedBox(width: 8),
              Text(
                Format.time(stop.departure),
                style: TextStyle(fontWeight: bold ? FontWeight.bold : null),
              ),
            ],
          ],
        ),
      ),
    );
  }

  List<Widget> _stops(Leg l, BuildContext context) {
    return [
      _buildStop(
        l,
        Stop(l.name, departure: l.departure),
        context,
        bold: true,
        isFirst: true,
      ),
      ...l.stops.map((s) => _buildStop(l, s, context)),
      _buildStop(
        l,
        Stop(l.exit!.name, departure: l.exit!.arrival),
        context,
        bold: true,
        isLast: true,
      )
    ];
  }
}
