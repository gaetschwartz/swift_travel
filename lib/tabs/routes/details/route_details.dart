import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as m;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';
import 'package:swift_travel/apis/cff/models/leg.dart';
import 'package:swift_travel/apis/cff/models/route_connection.dart';
import 'package:swift_travel/apis/cff/models/types_enum.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/live_route/live_route.dart';
import 'package:swift_travel/tabs/routes/details/tiles/arrived_tile.dart';
import 'package:swift_travel/tabs/routes/details/tiles/transport_tile.dart';
import 'package:swift_travel/tabs/routes/details/tiles/walking_tile.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:swift_travel/utils/share.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

class RouteDetails extends StatelessWidget {
  final CffRoute route;
  final int i;
  final bool doClose;

  const RouteDetails({
    Key key,
    @required this.route,
    @required this.i,
    this.doClose = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final conn = route.connections[i];
    final darwin = Responsive.isDarwin(context);
    return IfWrapper(
        condition: darwin,
        builder: (context, child) {
          return CupertinoPageScaffold(
            child: SafeArea(
              child: child,
              bottom: false,
            ),
            navigationBar: cupertinoBar(context,
                middle: Text(Strings.of(context).tabs_route),
                trailing: IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {
                      showActionSheet<void>(
                          context,
                          [
                            ActionsSheetAction(
                              icon: const Icon(CupertinoIcons.play_fill),
                              onPressed: () => openLive(context, conn),
                              title: const Text('Live Route'),
                            ),
                            ActionsSheetAction(
                              icon: const Icon(CupertinoIcons.game_controller),
                              onPressed: () => Navigator.of(context)
                                  .push(CupertinoPageRoute(builder: (_) => const Snecc_c_c())),
                              title: const Text('Snake'),
                            ),
                            if (isMobile || kIsWeb)
                              ActionsSheetAction(
                                icon: const Icon(CupertinoIcons.share),
                                onPressed: () => _shareRoute(context),
                                title: const Text('Share'),
                              )
                          ],
                          cancel: ActionsSheetAction(
                              icon: const Icon(CupertinoIcons.xmark),
                              title: Text(Strings.of(context).close)));
                    })),
          );
        },
        elseBuilder: (context, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: child,
            ),
        child: CustomScrollView(
          slivers: [
            if (!darwin)
              SliverAppBar(
                  title: Text(Strings.of(context).tabs_route),
                  pinned: true,
                  floating: true,
                  leading: doClose ? const CloseButton() : null,
                  flexibleSpace: const SizedBox(),
                  actions: <Widget>[
                    IconButton(
                        icon: const Icon(CupertinoIcons.game_controller),
                        onPressed: () => Navigator.of(context)
                            .push(CupertinoPageRoute(builder: (_) => const Snecc_c_c()))),
                    IconButton(
                        icon: const Icon(CupertinoIcons.play_fill),
                        onPressed: () => openLive(context, conn)),
                    if (isMobile || kIsWeb)
                      IconButton(
                          icon: Responsive.isDarwin(context)
                              ? const Icon(CupertinoIcons.share)
                              : const Icon(Icons.share),
                          onPressed: () => _shareRoute(context))
                  ]),
            SliverToBoxAdapter(child: buildHeader(context, conn)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) => LegTile(l: conn.legs[i]),
                childCount: conn.legs.length,
              ),
            ),
          ],
        ));
  }

  String _format(String place) {
    final i = place.indexOf('@');
    if (i == -1) return place;
    return place.substring(0, i);
  }

  PreferredSize buildPreferred(BuildContext context, RouteConnection c, Size size) {
    return PreferredSize(
      preferredSize: size,
      child: SizedBox.fromSize(size: size, child: buildHeader(context, c)),
    );
  }

  Widget buildHeader(BuildContext context, RouteConnection c) {
    return Column(
      children: [
        const SizedBox(height: 8),
        DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyText1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _dataRow(Strings.of(context).departure, _format(c.from)),
                _dataRow(Strings.of(context).destination, _format(c.to)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(Strings.of(context).travel_duration),
                    const SizedBox(width: 8),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text: '${Format.time(c.departure)} - ${Format.time(c.arrival)}',
                                    style: const TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: ' (${Format.intToDuration(c.duration.round())})')
                              ]),
                              textAlign: TextAlign.end,
                            )))
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 8),
      ],
    );
  }

  void _shareRoute(BuildContext context) {
    Vibration.select();
    shareRoute(context, route, i);
  }

  void openLive(BuildContext context, RouteConnection c) {
    Vibration.select();
    Navigator.of(context)
        .push(MaterialWithModalsPageRoute(builder: (_) => LiveRoutePage(connection: c)));
  }

  void base64Experiment() {
    final connection = route.connections[i];
    final json = connection.toJson().toString();
    log(json);
    final bytes = ascii.encode(json);
    final compressed = zlib.encode(bytes);
    final compressed64 = base64.encode(compressed);
    final raw64 = base64.encode(bytes);
    log('compresssed : ${compressed64.length}, raw : ${raw64.length}');
    log(compressed64);
  }

  Widget _dataRow(String key, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(key),
        const SizedBox(width: 8),
        Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  text,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                )))
      ],
    );
  }
}

