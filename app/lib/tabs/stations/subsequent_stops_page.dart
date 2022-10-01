import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/subsequent_stop.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/tabs/stations/stop_details.dart';
import 'package:swift_travel/utils/strings/format.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/route.dart';

class NextStopsPage extends StatefulWidget {
  const NextStopsPage({
    required this.c,
    required this.s,
    Key? key,
  }) : super(key: key);

  final Stop? s;
  final StationboardConnection c;

  @override
  _NextStopsPageState createState() => _NextStopsPageState();
}

class _NextStopsPageState extends State<NextStopsPage> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 10), rebuild);
  }

  void rebuild(void _) {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        top: false,
        bottom: false,
        child: PlatformBuilder(
          cupertinoBuilder: (context, child) => CupertinoPageScaffold(
            navigationBar: const SwiftCupertinoBar(),
            child: child!,
          ),
          materialBuilder: (context, child) => Scaffold(
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
                      departure: widget.c.time,
                      depDelay: widget.c.depDelay,
                      arrDelay: widget.c.arrDelay,
                    ),
                    isFirst: true,
                    connection: widget.c,
                  )
                : StopTile(
                    stop: widget.c.subsequentStops[i - 1],
                    connection: widget.c,
                    isLast: i - 1 == widget.c.subsequentStops.length - 1,
                  ),
          ),
        ),
      );
}

class StopTile extends StatelessWidget {
  const StopTile({
    required this.stop,
    required this.connection,
    this.isFirst = false,
    this.isLast = false,
    Key? key,
  }) : super(key: key);

  final DelayedStop stop;
  final StationboardConnection connection;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => unawaited(Navigator.of(context)
            .push(PlatformPageRoute(builder: (context) => StopDetails(stop)))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 64,
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: _Line(!isFirst)),
                    _Circle(connection),
                    Expanded(child: _Line(!isLast)),
                  ],
                ),
                const Gap(16),
                Expanded(
                  child: ListTile(
                    title: Text(
                      stop.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text.rich(TextSpan(children: [
                      TextSpan(
                        text: Format.time(stop.departure ?? stop.arrival),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (stop.depDelay != null || stop.arrDelay != null)
                        TextSpan(
                          text: Format.delay(stop.arrDelay != null
                              ? stop.arrDelay!
                              : stop.depDelay!),
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
        ),
      );
}

class _Circle extends StatelessWidget {
  const _Circle(
    this.connection, {
    Key? key,
  }) : super(key: key);

  final StationboardConnection connection;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: connection.bgcolor ?? Colors.black,
        shape: BoxShape.circle,
      ),
      width: 16,
      height: 16,
    );
  }
}

class _Line extends StatelessWidget {
  const _Line(
    this.isVisible, {
    Key? key,
  }) : super(key: key);

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? const SizedBox(
            width: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFE0E0E0),
              ),
            ),
          )
        : const SizedBox();
  }
}
