import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/cff/models/cff_stationboard.dart';
import 'package:swift_travel/apis/cff/models/stationboard_connection.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:swift_travel/widgets/cff_icon.dart';
import 'package:swift_travel/widgets/line_icon.dart';
import 'package:theming/responsive.dart';

class StopDetails extends StatefulWidget {
  final String stopName;

  StopDetails({@required this.stopName}) : super(key: Key(stopName));

  @override
  _StopDetailsState createState() => _StopDetailsState();
}

class _StopDetailsState extends State<StopDetails> {
  CffStationboard data;

  Timer timer;
  bool _elevate = false;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 15), (_) => setState(() {}));
    refreshData();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDarwin(context)) {
      return CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        navigationBar: cupertinoBar(
          context,
          middle: Text(widget.stopName),
        ),
        child: buildIOSList(),
      );
    } else {
      return NotificationListener<ScrollNotification>(
        onNotification: (notif) {
          final e = notif.metrics.pixels > 0;
          if (e != _elevate) setState(() => _elevate = e);
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(widget.stopName),
            elevation: _elevate ? 8 : 0,
          ),
          body: buildAndroidList(),
        ),
      );
    }
  }

  Widget buildAndroidList() {
    return RefreshIndicator(
      child: data != null
          ? ListView.builder(
              itemBuilder: (context, i) =>
                  i.isEven ? const Divider(height: 0) : ConnectionTile(c: data.connections[i ~/ 2]),
              itemCount: data.connections.length * 2 + 1,
            )
          : const Center(child: CupertinoActivityIndicator()),
      onRefresh: refreshData,
    );
  }

  Widget buildIOSList() {
    return CustomScrollView(
      slivers: [
        CupertinoSliverRefreshControl(onRefresh: refreshData),
        if (data != null)
          SliverSafeArea(
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => i.isEven
                    ? const Divider(height: 0)
                    : ConnectionTile(c: data.connections[i ~/ 2]),
                childCount: data.connections.length * 2 + 1,
              ),
            ),
          )
        else
          const SliverFillRemaining(
            child: Center(child: CupertinoActivityIndicator()),
          ),
      ],
    );
  }

  Widget buildNoData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '😕',
              style: TextStyle(fontSize: 64),
            ),
            const SizedBox(height: 16),
            Text(
              data.messages.isNotEmpty
                  ? data.messages.join('\n')
                  : "We couldn't find any departures from this location",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Future<void> refreshData() async {
    final stationBoard = await context.read(navigationAPIProvider).stationboard(widget.stopName);
    if (mounted) setState(() => data = stationBoard);
  }
}

class ConnectionTile extends StatelessWidget {
  final StationboardConnection c;

  const ConnectionTile({Key key, @required this.c}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final diff = c.time.difference(DateTime.now());
    final i = c.color.indexOf('~');

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: () => Navigator.of(context).pushNamed('/nextStops', arguments: c),
      title: Row(
        children: [
          if (i != -1) LineIcon.fromString(line: c.line, colors: c.color),
          const SizedBox(width: 8),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                c.terminal.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: <Widget>[
            CffIcon(c.type, size: 16),
            const SizedBox(width: 8),
            Text.rich(
              TextSpan(
                  text: Format.time(c.time),
                  style: Theme.of(context).textTheme.bodyText2,
                  children: [
                    if (c.arrDelay > 0)
                      TextSpan(
                        text: Format.delay(c.arrDelay),
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ]),
            ),
          ],
        ),
      ),
      trailing: (c.depDelay > 0)
          ? Text(
              Format.duration(diff + Duration(minutes: c.depDelay)),
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            )
          : Text(Format.duration(diff)),
    );
  }
}
