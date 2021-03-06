import 'dart:collection';
import 'dart:math' as m;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class SneccGame extends StatefulWidget {
  const SneccGame({
    Key? key,
  }) : super(key: key);

  @override
  _SneccGameState createState() => _SneccGameState();
}

@immutable
class Point {
  const Point(this.x, this.y);

  final int x;
  final int y;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Point && other.x == x && other.y == y;
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
  const ValueIntent(this.value);

  final T value;
}

class ValueAction<T> extends Action {
  ValueAction(this.onInvoke);

  final Object Function(T value) onInvoke;

  @override
  Object invoke(covariant ValueIntent<T> intent) {
    return onInvoke(intent.value);
  }
}

class _SneccGameState extends State<SneccGame> with SingleTickerProviderStateMixin {
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
        if (period >= 175) {
          period -= 25;
        }
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
        actions: {ValueIntent: ValueAction<Direction>((value) => dir = value)},
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Snecc game'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: started ? stop : start,
            child: started ? const Icon(Icons.stop) : const Icon(Icons.play_arrow),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
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
                    onPressed: () => dir = Direction.up,
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        '↑',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                        onPressed: () => dir = Direction.left,
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            '←',
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                      ),
                      const SizedBox(width: 32),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                        onPressed: () => dir = Direction.right,
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            '→',
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                    onPressed: () => dir = Direction.down,
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        '↓',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
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
  MyPainter(this.gridSize, this.snecc, this.food);

  final int gridSize;
  final Queue<Point?> snecc;
  final Point? food;

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
