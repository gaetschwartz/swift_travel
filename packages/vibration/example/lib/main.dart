import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Center(
            child: ListView(
              children: <Widget>[
                for (var v in VibrationType.values)
                  ElevatedButton(
                    onPressed: () => Vibration.instance.vibrate(type: v),
                    child: Text('$v'),
                  ),
              ],
            ),
          ),
        ),
      );
}
