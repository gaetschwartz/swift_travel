import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/cff_completion.dart';
import 'package:travel_free/models/station_states.dart';
import 'package:travel_free/pages/detailsStop.dart';
import 'package:travel_free/widget/icon.dart';

final _stateProvider = StateProvider<StationStates>((_) => const StationStates.empty());

class SearchByName extends StatefulWidget {
  @override
  _SearchByNameState createState() => _SearchByNameState();
}

class _SearchByNameState extends State<SearchByName> {
  final TextEditingController searchController = TextEditingController();
  Timer _debouncer;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    reload("");
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
              context.read(_stateProvider).state = const StationStates.loading();
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
            return w(_stateProvider).state.map(
                loading: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                completions: (c) => ListView.separated(
                      itemBuilder: (context, i) => CffCompletionTile(c.completions[i]),
                      separatorBuilder: (context, i) => const Divider(),
                      itemCount: c.completions == null ? 0 : c.completions.length,
                    ),
                empty: (_) => const SizedBox());
          }),
        ),
      ],
    );
  }

  Future<void> reload(String s) async {
    final cs = await CFF().complete(s);

    context.read(_stateProvider).state =
        StationStates.completions(cs.where((c) => c.label != null).toList());
  }
}

class CffCompletionTile extends StatelessWidget {
  const CffCompletionTile(
    this.suggestion, {
    Key key,
  }) : super(key: key);

  final CffCompletion suggestion;

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
