import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/logic/location/location.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/prediction/predict.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/routes/route_tile.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/utils/models/coordinates.dart';
import 'package:swift_travel/utils/strings/strings.dart';
import 'package:swift_travel/widgets/route_widget.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:theming/responsive.dart';

final _locationNotFound = RegExp(r'Stop (.*) not found\.');

class RoutesView extends StatelessWidget {
  const RoutesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer(builder: (context, w, _) {
        final fetcher = w.watch(routeStatesProvider);

        return fetcher.state.when(
          (routes) => CustomScrollView(
            slivers: [
              const SliverGap(8),
              SliverSafeArea(
                sliver: routes.connections.isNotEmpty
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, i) => RouteTile(
                            key: Key('routetile-$i'),
                            route: routes,
                            i: i,
                          ),
                          childCount: routes.connections.length,
                        ),
                      )
                    : SliverFillRemaining(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: DefaultTextStyle(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .apply(fontSizeFactor: 1.4),
                              child: routes.messages.isEmpty ||
                                      _locationNotFound
                                          .hasMatch(routes.messages.first)
                                  ? Text(
                                      AppLocalizations.of(context)
                                          .unsupported_area,
                                      textAlign: TextAlign.center,
                                    )
                                  : Text(
                                      routes.messages.join('\n'),
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
          networkException: () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                      child: Text(
                    '😢',
                    style: TextStyle(fontSize: 96),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Network Error',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          locationPermissionNotGranted: () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                          child: Text(
                        '🗺',
                        style: TextStyle(fontSize: 80),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'This app requires location permissions !',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Center(
                child: isThemeDarwin(context)
                    ? const CupertinoButton.filled(
                        onPressed: Geolocator.openAppSettings,
                        child: Text('Open settings'),
                      )
                    : ElevatedButton(
                        onPressed: Geolocator.openAppSettings,
                        style: ElevatedButton.styleFrom(
                          shadowColor:
                              ShadowTheme.of(context).buttonShadow?.color,
                          elevation: 8,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Open settings'),
                      ),
              )),
            ],
          ),
          exception: (e) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                      child: Text(
                    '😢',
                    style: TextStyle(fontSize: 80),
                  )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    e.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
          empty: () => const Align(
            alignment: Alignment.topCenter,
            child: _PredictionTile(),
          ),
          missingPluginException: () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                      child: Text(
                    '😢',
                    style: TextStyle(fontSize: 80),
                  )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Location is not supported on this device',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

final _predictionProvider = FutureProvider<RoutePrediction>((ref) async {
  final dateTime = ref.watch(dateProvider.state).state;
  LatLon? pos;
  try {
    final loc = await GeoLocationEngine.instance
        .getLocation()
        .timeout(const Duration(seconds: 4));
    pos = LatLon.fromGeoLocation(loc);
  } on Exception {
    ignoreError();
  }

  final routes = RouteHistoryRepository.instance.history;
  return predictRoute(
    routes,
    pos != null
        ? LocationArgument(pos, dateTime: null)
        : EmptyArgument(dateTime: dateTime),
  );
});

class _PredictionTile extends StatelessWidget {
  const _PredictionTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final log = Logger('PredictionTile');
    return Consumer(
      builder: (context, ref, child) {
        return ref.watch(_predictionProvider).when(
              data: (pred) {
                if (pred.prediction != null) {
                  return RouteWidget(
                    from: Text(pred.prediction!.fromAsString.stripAt()),
                    to: Text(pred.prediction!.toAsString.stripAt()),
                    onTap: () {
                      ref
                          .read(fromTextfieldProvider)
                          .setString(pred.prediction!.fromAsString);
                      ref
                          .read(toTextfieldProvider)
                          .setString(pred.prediction!.toAsString);
                    },
                    title: Text(AppLocalizations.of(context).suggestion),
                    onLongPress: () async {
                      await showDialog<void>(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text('Arguments'),
                                content: Text(const JsonEncoder.withIndent(' ')
                                    .convert(pred.arguments.toJson())),
                              ));
                    },
                  );
                } else {
                  return child!;
                }
              },
              loading: () => Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: const RouteWidget(
                  from: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 16,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black),
                        child: Text('                           '),
                      ),
                    ),
                  ),
                  to: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 16,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black),
                        child: Text('           '),
                      ),
                    ),
                  ),
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 16,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black),
                        child: Text('               '),
                      ),
                    ),
                  ),
                ),
              ),
              error: (e, s) {
                log.log(e);
                debugPrintStack(stackTrace: s);
                return child!;
              },
            );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '🔎',
            style: TextStyle(fontSize: 48),
          ),
          const Gap(24),
          Text(
            AppLocalizations.of(context).find_a_route,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
