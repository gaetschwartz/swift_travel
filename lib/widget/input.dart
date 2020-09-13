import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_free/api/cff/cff_completion.dart';
import 'package:travel_free/blocs/cff.dart';
import 'package:travel_free/widget/icon.dart';

class StopInputDialog extends StatefulWidget {
  final String title;
  final TextEditingController _controller;
  final TextInputType inputType;

  StopInputDialog({
    Key key,
    this.title = "",
    String initialText,
    this.inputType = TextInputType.text,
  })  : _controller = TextEditingController(text: initialText),
        super(key: key);

  @override
  _StopInputDialogState createState() => _StopInputDialogState();
}

class _StopInputDialogState extends State<StopInputDialog> {
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
        suggestionsCallback: (pattern) => context.read(cffProvider).complete(pattern),
        itemBuilder: (context, CffCompletion suggestion) => ListTile(
          leading: CffIcon.fromIconClass(suggestion.iconclass),
          title: Text(suggestion.label),
          subtitle:
              suggestion.iconclass != null ? Text(suggestion.iconclass.split("-").last) : null,
        ),
        onSuggestionSelected: (CffCompletion suggestion) =>
            Navigator.of(context).pop<String>(suggestion.label),
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
