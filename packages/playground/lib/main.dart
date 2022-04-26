import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:playground/perspective.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/route.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/tabs/routes/details/tiles/transport/transport_tile.dart';
import 'package:swift_travel/tabs/routes/details/tiles/walking_tile.dart';
import 'package:swift_travel/tabs/routes/route_tile.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/widgets/route_widget.dart';
import 'package:theming/dynamic_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditorPage(
                      'header',
                      (scale) => HeaderWidget(scale: scale * 128),
                    ),
                  ),
                );
              },
              child: const Text('Header'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditorPage(
                      'widgets',
                      (scale) => WidgetsShowcase(scale: scale * 128),
                    ),
                  ),
                );
              },
              child: const Text('Widgets'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      const scale = 128.0;
                      return const BreatheWidget(scale: scale);
                    },
                  ),
                );
              },
              child: const Text('Breathe widget'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PerspectiveWidget(),
                  ),
                );
              },
              child: const Text('Perspective'),
            ),
          ],
        ),
      ),
    );
  }
}

class BreatheWidget extends StatefulWidget {
  const BreatheWidget({
    Key? key,
    required this.scale,
  }) : super(key: key);

  final double scale;

  @override
  _BreatheWidgetState createState() => _BreatheWidgetState();
}

class MyCurve extends Curve {
  const MyCurve(this.thresh);
  final double thresh;

  @override
  double transform(double t) =>
      t < thresh ? 0 : Curves.easeInOutCubic.transform(t / thresh - 1);
}

class CurveCanvas extends CustomPainter {
  final Curve curve;
  final double t;

  CurveCanvas(this.curve, this.t);

