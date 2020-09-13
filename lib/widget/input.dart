import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/api/cff/cff_completion.dart';
import 'package:swiss_travel/blocs/cff.dart';
import 'package:swiss_travel/widget/icon.dart';

class StopInputDialog extends StatefulWidget {
  final String title;
  final TextInputType inputType;

  const StopInputDialog({
    Key key,
    this.title = "",
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  _StopInputDialogState createState() => _StopInputDialogState();
}

class _StopInputDialogState extends State<StopInputDialog> {
  final TextEditingController _controller = TextEditingController();

  final node = FocusNode();

  @override
  void initState() {
    super.initState();
    node.requestFocus();
  }

  @override
  void dispose() {
    node.dispose();
    FocusManager.instance.primaryFocus.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => submit(context),
        child: const FaIcon(FontAwesomeIcons.save),
      ),
      body: Align(
        alignment: const AlignmentDirectional(0.5, -0.8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration<void>(
              onSubmitted: (_) => submit(context),
              focusNode: node,
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "To",
              ),
            ),
            suggestionsCallback: (pattern) =>
                context.read(cffProvider).complete(pattern),
            itemBuilder: (context, CffCompletion suggestion) => ListTile(
              leading: CffIcon.fromIconClass(suggestion.iconclass),
              title: Text(suggestion.label),
              subtitle: suggestion.iconclass != null
                  ? Text(suggestion.iconclass.split("-").last)
                  : null,
            ),
            onSuggestionSelected: (CffCompletion suggestion) {
              node.unfocus();
              Navigator.of(context).pop<String>(suggestion.label);
            },
          ),
        ),
      ),
    );
  }

  Future submit(BuildContext context) async {
    final complete = await context
        .read(cffProvider)
        .complete(_controller.text, showIds: true);
    Navigator.of(context).pop<String>(complete.first.id);
  }
}
