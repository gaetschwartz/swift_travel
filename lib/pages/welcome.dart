import 'package:flutter/material.dart';
import 'package:swift_travel/pages/tuto.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Welcome to SwiftTravel",
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 48,
              child: FlatButton(
                onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute(builder: (_) => Tuto()));
                  Navigator.of(context).pop();
                },
                child: const Text("Open tutorial"),
              ),
            ),
            SizedBox(
              height: 48,
              child: RaisedButton(
                onPressed: () => Navigator.pop(context),
                shape: const StadiumBorder(),
                color: Theme.of(context).accentColor,
                child: const Text("Open the app"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
