import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/subsequent_stop.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/utils/strings/format.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/responsive.dart';

class NextStopsPage extends StatefulWidget {
  final StationboardConnection c;
  final Stop? s;

  const NextStopsPage({required this.c, Key? key, required this.s}) : super(key: key);

  @override
  _NextStopsPageState createState() => _NextStopsPageState();
}

class _NextStopsPageState extends State<NextStopsPage> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 10), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: IfWrapper(
        condition: Responsive.isDarwin(context),
        builder: (context, child) => CupertinoPageScaffold(
          child: child!,
          navigationBar: cupertinoBar(context),
        ),
        elseBuilder: (context, child) => Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              title: Text(widget.c.terminal.name),
            ),
            body: child),
        child: ListView.builder(
          itemCount: widget.c.subsequentStops.length + 1,
          itemBuilder: (context, i) => i == 0
              ? StopTile(
                  stop: SbbSubsequentStop(
                    name: widget.s!.name,
                    dep: widget.c.time,
                    depDelay: widget.c.depDelay,
                    arrDelay: widget.c.arrDelay,
                  ),
                  isFirst: true,
                  connection: widget.c)
              : StopTile(
                  stop: widget.c.subsequentStops[i - 1],
                  connection: widget.c,
                  isFirst: false,
                  isLast: i - 1 == widget.c.subsequentStops.length - 1,
                ),
        ),
      ),
    );
  }
}

class StopTile extends StatelessWidget {
  final SubsequentStop stop;
  final StationboardConnection connection;
  final bool isFirst;
  final bool isLast;

  Widget _buildLine(bool isVisible) {
    return Container(
      width: isVisible ? 1 : 0,
      color: Colors.grey.shade400,
    );
  }

  Widget _buildCircle(BuildContext context, StationboardConnection connection) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(
        color:
            parseColor(connection.color.substring(0, connection.color.indexOf('~')), Colors.black),
        shape: BoxShape.circle,
      ),
      width: 16,
      height: 16,
    );
  }

  const StopTile({
    Key? key,
    required this.stop,
    required this.connection,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 64,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: _buildLine(!isFirst)),
                _buildCircle(context, connection),
                Expanded(child: _buildLine(!isLast)),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ListTile(
                title: Text(
                  stop.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: Format.time(stop.dep ?? stop.arr),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (stop.depDelay > 0 || stop.arrDelay > 0)
                    TextSpan(
                      text: Format.delay(stop.arrDelay > 0 ? stop.arrDelay : stop.depDelay),
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ])),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
