import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:swift_travel/main.dart';

class PerspectiveWidget extends StatefulWidget {
  @override
  _PerspectiveWidgetState createState() => _PerspectiveWidgetState();
}

class _PerspectiveWidgetState extends State<PerspectiveWidget> {
  double a = 0;
  double b = 0;
  double c = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Transform(
              transform: Matrix4.rotationX(a)
                ..rotateY(b)
                ..rotateZ(c),
              child: CustomPaint(
                painter: PerspectivePainter(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                      child: AspectRatio(
                          aspectRatio: 9 / 19.5,
                          child: LayoutBuilder(builder: (context, c) {
                            return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(size: Size(c.maxWidth, c.maxHeight)),
                                child: wrappedApp());
                          }))),
                ),
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 16),
              Text(a.toString()),
              Expanded(
                  child:
                      Slider(value: a, onChanged: (v) => setState(() => a = v), max: math.pi * 2)),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 16),
              Text(b.toString()),
              Expanded(
                  child:
                      Slider(value: b, onChanged: (v) => setState(() => b = v), max: math.pi * 2)),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 16),
              Text(c.toString()),
              Expanded(
                  child:
                      Slider(value: c, onChanged: (v) => setState(() => c = v), max: math.pi * 2)),
            ],
          ),
        ],
      ),
    );
  }
}

class PerspectivePainter extends CustomPainter {
  final blue = Paint()..color = Colors.blue;
  final linesPaint = Paint()
    ..color = Colors.white
    ..strokeWidth = 1;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset.zero & size,
      blue,
    );
    var s = 0.0;

    while (s < size.longestSide) {
      if (s < size.height) {
        canvas.drawLine(Offset(0, s), Offset(size.width, s), linesPaint);
      }
      if (s < size.width) {
        canvas.drawLine(Offset(s, 0), Offset(s, size.height), linesPaint);
      }
      s += 20;
    }
  }

  @override
  bool shouldRepaint(covariant PerspectivePainter oldDelegate) => true;
}
