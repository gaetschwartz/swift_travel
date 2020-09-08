import "package:flutter/material.dart";
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/completion.dart';
import 'package:travel_free/widget/icon.dart';

class TextInputDialog extends StatefulWidget {
  final String title;
  final TextEditingController _controller;
  final TextInputType inputType;
  final bool isSensitive;

  TextInputDialog({
    Key key,
    this.title = "",
    String initialText,
    this.inputType = TextInputType.text,
    this.isSensitive = false,
  })  : _controller = TextEditingController(text: initialText),
        super(key: key);

  @override
  _TextInputDialogState createState() => _TextInputDialogState();
}

class _TextInputDialogState extends State<TextInputDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(widget.title),
      content: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
            controller: widget._controller,
            autofocus: true,
            decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "To")),
        suggestionsCallback: (pattern) async {
          final l = await CFF().complete(pattern);
          return l;
        },
        itemBuilder: (context, Completion suggestion) {
          print(suggestion);
          return ListTile(
            leading: CffIcon(suggestion.iconclass),
            title: Text(suggestion.label),
            subtitle:
                suggestion.iconclass != null ? Text(suggestion.iconclass.split("-").last) : null,
          );
        },
        onSuggestionSelected: (Completion suggestion) {
          setState(() {
            widget._controller.text = suggestion.label;
          });
        },
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop<String>(widget._controller.text);
          },
          child: const Text("Valider"),
        )
      ],
    );
  }
}
