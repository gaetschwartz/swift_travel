import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/apis/cff/models/stationboard_connection.dart';
import 'package:swift_travel/apis/cff/models/subsequent_stop.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/responsive.dart';

class NextStopsPage extends StatefulWidget {
  final StationboardConnection connection;

  const NextStopsPage({@required this.connection, Key key}) : super(key: key);

  @override
  _NextStopsPageState createState() => _NextStopsPageState();
}

class _NextStopsPageState extends State<NextStopsPage> {
  StationboardConnection connection;

  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 15), (_) => setState(() {}));
    connection = widget.connection;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IfWrapper(
      condition: Responsive.isDarwin(context),
      builder: (context, child) => CupertinoPageScaffold(
        child: child,
        navigationBar: cupertinoBar(context, middle: Text(connection.terminal.name)),
      ),
      elseBuilder: (context, child) => Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
            title: Text(connection.terminal.name),
          ),
          body: child),
      child: connection != null
          ? ListView.builder(
              itemCount: connection.subsequentStops.length + 1,
              itemBuilder: (context, i) => i == 0
                  ? StopTile(
                      stop: SubsequentStop(
                        connection.terminal.name,
                        dep: connection.time,
                        depDelay: connection.depDelay,
                        arrDelay: connection.arrDelay,
                      ),
                      isFirst: true,
                      connection: connection)
                  : StopTile(
                      stop: connection.subsequentStops[i - 1],
                      connection: connection,
                      isFirst: false,
                      isLast: i - 1 == connection.subsequentStops.length - 1,
                    ),
            )
          : const Center(child: CircularProgressIndicator()),
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
    Key key,
    @required this.stop,
    @required this.connection,
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
