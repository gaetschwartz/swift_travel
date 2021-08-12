import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/subsequent_stops_page.dart';
import 'package:swift_travel/utils/strings/format.dart';
import 'package:swift_travel/widgets/line_icon.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:swift_travel/widgets/sbb_icon.dart';
import 'package:theming/responsive.dart';

class StopDetails extends StatefulWidget {
  const StopDetails(this.stop, {Key? key}) : super(key: key);

  final Stop stop;

  @override
  _StopDetailsState createState() => _StopDetailsState();
}

class _StopDetailsState extends State<StopDetails> {
  StationBoard? data;

  late Timer timer;
  bool _elevate = false;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 15), (_) {
      if (mounted) {
        setState(() {});
      }
    });
    refreshData();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isDarwin(context)) {
      return CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        navigationBar: SwiftCupertinoBar(
            trailing: IconButton(
                icon: const Icon(Icons.double_arrow_rounded),
                onPressed: () {
                  Nav.push(
                      context,
                      (context) => RoutePage.stop(FavoriteStop.fromStop(
                            widget.stop.name,
                            api: context.read(preferencesProvider).api.value,
                          )));
                })),
        child: buildIOSList(),
      );
    } else {
      return NotificationListener<ScrollNotification>(
        onNotification: (notif) {
          final e = notif.metrics.pixels > 0;
          if (e != _elevate) {
            setState(() => _elevate = e);
          }
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(widget.stop.name),
            elevation: _elevate ? 8 : 0,
            actions: [
              IconButton(
                  icon: const Icon(Icons.double_arrow_rounded),
                  onPressed: () {
                    Nav.push(
                        context,
                        (context) => RoutePage.stop(FavoriteStop.fromStop(
                              widget.stop.name,
                              api: context.read(preferencesProvider).api.value,
                            )));
                  })
            ],
          ),
          body: buildAndroidList(),
        ),
      );
    }
  }

  Widget buildAndroidList() => RefreshIndicator(
        onRefresh: refreshData,
        child: data != null
            ? data!.errors.isEmpty
                ? ListView.builder(
                    itemBuilder: (context, i) => i.isEven
                        ? const Divider(height: 0)
                        : ConnectionTile(
                            c: data!.connections[i ~/ 2],
                            s: data!.stop,
                          ),
                    itemCount: data!.connections.length * 2 + 1,
                  )
                : buildNoData(data!)
            : const Center(child: CupertinoActivityIndicator()),
      );

  Widget buildIOSList() => CustomScrollView(
        slivers: [
          SliverSafeArea(
              bottom: false, sliver: CupertinoSliverRefreshControl(onRefresh: refreshData)),
          if (data != null)
            SliverSafeArea(
                top: false,
                sliver: data!.errors.isEmpty
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, i) => i.isEven
                              ? const Divider(height: 0)
                              : ConnectionTile(
                                  c: data!.connections[i ~/ 2],
                                  s: data!.stop,
                                ),
                          childCount: data!.connections.length * 2 + 1,
                        ),
                      )
                    : SliverFillRemaining(
                        child: buildNoData(data!),
                      ))
          else
            const SliverFillRemaining(
              child: Center(child: CupertinoActivityIndicator()),
            ),
        ],
      );

  Widget buildNoData(StationBoard s) => Padding(
        padding: const EdgeInsets.all(8),
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
                s.errors.isNotEmpty
                    ? s.errors.join('\n')
                    : "We couldn't find any departures from this location",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );

  Future<void> refreshData() async {
    final stationBoard = await context.read(navigationAPIProvider).stationboard(
          widget.stop,
        );
    if (mounted) {
      setState(() => data = stationBoard);
    }
  }
}

class ConnectionTile extends StatelessWidget {
  const ConnectionTile({
    required this.c,
    required this.s,
    Key? key,
  }) : super(key: key);

  final StationboardConnection c;
  final Stop? s;

  @override
  Widget build(BuildContext context) {
    final diff = c.time.difference(DateTime.now());

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: () => Navigator.of(context).push(PlatformPageRoute(
        builder: (context) => NextStopsPage(c: c, s: s),
        title: s!.name,
      )),
      title: Row(
        children: [
          if (c.color.contains('~')) ...[
            LineIcon.fromString(line: c.line, colors: c.color),
            const SizedBox(width: 8),
          ],
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
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: <Widget>[
            SbbIcon(c.type, size: 16),
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
              Format.duration(diff + Duration(minutes: c.depDelay))!,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            )
          : Text(Format.duration(diff)!),
    );
  }
}
