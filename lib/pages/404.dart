import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  final RouteSettings settings;

  const PageNotFound({Key key, @required this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page not found"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
                child: Text(
              "Page not found",
              style: Theme.of(context).textTheme.headline5,
            )),
          ),
          Expanded(
            flex: 2,
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.headline6,
              child: Table(
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Align(
                        child: Text("Name: "),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                    Text("`${settings.name}`"),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Align(
                        child: Text("Arguments: "),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                    Text("`${settings.arguments}`"),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Align(
                        child: Text("Arguments type: "),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                    Text("`${settings.arguments.runtimeType}`")
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
