import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/cff_completion.dart';
import 'package:travel_free/api/cff/cff_route.dart';
import 'package:travel_free/api/cff/leg.dart';
import 'package:travel_free/api/cff/route_connection.dart';
import 'package:travel_free/api/cff/stop.dart';
import 'package:travel_free/models/route_states.dart';
import 'package:travel_free/pages/detailsRoute.dart';
import 'package:travel_free/utils/format.dart';
import 'package:travel_free/widget/icon.dart';

final _loadingProvider = StateProvider((_) => false);
final _switchProvider = StateProvider((_) => false);
final _dateProvider = StateProvider((_) => DateTime.now());
final _timeProvider = StateProvider((_) => TimeOfDay.now());
final _routesProvider = StateProvider((_) => const RouteStates.empty());

class SearchRoute extends StatefulWidget {
  @override
  _SearchRouteState createState() => _SearchRouteState();
}

class _SearchRouteState extends State<SearchRoute> with AutomaticKeepAliveClientMixin {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final FocusNode fnFrom = FocusNode();
  final FocusNode fnTo = FocusNode();

  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey();

  @override
  void dispose() {
    fnFrom.dispose();
    fnTo.dispose();
    fromController.dispose();
    toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final cff = ProviderScope.containerOf(context, listen: false).read(cffProvider);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TypeAheadField<CffCompletion>(
                  debounceDuration: const Duration(milliseconds: 500),
                  textFieldConfiguration: TextFieldConfiguration(
                      controller: fromController,
                      style:
                          DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.normal),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "From",
                      )),
                  suggestionsCallback: (pattern) => cff.complete(pattern),
                  itemBuilder: (context, suggestion) => ListTile(
                    leading: CffIcon(suggestion.iconclass),
                    title: Text(suggestion.label),
                    dense: true,
                  ),
                  onSuggestionSelected: (suggestion) => fromController.text = suggestion.label,
                  noItemsFoundBuilder: (_) => const SizedBox(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(icon: Consumer(builder: (context, w, _) {
                final loading = w(_loadingProvider).state;
                return loading
                    ? const CircularProgressIndicator()
                    : const FaIcon(FontAwesomeIcons.locationArrow);
              }), onPressed: () async {
                context.read(_loadingProvider).state = true;
                final p =
                    await getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
                log("Position is : $p");

                final completions =
                    await context.read(cffProvider).findStation(p.latitude, p.longitude);
                log("Found : $completions");

                final first = completions.first;
                if (first.dist != null) {
                  fromController.text = completions.first.label;
                }

                context.read(_loadingProvider).state = false;
              })
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TypeAheadField<CffCompletion>(
                  debounceDuration: const Duration(milliseconds: 500),
                  textFieldConfiguration: TextFieldConfiguration(
                      controller: toController,
                      style:
                          DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.normal),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder(), hintText: "To")),
                  suggestionsCallback: (pattern) => cff.complete(pattern),
                  itemBuilder: (context, suggestion) => ListTile(
                    leading: CffIcon(suggestion.iconclass),
                    title: Text(suggestion.label),
                    dense: true,
                  ),
                  onSuggestionSelected: (suggestion) => toController.text = suggestion.label,
                  noItemsFoundBuilder: (_) => const SizedBox(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                  icon: const FaIcon(FontAwesomeIcons.arrowsAltV),
                  onPressed: () {
                    final from = fromController.text;
                    fromController.text = toController.text;
                    toController.text = from;
                  }),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Consumer(builder: (context, w, _) {
                final _time = w(_timeProvider);
                return RaisedButton.icon(
                  shape: const StadiumBorder(),
                  onPressed: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: _time.state,
                    );
                    if (time == null) return;
                    _time.state = time;
                  },
                  icon: const FaIcon(FontAwesomeIcons.clock),
                  label:
                      Text("${_time.state.hour}:${_time.state.minute.toString().padLeft(2, "0")}"),
                );
              }),
              Consumer(builder: (context, w, _) {
                final _date = w(_dateProvider);
                return RaisedButton.icon(
                  shape: const StadiumBorder(),
                  onPressed: () async {
                    final now = DateTime.now();
                    final dateTime = await showDatePicker(
                      context: context,
                      initialDate: _date.state,
                      firstDate: now.subtract(const Duration(days: 14)),
                      lastDate: now.add(const Duration(days: 28)),
                    );
                    if (dateTime == null) return;
                    _date.state = dateTime;
                  },
                  icon: const FaIcon(FontAwesomeIcons.calendar),
                  label: Text("${_date.state.day}/${_date.state.month}/${_date.state.year}"),
                );
              }),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Consumer(builder: (context, w, _) {
            final sw = w(_switchProvider);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Depart",
                  style: TextStyle(fontWeight: sw.state ? null : FontWeight.bold),
                ),
                Container(
                  width: 60,
                  height: 30,
                  child: Switch(
                    value: sw.state,
                    onChanged: (value) => sw.state = value,
                  ),
                ),
                Text(
                  "Arrivée",
                  style: TextStyle(fontWeight: sw.state ? FontWeight.bold : null),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: RaisedButton.icon(
                      icon: const FaIcon(FontAwesomeIcons.search),
                      onPressed: () async {
                        fnFrom.unfocus();
                        fnTo.unfocus();
                        _refreshKey.currentState.show();
                      },
                      shape: const StadiumBorder(),
                      label: const Text("Search"),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () => searchData(),
            key: _refreshKey,
            child: Consumer(
                builder: (context, w, _) => w(_routesProvider).state.map(
                      routes: (data) => ListView.separated(
                          separatorBuilder: (c, i) => const Divider(),
                          shrinkWrap: true,
                          itemCount: data.routes == null ? 0 : data.routes.connections.length,
                          itemBuilder: (context, i) => RouteTile(c: data.routes.connections[i])),
                      network: (_) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            Icons.wifi_off,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Netork Error",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      error: (e) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            Icons.bug_report,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            e.error.toString(),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      empty: (_) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            Icons.search,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Search a route",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    )),
          ),
        )
      ],
    );
  }

  Future<void> searchData() async {
    if (fromController.text.length > 2 && toController.text.length > 2) {
      try {
        final CffRoute it = await context.read(cffProvider).route(
              Stop(fromController.text),
              Stop(toController.text),
              date: context.read(_dateProvider).state,
              time: context.read(_timeProvider).state,
              typeTime: context.read(_switchProvider).state ? TimeType.arrival : TimeType.depart,
            );
        context.read(_routesProvider).state = RouteStates.routes(it);
      } on SocketException {
        context.read(_routesProvider).state = const RouteStates.network();
      } catch (e) {
        context.read(_routesProvider).state = RouteStates.error(e);
      }
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class RouteTile extends StatelessWidget {
  const RouteTile({
    Key key,
    @required this.c,
  }) : super(key: key);

  final RouteConnection c;

  Widget rowIcon(RouteConnection c) {
    final List<Widget> listWidget = [];

    for (int i = 0; i < c.legs.length - 1; i++) {
      final Leg l = c.legs[i];
      listWidget.add(CffIcon(l.type, size: 18));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Wrap(spacing: 8, children: listWidget),
        ),
        const SizedBox(height: 4),
        Text("${Format.dateToHour(c.departure)} - ${Format.dateToHour(c.arrival)}")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${c.legs.length - 1} steps"),
      subtitle: rowIcon(c),
      trailing: Container(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(Format.intToSeconds(c.duration)),
            const SizedBox(width: 4),
            const FaIcon(FontAwesomeIcons.chevronRight, size: 16),
          ],
        ),
      ),
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailsRoute(c: c))),
    );
  }
}
