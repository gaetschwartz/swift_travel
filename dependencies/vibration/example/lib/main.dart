import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              for (var v in VibrationType.values)
                ElevatedButton(child: Text('$v'), onPressed: () => Vibration.vibrate(type: v)),
            ],
          ),
        ),
      ),
    );
  }
}