class Snecc_c_c extends StatefulWidget {
  const Snecc_c_c({
    Key key,
  }) : super(key: key);

  @override
  _Snecc_c_cState createState() => _Snecc_c_cState();
}

@immutable
class Pos {
  final int x;
  final int y;

  const Pos(this.x, this.y);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Pos && o.x == x && o.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() => 'Pos(x: $x, y: $y)';

  Pos move(Direction dir) {
    switch (dir) {
      case Direction.up:
        return Pos(x, y - 1);
        break;
      case Direction.down:
        return Pos(x, y + 1);
        break;
      case Direction.right:
        return Pos(x + 1, y);
        break;
      case Direction.left:
        return Pos(x - 1, y);
        break;
    }
    throw Exception();
  }
}

enum Direction {
  up,
  down,
  right,
  left,
}

class _Snecc_c_cState extends State<Snecc_c_c> with SingleTickerProviderStateMixin {
  final r = m.Random();
  final snecc = ListQueue<Pos>();
  Ticker ticker;
  int tick = 0;
  double period = 300;
  bool started = false;

  final gridSize = 20;

  Pos food;

  Pos head;
  Direction dir = Direction.up;

  @override
  void initState() {
    super.initState();
    ticker = createTicker(update)..stop();
  }

  @override
  void dispose() {
    ticker.dispose();
    super.dispose();
  }

  void start() {
    setState(() {
      started = true;
      head = Pos((gridSize / 2).round(), (gridSize / 2).round());
      snecc.addAll([for (var i = 0; i < 5; i++) head]);
      food = Pos(r.nextInt(gridSize), r.nextInt(gridSize));
      dir = Direction.up;
      period = 300;
      tick = 0;
    });
    ticker.start();
  }

  void update(Duration elapsed) {
    final t = elapsed.inMilliseconds ~/ period;
    if (t != tick) {
      head = head.move(dir);

      snecc.removeFirst();
      snecc.add(head);
      var isHead = true;

      for (var i = snecc.length - 1; i >= 0; i--) {
        final body = snecc.elementAt(i);
        if (body != head) {
          isHead = false;
        } else if (body == head && !isHead) {
          print(snecc);
          showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                    title: Text('You ate yourself !'),
                  ));
          stop();
          setState(() => tick = t);
          return;
        }
      }

      if (food == head) {
        snecc.add(head);
        food = Pos(r.nextInt(gridSize), r.nextInt(gridSize));
        if (period >= 175) period -= 25;
      } else if (head.x >= gridSize || head.x < 0 || head.y >= gridSize || head.y < 0) {
        showDialog(
            context: context,
            builder: (_) => const AlertDialog(
                  title: Text('You lost !'),
                ));
        stop();
      }
      setState(() => tick = t);
    }
  }

  void stop() {
    ticker.stop();
    snecc.clear();
    setState(() {
      started = false;
      food = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Snecc game'),
        ),
        floatingActionButton: FloatingActionButton(
          child: started ? const Icon(Icons.stop) : const Icon(Icons.play_arrow),
          onPressed: started ? stop : start,
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: CustomPaint(
                      painter: MyPainter(gridSize, snecc, food),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '↑',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  onPressed: () => dir = Direction.up,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '←',
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                      onPressed: () => dir = Direction.left,
                    ),
                    const SizedBox(width: 32),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '→',
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                      onPressed: () => dir = Direction.right,
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '↓',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  onPressed: () => dir = Direction.down,
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final int gridSize;
  final Queue<Pos> snecc;
  final Pos food;

  MyPainter(this.gridSize, this.snecc, this.food);

  final p2 = Paint()..color = Colors.pink;
  final fud = Paint()..color = Colors.blue;
  final p = Paint()
    ..color = Colors.black
    ..strokeWidth = 1;

  @override
  void paint(Canvas canvas, Size size) {
    final l = size.shortestSide;
    final block = l / gridSize;

    for (var i = 0; i <= gridSize; i++) {
      canvas.drawLine(Offset(0, i * block), Offset(gridSize * block, i * block), p);
      canvas.drawLine(Offset(i * block, 0), Offset(i * block, gridSize * block), p);
    }
    for (var p in snecc) {
      canvas.drawRect(Offset(p.x * block, p.y * block) & Size(block, block), p2);
    }
    if (food != null) {
      canvas.drawRect(Offset(food.x * block, food.y * block) & Size(block, block), fud);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LegTile extends StatelessWidget {
  const LegTile({
    Key key,
    @required this.l,
  }) : super(key: key);

  final Leg l;

  @override
  Widget build(BuildContext context) => l.exit == null
      ? ArrivedTile(l: l)
      : l.type == Vehicle.walk
          ? WalkingTile(l: l)
          : TransportLegTile(l: l);
}
