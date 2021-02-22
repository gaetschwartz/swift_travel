import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

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
                    MaterialPageRoute(builder: (context) => HeaderPage()),
                  );
                },
                child: const Text('Header'))
          ],
        ),
      ),
    );
  }
}

class HeaderPage extends StatefulWidget {
  const HeaderPage({
    Key? key,
  }) : super(key: key);

  @override
  _HeaderPageState createState() => _HeaderPageState();
}

enum SizeType {
  custom,
  github,
}

class _HeaderPageState extends State<HeaderPage> {
  final globalKey = GlobalKey();

  bool hasBackground = false;
  SizeType sizeType = SizeType.custom;

  static const double scale = 128;

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
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: screenshot,
        child: const Icon(Icons.camera_alt),
      ),
      backgroundColor: Colors.grey,
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
                    SizeType.values.map((e) => Text(e.toString())).toList(),
                value: sizeType,
                onChanged: (v) {
                  if (v != null) setState(() => sizeType = v);
                },
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox.fromSize(
                child: wrapWithSize(
                  DecoratedBox(
                    decoration: BoxDecoration(border: Border.all(width: 4)),
                    child: RepaintBoundary(
                        key: globalKey,
                        child: Container(
                          color: hasBackground ? Colors.white : null,
                          child: Padding(
                            padding: const EdgeInsets.all(scale / 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox.fromSize(
                                  size: const Size.fromRadius(scale),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.deepPurple.withOpacity(0.2),
                                          blurRadius: scale / 2,
                                        )
                                      ],
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(scale / 2)),
                                      color: Colors.white,
                                      image: const DecorationImage(
                                        image:
                                            AssetImage('logo/swift.png', package: 'swift_travel'),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: scale / 2),
                                Text(
                                  'Swift Travel',
                                  style: GoogleFonts.openSans(fontSize: scale, letterSpacing: 2),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              ),
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
    final File imgFile = File(p.join(
        directory, 'header${hasBackground ? '-bg' : ''}-${describeEnum(sizeType)}-$scale.png'));
    imgFile.writeAsBytes(pngBytes);
    log(imgFile.path);
  }
}
