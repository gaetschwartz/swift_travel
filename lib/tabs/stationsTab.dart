import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/completion.dart';
import 'package:travel_free/pages/detailsStop.dart';
import 'package:travel_free/widget/icon.dart';

final _loadingProvider = StateProvider((_) => false);

class SearchByName extends StatefulWidget {
  @override
  _SearchByNameState createState() => _SearchByNameState();
}

class _SearchByNameState extends State<SearchByName> {
  final TextEditingController searchController = TextEditingController();
  List<Completion> _completions;
  Timer _debouncer;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
            height: 64,
            child: Center(
                child: Text(
              "Look for a station",
              style: Theme.of(context).textTheme.headline4,
            ))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            style: DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.normal),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Stop",
            ),
            onChanged: (s) async {
              context.read(_loadingProvider).state = true;
              // Debounce
              if (_debouncer?.isActive ?? false) {
                _debouncer?.cancel();
                _debouncer = Timer(const Duration(milliseconds: 500), () => reload(s));
              } else {
                await reload(s);
                _debouncer?.cancel();
                _debouncer = Timer(const Duration(milliseconds: 500), () {});
              }
            },
          ),
        ),
        Expanded(
          child: Consumer(builder: (context, w, _) {
            return w(_loadingProvider).state
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemBuilder: (context, i) => CompletionTile(_completions[i]),
                    separatorBuilder: (context, i) => const Divider(),
                    itemCount: _completions == null ? 0 : _completions.length,
                  );
          }),
        ),
      ],
    );
  }

  Future<void> reload(String s) async {
    final cs = await CFF().complete(s);
    if (mounted) {
      setState(() => _completions = cs.where((c) => c.label != null).toList());
    }
    context.read(_loadingProvider).state = false;
  }
}

class CompletionTile extends StatelessWidget {
  const CompletionTile(
    this.suggestion, {
    Key key,
  }) : super(key: key);

  final Completion suggestion;

  @override
  Widget build(BuildContext context) {
    if (suggestion.label == null) log(suggestion.toString());
    return ListTile(
      leading: CffIcon(suggestion.iconclass),
      title: Text(suggestion.label ?? ""),
      dense: true,
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => DetailsStop(
                stopName: suggestion.label,
              ))),
    );
  }
}
