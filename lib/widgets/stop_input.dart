import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/tabs/routes/suggested.dart';

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
  NavigationApi api;

  final node = FocusNode();

  @override
  void initState() {
    super.initState();
    node.requestFocus();
  }

  @override
  void dispose() {
    node.dispose();
    FocusManager.instance.primaryFocus?.unfocus();
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    api = context.read(navigationAPIProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              onSubmitted: submit,
              focusNode: node,
              controller: _controller,
              decoration: InputDecoration(
                hintText: Strings.of(context).search_station,
              ),
            ),
            suggestionsCallback: (pattern) => api.complete(pattern),
            itemBuilder: (context, suggestion) => SuggestedTile(suggestion),
            onSuggestionSelected: (suggestion) {
              Navigator.of(context).pop<String>(suggestion.label);
              node.unfocus();
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

  void submit(String s) => Navigator.of(context).pop<String>(s);
}
