import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconPage extends StatefulWidget {
  const IconPage({super.key});

  @override
  State<IconPage> createState() => _IconPageState();
}

class _IconPageState extends State<IconPage> {
  @override
  Widget build(BuildContext context) {
    /// svg of size 100x100 representing an S using bezier curves
    /// it is a path with a fill color of red and a width of 5
    /// the path is drawn from the botom left to the top right
    /// start: (0, 90), end: (100, 10)
    /// the curves should be smooth
    /// the path is composed of segments:
    /// 1. line : (0, 90) -> (50, 90)
    /// 2. start: (50, 90), end: (50, 50), control1 (90, 90), control2 (90, 50)
    /// 3. start: (50, 50), end: (90, 10), control1 (10, 50), control2 (10, 10)
    /// 4. line : (90, 10) -> (100, 10)
    /// the path is closed
    const size = 128.0;
    const dist = 16.0;
    final builder = SvgPathBuilder();
    builder.moveTo(0, size - dist);
    builder.lineTo(size / 2, size - dist);
    // builder.cubicTo(90, 90, 90, 50, 50, 50);
    builder.cubicTo(
      size - dist,
      size - dist,
      size - dist,
      size / 2,
      size / 2,
      size / 2,
    );
    // builder.cubicTo(10, 50, 10, 10, 50, 10);
    builder.cubicTo(dist, size / 2, dist, dist, size / 2, dist);
    builder.lineTo(size, dist);

    final svg2 = '''
  <svg width="$size" height="$size" viewBox="0 0 $size $size" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="$builder" stroke="purple" stroke-width="4"/>
  </svg>
  ''';

    print(svg2);

    return Scaffold(
      appBar: AppBar(title: const Text('Icon maker')),
      body: Center(
        child: ColoredBox(
          color: Colors.grey.shade300,
          child: SvgPicture.string(svg2, width: 400, height: 400),
        ),
      ),
    );
  }
}

class SvgPathBuilder {
  SvgPathBuilder();

  final bf = StringBuffer();

  void moveTo(double x, double y) {
    bf.write('M$x $y');
  }

  void lineTo(double x, double y) {
    bf.write('L$x $y');
  }

  void cubicTo(
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
  ) {
    bf.write('C$x1 $y1 $x2 $y2 $x3 $y3');
  }

  void close() {
    bf.write('Z');
  }

  @override
  String toString() => bf.toString();
}
