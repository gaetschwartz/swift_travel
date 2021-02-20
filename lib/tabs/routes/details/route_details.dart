import 'dart:collection';
import 'dart:math' as m;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/vehicle_iconclass.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/live_route/live_route.dart';
import 'package:swift_travel/tabs/routes/details/tiles/arrived_tile.dart';
import 'package:swift_travel/tabs/routes/details/tiles/transport_tile.dart';
import 'package:swift_travel/tabs/routes/details/tiles/walking_tile.dart';
import 'package:swift_travel/utils/share.dart';
import 'package:swift_travel/utils/strings/format.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

class RouteDetails extends StatelessWidget {
  final NavRoute? route;
  final int? i;
  final bool doClose;

  const RouteDetails({
    Key? key,
    required this.route,
    required this.i,
    this.doClose = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final conn = route!.connections[i!];
    final darwin = Responsive.isDarwin(context);
    return IfWrapper(
        condition: darwin,
        builder: (context, child) => Material(
              child: CupertinoPageScaffold(
                child: child!,
                navigationBar: cupertinoBar(context,
                    middle: Text(AppLoc.of(context).tabs_route),
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
                                title: Text(AppLoc.of(context).close)),
                            popBeforeReturn: true,
                          );
                        })),
              ),
            ),
        elseBuilder: (context, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: child,
            ),
        child: CustomScrollView(
          slivers: [
            if (!darwin)
              SliverAppBar(
                  title: Text(AppLoc.of(context).tabs_route),
                  pinned: true,
                  floating: true,
                  leading: doClose ? const CloseButton() : null,
                  flexibleSpace: const SizedBox(),
                  actions: <Widget>[
                    IconButton(
                        icon: const Icon(CupertinoIcons.game_controller),
                        onPressed: () => Navigator.of(context)
                            .push<void>(CupertinoPageRoute(builder: (_) => const Snecc_c_c()))),
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
            SliverSafeArea(
              sliver: SliverToBoxAdapter(child: buildHeader(context, conn)),
              bottom: false,
              top: darwin,
            ),
            SliverSafeArea(
              top: false,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, i) => LegTile(conn.legs[i]),
                  childCount: conn.legs.length,
                ),
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
          style: Theme.of(context).textTheme.bodyText1!,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _dataRow(AppLoc.of(context).departure, _format(c.from)),
                _dataRow(AppLoc.of(context).destination, _format(c.to)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(AppLoc.of(context).travel_duration),
                    const SizedBox(width: 8),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text: '${Format.time(c.departure)} - ${Format.time(c.arrival)}',
                                    style: const TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: ' (${Format.intToDuration(c.duration!.round())})')
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
    shareRoute(context, route!, i);
  }

  void openLive(BuildContext context, RouteConnection c) {
    Vibration.select();
    Navigator.of(context)
        .push<void>(MaterialPageRoute(builder: (_) => LiveRoutePage(connection: c)));
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
    Key? key,
  }) : super(key: key);

  @override
  _Snecc_c_cState createState() => _Snecc_c_cState();
}

@immutable
class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Point && o.x == x && o.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() => 'Pos(x: $x, y: $y)';

  Point move(Direction dir) {
    switch (dir) {
      case Direction.up:
        return Point(x, y - 1);
      case Direction.down:
        return Point(x, y + 1);
      case Direction.right:
        return Point(x + 1, y);
      case Direction.left:
        return Point(x - 1, y);
    }
  }
}

enum Direction {
  up,
  down,
  right,
  left,
}

class ValueIntent<T> extends Intent {
  final T value;

  const ValueIntent(this.value);
}

class ValueAction<T> extends Action {
  final Object Function(T value) onInvoke;

  ValueAction(this.onInvoke);

  @override
  Object invoke(covariant ValueIntent<T> intent) {
    return onInvoke(intent.value);
  }
}

class _Snecc_c_cState extends State<Snecc_c_c> with SingleTickerProviderStateMixin {
  final r = m.Random();
  final snecc = ListQueue<Point?>();
  int tick = 0;
  double period = 300;
  bool started = false;

  final gridSize = 20;

  Point? food;

  Point? head;
  Direction dir = Direction.up;

  late final Ticker ticker = createTicker(update)..stop();

  @override
  void dispose() {
    ticker.dispose();
    super.dispose();
  }

  void start() {
    setState(() {
      started = true;
      head = Point((gridSize / 2).round(), (gridSize / 2).round());
      snecc.addAll([for (var i = 0; i < 5; i++) head]);
      food = Point(r.nextInt(gridSize), r.nextInt(gridSize));
      dir = Direction.up;
      period = 300;
      tick = 0;
    });
    ticker.start();
  }

  void update(Duration elapsed) {
    final t = elapsed.inMilliseconds ~/ period;
    if (t != tick) {
      head = head!.move(dir);

      snecc.removeFirst();
      snecc.add(head);
      var isHead = true;

      for (var i = snecc.length - 1; i >= 0; i--) {
        final body = snecc.elementAt(i);
        if (body != head) {
          isHead = false;
        } else if (body == head && !isHead) {
          print(snecc);
          showDialog<void>(
              context: context,
              builder: (_) => const AlertDialog(title: Text('You ate yourself !')));
          stop();
          setState(() => tick = t);
          return;
        }
      }

      if (food == head) {
        snecc.add(head);
        food = Point(r.nextInt(gridSize), r.nextInt(gridSize));
        if (period >= 175) period -= 25;
      } else if (head!.x >= gridSize || head!.x < 0 || head!.y >= gridSize || head!.y < 0) {
        showDialog<void>(
            context: context, builder: (_) => const AlertDialog(title: Text('You lost !')));
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
      child: FocusableActionDetector(
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.arrowUp): const ValueIntent(Direction.up),
          LogicalKeySet(LogicalKeyboardKey.arrowDown): const ValueIntent(Direction.down),
          LogicalKeySet(LogicalKeyboardKey.arrowRight): const ValueIntent(Direction.right),
          LogicalKeySet(LogicalKeyboardKey.arrowLeft): const ValueIntent(Direction.left),
        },
        actions: {ValueIntent: ValueAction(((Direction value) => dir = value))},
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
                      child: CustomPaint(painter: MyPainter(gridSize, snecc, food)),
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
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final int gridSize;
  final Queue<Point?> snecc;
  final Point? food;

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
    for (final p in snecc) {
      canvas.drawRect(Offset(p!.x * block, p.y * block) & Size(block, block), p2);
    }
    if (food != null) {
      canvas.drawRect(Offset(food!.x * block, food!.y * block) & Size(block, block), fud);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LegTile extends StatelessWidget {
  const LegTile(
    this.leg, {
    Key? key,
  }) : super(key: key);

  final Leg leg;

  @override
  Widget build(BuildContext context) => leg.exit == null
      ? ArrivedTile(leg)
      : leg.type == Vehicle.walk
          ? WalkingTile(leg)
          : TransportLegTile(leg);
}
