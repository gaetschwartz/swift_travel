import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageNotFound extends StatefulWidget {
  final RouteSettings settings;

  const PageNotFound({Key key, @required this.settings}) : super(key: key);

  @override
  _PageNotFoundState createState() => _PageNotFoundState();
}

class _PageNotFoundState extends State<PageNotFound> {
  bool _wrapped = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page not found"),
        actions: [
          IconButton(
              icon: _wrapped ? Icon(Icons.wrap_text) : Icon(CupertinoIcons.text_badge_checkmark),
              onPressed: () => setState(() => _wrapped = !_wrapped))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            _DataWidget(
              "Name:",
              widget.settings.name,
              wrapped: _wrapped,
            ),
            _DataWidget(
              "Arguments:",
              widget.settings.arguments.toString(),
              wrapped: _wrapped,
            ),
            _DataWidget(
              "Arguments type:",
              widget.settings.arguments.runtimeType.toString(),
              wrapped: _wrapped,
            ),
            _DataWidget(
              "StackTrace:",
              StackTrace.current.toString(),
              wrapped: _wrapped,
            ),
          ],
        ),
      ),
    );
  }
}

class _DataWidget extends StatelessWidget {
  const _DataWidget(
    this.name,
    this.value, {
    Key key,
    this.wrapped = true,
  }) : super(key: key);

  final String name;
  final String value;
  final bool wrapped;

  @override
  Widget build(BuildContext context) {
    final text = Text(value,
        style: Theme.of(context)
            .textTheme
            .bodyText2
            .copyWith(fontFamily: GoogleFonts.firaCode().fontFamily));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: Theme.of(context).textTheme.bodyText1),
          SizedBox(height: 4),
          Card(
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: double.infinity,
                child: wrapped
                    ? text
                    : SingleChildScrollView(
                        child: text,
                        scrollDirection: Axis.horizontal,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
