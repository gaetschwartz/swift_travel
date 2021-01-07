import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/cff/models/cff_completion.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/widgets/cff_icon.dart';

class StopInputDialog extends StatefulWidget {
  final String title;
  final TextInputType inputType;

  const StopInputDialog({
    Key key,
    this.title = '',
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
            textFieldConfiguration: TextFieldConfiguration(
              onSubmitted: (_) => submit(context),
              focusNode: node,
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'To',
              ),
            ),
            suggestionsCallback: (pattern) => context.read(navigationAPIProvider).complete(pattern),
            itemBuilder: (context, CffCompletion suggestion) => ListTile(
              leading: CffIcon.fromIconClass(suggestion.icon),
              title: Text(suggestion.label),
            ),
            onSuggestionSelected: (CffCompletion suggestion) {
              node.unfocus();
              Navigator.of(context).pop<String>(suggestion.label);
            },
            noItemsFoundBuilder: (_) => const SizedBox(),
            transitionBuilder: (context, suggestionsBox, controller) => FadeTransition(
              opacity: controller,
              child: suggestionsBox,
            ),
          ),
        ),
      ),
    );
  }

  Future submit(BuildContext context) async {
    Navigator.of(context).pop<String>(_controller.text);
  }
}
