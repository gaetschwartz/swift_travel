import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/tabs/routes/details/tiles/transport_tile.dart';
import 'package:swift_travel/tabs/routes/details/tiles/walking_tile.dart';
import 'package:swift_travel/tabs/routes/route_tile.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/widgets/route_widget.dart';
import 'package:theming/dynamic_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            EditorPage('header', (scale) => HeaderWidget(scale: scale * 128))),
                  );
                },
                child: const Text('Header')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            EditorPage('widgets', (scale) => WidgetsShowcase(scale: scale * 128))),
                  );
                },
                child: const Text('Widgets')),
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
}

class _EditorPageState extends State<EditorPage> {
  final globalKey = GlobalKey();

  bool hasBackground = false;
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
                onChanged: (v) => setState(() => hasBackground = v)),
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
                selectedItemBuilder: (context) =>
                    SizeType.values.map((e) => Center(child: Text(e.toString()))).toList(),
                value: sizeType,
                onChanged: (v) {
                  if (v != null) setState(() => sizeType = v);
                },
              ),
            ),
            DynamicTheme(
              theme: DynamicThemeData(
                const ThemeConfiguration(
                  themes: {
                    'default': FullTheme(
                      light: ColorScheme.light(),
                      dark: ColorScheme.dark(),
                      name: 'Default',
                      lightShadow: lightShadow,
                      darkShadow: darkShadow,
                    )
                  },
                  defaultTheme: 'default',
                  persist: false,
                ),
              ),
              child: Builder(builder: (context) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(blurRadius: 16, color: Color(0x800700b1))]),
                    child: SizedBox.fromSize(
                      child: wrapWithSize(
                        DecoratedBox(
                          decoration: const BoxDecoration(color: Colors.grey),
                          child: RepaintBoundary(
                              key: globalKey,
                              child: Container(
                                color: hasBackground ? Colors.white : null,
                                child: widget.builder(scale),
                              )),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> screenshot() async {
    final RenderRepaintBoundary? boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) throw Exception();
    final ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory())!.path;
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();
    final File imgFile = File(p.join(directory, filename));
    imgFile.writeAsBytes(pngBytes);
    log(imgFile.path);
  }

  String get filename =>
      '${widget.name}${hasBackground ? '-bg' : ''}-${describeEnum(sizeType)}-$scale.png';
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
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          foregroundColor: Colors.black,
          textTheme: Typography.englishLike2018.apply(bodyColor: Colors.black),
          iconTheme: const IconThemeData(color: Colors.black),
          actionsIconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
      ),
      child: Builder(builder: (context) {
        return Stack(
          children: [
            DefaultTextStyle(
              style: GoogleFonts.openSans(
                  textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 24),
              child: Padding(
                  padding: EdgeInsets.all(scale / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        SizedBox(
                            width: 400,
                            child: RouteTile(route: CffRoute.fromJson(mockRoute!), i: 0)),
                        const SizedBox(width: 32),
                        const Text('Simple, readable information.')
                      ]),
                      Row(children: [
                        SizedBox(
                          width: 400,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(16)),
                              boxShadow: shadowListOf(context),
                            ),
                            child: Column(
                              children: [
                                WalkingTile(
                                    CffRoute.fromJson(mockRoute!).connections.first.legs[0]),
                                TransportLegTile(
                                  CffRoute.fromJson(mockRoute!).connections.first.legs[1],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 32),
                        const Text('Just the information need')
                      ]),
                      Row(children: [
                        SizedBox(
                          width: 400,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(16)),
                              boxShadow: shadowListOf(context),
                            ),
                            child: const RouteWidget(
                              from: Text("Université populaire de Fribourg"),
                              to: Text("Genève, Uni-Mail"),
                              icon: Text('💡', style: TextStyle(fontSize: 24)),
                              title: Text('Suggestion'),
                              fromOverride: "From",
                              toOverride: "To",
                            ),
                          ),
                        ),
                        const SizedBox(width: 32),
                        const Text('Smart suggestions')
                      ]),
                    ],
                  )),
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
      }),
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
            style: GoogleFonts.openSans(fontSize: scale, letterSpacing: 2),
          ),
        ],
      ),
    );
  }
}