  @override
  void paint(ui.Canvas c, ui.Size size) {
    const n = 20;
    final points = [
      for (var i = 0; i < n + 1; i++)
        Offset(size.width * i / n, (1 - curve.transform(i / n)) * size.height)
    ];
    c.drawPoints(
      ui.PointMode.polygon,
      points,
      Paint()..strokeWidth = 4,
    );
    c.drawCircle(
      Offset(size.width * t, (1 - curve.transform(t)) * size.height),
      8,
      Paint()..color = Colors.red,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _BreatheWidgetState extends State<BreatheWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(vsync: this);
  late final CurvedAnimation a;
  static const curve = Curves.easeInOutCirc;

  @override
  void initState() {
    super.initState();
    repeatAnim();
    a = CurvedAnimation(parent: controller, curve: curve);
  }

  void repeatAnim() {
    controller.repeat(
      period: const Duration(milliseconds: 1000),
      reverse: true,
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    controller.stop();
    repeatAnim();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedBuilder(
        animation: a,
        builder: (context, _) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(widget.scale),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.2),
                          blurRadius: a.value * widget.scale,
                        )
                      ],
                      borderRadius:
                          BorderRadius.all(Radius.circular(widget.scale / 2)),
                      color: Colors.white,
                      image: const DecorationImage(
                        image: AssetImage(
                          'logo/swift.png',
                          package: 'swift_travel',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: CustomPaint(
                      painter: CurveCanvas(curve, controller.value),
                      willChange: true,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditorPage extends StatefulWidget {
  const EditorPage(
    this.name,
    this.builder, {
    Key? key,
  }) : super(key: key);

  final Widget Function(double scale) builder;
  final String name;

  @override
  _EditorPageState createState() => _EditorPageState();
}

enum SizeType {
  custom,
  github,
  twitter,
}

class _EditorPageState extends State<EditorPage> {
  final globalKey = GlobalKey();

  bool hasBackground = true;
  SizeType sizeType = SizeType.custom;

  static const double scale = 1;

  Widget wrapWithSize(Widget child) {
    switch (sizeType) {
      case SizeType.custom:
        return child;
      case SizeType.github:
        return SizedBox(
          width: 1280,
          height: 640,
          child: child,
        );
      case SizeType.twitter:
        return SizedBox(
          width: 1500,
          height: 500,
          child: child,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(filename)),
      floatingActionButton: FloatingActionButton(
        onPressed: screenshot,
        child: const Icon(Icons.camera_alt),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('has background'),
              value: hasBackground,
              onChanged: (v) => setState(() => hasBackground = v),
            ),
            ListTile(
              title: const Text("size type"),
              trailing: DropdownButton<SizeType>(
                items: SizeType.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.toString()),
                      ),
                    )
                    .toList(),
                selectedItemBuilder: (context) => SizeType.values
                    .map((e) => Center(child: Text(e.toString())))
                    .toList(),
                value: sizeType,
                onChanged: (v) {
                  if (v != null) setState(() => sizeType = v);
                },
              ),
            ),
            DynamicTheme(
              theme: DynamicThemeData(DynamicThemeData.defaultConfig),
              child: Builder(
                builder: (context) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 16, color: Color(0x800700b1))
                        ],
                      ),
                      child: SizedBox.fromSize(
                        child: wrapWithSize(
                          DecoratedBox(
                            decoration: const BoxDecoration(color: Colors.grey),
                            child: RepaintBoundary(
                              key: globalKey,
                              child: Container(
                                color: hasBackground ? Colors.white : null,
                                child: widget.builder(scale),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> screenshot() async {
    final boundary = (globalKey.currentContext?.findRenderObject())!
        as RenderRepaintBoundary;

    final ui.Image image = await boundary.toImage();
    final directory = (await getTemporaryDirectory()).path;
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    final pngBytes = byteData!.buffer.asUint8List();

    final File imgFile = File(p.join(directory, filename));
    await imgFile.writeAsBytes(pngBytes);
    print(imgFile.path);
  }

  String get filename => '${[
        widget.name,
        if (hasBackground) 'bg',
        describeEnum(sizeType),
        scale
      ].join('-')}.png';
}

class WidgetsShowcase extends StatelessWidget {
  const WidgetsShowcase({
    Key? key,
    required this.scale,
  }) : super(key: key);

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          foregroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
      ),
      child: Builder(
        builder: (context) {
          return Stack(
            children: [
              DefaultTextStyle(
                style: GoogleFonts.openSans(
                  textStyle: Theme.of(context).textTheme.bodyText1,
                  fontSize: 24,
                ),
                child: Padding(
                  padding: EdgeInsets.all(scale / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 400,
                            child: RouteTile(
                              route: SbbRoute.fromJson(mockRoute),
                              i: 0,
                            ),
                          ),
                          const SizedBox(width: 32),
                          const Text('Simple, readable information.')
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 400,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                boxShadow: shadowListOf(context),
                              ),
                              child: Column(
                                children: [
                                  WalkingTile(
                                    SbbRoute.fromJson(mockRoute)
                                        .connections
                                        .first
                                        .legs[0],
                                  ),
                                  TransportLegTile(
                                    SbbRoute.fromJson(mockRoute)
                                        .connections
                                        .first
                                        .legs[1],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 32),
                          const Text('Just the information need')
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 400,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                boxShadow: shadowListOf(context),
                              ),
                              child: const RouteWidget(
                                from: Text("Université populaire de Fribourg"),
                                to: Text("Genève, Uni-Mail"),
                                icon:
                                    Text('💡', style: TextStyle(fontSize: 24)),
                                title: Text('Suggestion'),
                                fromOverride: "From",
                                toOverride: "To",
                              ),
                            ),
                          ),
                          const SizedBox(width: 32),
                          const Text('Smart suggestions')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {},
                  behavior: HitTestBehavior.opaque,
                  child: Container(color: Colors.transparent),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.scale,
  }) : super(key: key);

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(scale / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.fromSize(
            size: Size.fromRadius(scale),
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.2),
                    blurRadius: scale / 2,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(scale / 2)),
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage('logo/swift.png', package: 'swift_travel'),
                ),
              ),
            ),
          ),
          SizedBox(width: scale / 2),
          Text(
            'Swift Travel',
            style: GoogleFonts.ubuntu(fontSize: scale, letterSpacing: 0),
          ),
        ],
      ),
    );
  }
}
