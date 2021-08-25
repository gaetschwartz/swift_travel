import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/search/search.dart';
import 'package:swift_travel/states/station_states.dart';
import 'package:swift_travel/tabs/routes/completion.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';

class StopInputDialog extends StatefulWidget {
  const StopInputDialog({
    Key? key,
    this.title = '',
    this.inputType = TextInputType.text,
  }) : super(key: key);

  final String title;
  final TextInputType inputType;

  @override
  _StopInputDialogState createState() => _StopInputDialogState();
}

final _stateProvider = StateProvider<StationStates>((_) => const StationStates.empty());

class _StopInputDialogState extends State<StopInputDialog> {
  late BaseNavigationApi api;

  final node = FocusNode();
  final debouncer = Debouncer();

  @override
  void initState() {
    super.initState();
    node.requestFocus();
  }

  @override
  void dispose() {
    node.dispose();
    debouncer.dispose();
    FocusManager.instance.primaryFocus?.unfocus();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    api = context.read(navigationAPIProvider);
  }

  void onChanged(String s) {
    debouncer.debounce(() => fetch(s));
  }

  Future<void> fetch(String query) async {
    try {
      final compls = await api.complete(query);

      if (mounted) {
        context.read(_stateProvider).state = StationStates.completions(compls);
      }
    } on SocketException {
      context.read(_stateProvider).state = const StationStates.network();
    } on Exception catch (e, s) {
      reportDartError(e, s, library: 'search', reason: 'while fetching');
    }
  }

  @override
  Widget build(BuildContext context) => PlatformBuilder(
        cupertinoBuilder: (context, child) => CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          navigationBar: SwiftCupertinoBar(middle: Text(widget.title)),
          child: SafeArea(child: child!),
        ),
        materialBuilder: (context, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(leading: const CloseButton(), title: Text(widget.title)),
          body: child,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                onSubmitted: submit,
                focusNode: node,
                decoration: InputDecoration(hintText: AppLoc.of(context).search_station),
                onChanged: onChanged,
              ),
            ),
            Expanded(
              child: Consumer(builder: (context, w, _) {
                final s = w(_stateProvider);
                return s.state.maybeWhen(
                  completions: (c) => ListView.builder(
                    itemBuilder: (context, i) => RouteCompletionTile(
                      c[i],
                      onTap: () {
                        Navigator.of(context).pop<String>(c[i].label);
                        node.unfocus();
                      },
                    ),
                    itemCount: c.length,
                  ),
                  orElse: () => const SizedBox(),
                );
              }),
            )
          ],
        ),
      );

  void submit(String s) => Navigator.of(context).pop<String>(s);
}
