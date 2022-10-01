import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/subsequent_stops_page.dart';
import 'package:swift_travel/utils/definitions.dart';
import 'package:swift_travel/utils/strings/format.dart';
import 'package:swift_travel/widgets/line_icon.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:swift_travel/widgets/sbb_icon.dart';
import 'package:theming/responsive.dart';

class StopDetails extends ConsumerStatefulWidget {
  const StopDetails(this.stop, {Key? key}) : super(key: key);

  final Stop stop;

  @override
  _StopDetailsState createState() => _StopDetailsState();
}

class _StopDetailsState extends ConsumerState<StopDetails> {
  StationBoard? data;

  late Timer timer;
  bool _elevate = false;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 15), update);
    unawaited(refreshData());
  }

  void update(void _) {
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
  Widget build(BuildContext context) {
    if (isThemeDarwin(context)) {
      return CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        navigationBar: SwiftCupertinoBar(
            trailing: IconButton(
                icon: const Icon(Icons.double_arrow_rounded),
                onPressed: () {
                  SideBar.push(
                      context,
                      (context) => RoutePage.stop(FavoriteStop.fromStop(
                            widget.stop.name,
                            api: ref.read(preferencesProvider).api.value,
                          )));
                })),
        child: buildIOSList(),
      );
    } else {
      return NotificationListener<ScrollNotification>(
        onNotification: onNotification,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(widget.stop.name),
            elevation: _elevate ? 8 : 0,
            actions: [
              IconButton(
                  icon: const Icon(Icons.double_arrow_rounded),
                  onPressed: () {
                    SideBar.push(
                        context,
                        (context) => RoutePage.stop(FavoriteStop.fromStop(
                              widget.stop.name,
                              api: ref.read(preferencesProvider).api.value,
                            )));
                  })
            ],
          ),
          body: buildAndroidList(),
        ),
      );
    }
  }

  bool onNotification(ScrollNotification notif) {
    final e = notif.metrics.pixels > 0;
    if (e != _elevate) {
      setState(() => _elevate = e);
    }
    return true;
  }

  @allowReturningWidgets
  Widget buildAndroidList() => RefreshIndicator(
        onRefresh: refreshData,
        child: data != null
            ? data!.errors.isEmpty
                ? ListView.builder(
                    itemBuilder: (context, i) => itemBuilder(i),
                    itemCount: data!.connections.length * 2 + 1,
                  )
                : _NoData(context: context, s: data!)
            : const Center(child: CupertinoActivityIndicator()),
      );

  StatelessWidget itemBuilder(int i) {
    return i.isEven
        ? const Divider(height: 0, thickness: 0.5)
        : ConnectionTile(c: data!.connections[i >> 1], s: data!.stop);
  }

  @allowReturningWidgets
  Widget buildIOSList() => CustomScrollView(
        slivers: [
          SliverSafeArea(
            bottom: false,
            sliver: CupertinoSliverRefreshControl(onRefresh: refreshData),
          ),
          if (data != null)
            SliverSafeArea(
                top: false,
                sliver: data!.errors.isEmpty
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, i) => i.isEven
                              ? const Divider(height: 0, thickness: 0.5)
                              : ConnectionTile(
                                  c: data!.connections[i >> 1],
                                  s: data!.stop,
                                ),
                          childCount: data!.connections.length * 2 + 1,
                        ),
                      )
                    : SliverFillRemaining(
                        child: _NoData(context: context, s: data!)))
          else
            const SliverFillRemaining(
              child: Center(child: CupertinoActivityIndicator()),
            ),
        ],
      );

  Future<void> refreshData() async {
    final stationBoard = await ref.read(navigationAPIProvider).stationboard(
          widget.stop,
          when: DateTime.now(),
        );
    if (mounted) {
      setState(() => data = stationBoard);
    }
  }
}

class _NoData extends StatelessWidget {
  const _NoData({
    Key? key,
    required this.context,
    required this.s,
  }) : super(key: key);

  final BuildContext context;
  final StationBoard s;

  @override
  Widget build(BuildContext context) => Padding(
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
              const Gap(16),
              Text(
                s.errors.isNotEmpty
                    ? s.errors.join('\n')
                    : "We couldn't find any departures from this location",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
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
      onTap: () => unawaited(Navigator.of(context).push(PlatformPageRoute(
        builder: (context) => NextStopsPage(c: c, s: s),
        title: s!.name,
      ))),
      title: Row(
        children: [
          if (c.bgcolor != null) ...[
            LineIcon.raw(
                line: c.line, foreground: c.fgcolor, background: c.bgcolor),
            const Gap(8),
          ],
          Text(
            c.terminal.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: <Widget>[
            SbbIcon(c.type, size: 16),
            const Gap(8),
            Text.rich(
              TextSpan(text: Format.time(c.time), children: [
                if (c.arrDelay != null)
                  TextSpan(
                    text: Format.delay(c.arrDelay!),
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ]),
            ),
            if (c.track != null) ...[
              const Text(' | '),
              buildTrack(),
            ]
          ],
        ),
      ),
      trailing: c.depDelay != null
          ? Text(
              Format.duration(diff + Duration(minutes: c.depDelay!))!,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            )
          : Text(Format.duration(diff)!),
    );
  }

  @allowReturningWidgets
  Text buildTrack() {
    final i = c.track!.indexOf('!');
    final t = i == -1 ? c.track! : c.track!.substring(0, i);
    return Text(
      'Pl. $t',
      style: TextStyle(
        color: i != -1 ? Colors.red : null,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
