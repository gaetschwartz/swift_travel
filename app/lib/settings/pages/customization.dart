import 'dart:async';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/db/favorite_store.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/logic/in_app_purchase.dart';
import 'package:swift_travel/logic/quick_actions.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/settings/pages/in_app_purchases.dart';
import 'package:swift_travel/settings/properties/property.dart';
import 'package:swift_travel/settings/settings.dart';
import 'package:swift_travel/settings/widgets/settings_page_widget.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/colors.dart';
import 'package:swift_travel/widgets/property_page.dart';
import 'package:theming/dynamic_theme.dart';

class CustomizationSettingsPage extends StatefulWidget {
  const CustomizationSettingsPage({super.key});

  @override
  State<CustomizationSettingsPage> createState() =>
      _CustomizationSettingsPageState();
}

class _CustomizationSettingsPageState extends State<CustomizationSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SettingsPageWidget(
      title: Text(AppLocalizations.of(context).customization),
      children: [
        SectionTitle(title: Text(AppLocalizations.of(context).brightness)),
        const _ThemeModeList(),
        const Gap(16),
        _ThemeTile(
          brightness: Brightness.light,
          title: Text(AppLocalizations.of(context).brightness_light),
          tileBorders: const TileBorders(top: true),
        ),
        _ThemeTile(
          brightness: Brightness.dark,
          title: Text(AppLocalizations.of(context).brightness_dark),
        ),
        const _FontChoiceTile(),
        if (Env.isDebugMode) const _PlatformTile(),
        const _QuickActionsEditionTile()
      ],
    );
  }
}

class _QuickActionsEditionTile extends StatelessWidget {
  const _QuickActionsEditionTile();

  @override
  Widget build(BuildContext context) {
    return SwiftSettingsTile(
      title: Text(AppLocalizations.of(context).quick_actions),
      leading: const Icon(Icons.touch_app),
      onTap: () async => Navigator.of(context).push<void>(
        MaterialPageRoute(
          builder: (context) => const QuickActionsEditionPage(),
        ),
      ),
    );
  }
}

class _PlatformTile extends StatelessWidget {
  const _PlatformTile();

  @override
  Widget build(BuildContext context) {
    final theme = DynamicTheme.of(context);
    final p = defaultTargetPlatform;
    return SwiftSettingsPropertyTile<TargetPlatform>(
      leading: const Icon(Icons.phone_android),
      tileBorders: TileBorders.none,
      property: SyncProperty<TargetPlatform>(
        onSet: (p) => unawaited(theme.setPlatform(p)),
        initialValue: theme.platform,
      ),
      valueBuilder: (_, v) => Text(v.name),
      title: const Text('Design'),
      options: p == TargetPlatform.iOS || p == TargetPlatform.android
          ? const [
              ValueOption(
                  value: TargetPlatform.android, title: Text('Android')),
              ValueOption(value: TargetPlatform.iOS, title: Text('iOS')),
            ]
          : const [
              ValueOption(value: TargetPlatform.macOS, title: Text('MacOS')),
              ValueOption(
                  value: TargetPlatform.windows, title: Text('Windows')),
            ],
    );
  }
}

class _ThemeTile extends StatelessWidget {
  const _ThemeTile({
    required this.brightness,
    required this.title,
    this.tileBorders = TileBorders.none,
  });

  final Brightness brightness;
  final Widget title;
  final TileBorders tileBorders;
  @override
  Widget build(BuildContext context) {
    final theme = DynamicTheme.of(context);
    return SwiftSettingsPropertyTile<ExtendedTheme>(
      leading: const Icon(Icons.color_lens),
      tileBorders: tileBorders,
      property: brightness == Brightness.light
          ? SyncProperty<ExtendedTheme>(
              onSet: (p) => unawaited(theme.setLightTheme(p.id)),
              initialValue: theme.theme.light,
            )
          : SyncProperty<ExtendedTheme>(
              onSet: (p) => unawaited(theme.setDarkTheme(p.id)),
              initialValue: theme.theme.dark,
            ),
      valueBuilder: (_, v) => Text(v.name),
      title: title,
      options: (brightness == Brightness.light
              ? theme.configuration.lightThemes
              : theme.configuration.darkThemes)
          .map((e) => ValueOption<ExtendedTheme>(
                value: e,
                title: Text(e.name),
              ))
          .toList(),
    );
  }
}

class _FontChoiceTile extends ConsumerWidget {
  const _FontChoiceTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = DynamicTheme.of(context);
    final inApp = ref.read(inAppPurchaseManagerProvider);
    final unlocked = inApp.hasUnlockedFeature(InAppPaidFeature.customFonts);

    final options = theme.configuration.fonts
        .map(
          (f) => ValueOption(
            value: f,
            title: Text(
              f.name,
              style: f.textTheme(Theme.of(context).textTheme).bodyMedium,
            ),
          ),
        )
        .toList();
    return SwiftSettingsPropertyTile<Font>(
      leading: const Icon(Icons.font_download),
      // ignore: use_named_constants
      tileBorders: const TileBorders(),
      title: Text(AppLocalizations.of(context).font),
      options: options,
      property: SyncProperty<Font>(
        onSet: unlocked ? ((f) => unawaited(theme.setFont(f))) : ((f) {}),
        initialValue: theme.font,
      ),
      valueBuilder: (context, value) => Text(value.name),
      isAllowedToChangeValue: (value) async {
        if (unlocked) {
          return true;
        }
        await showProDialog(context);
        return false;
      },
    );
  }
}

extension TargetPlatfromX on TargetPlatform {
  String get name {
    switch (this) {
      case TargetPlatform.android:
        return 'Android';
      case TargetPlatform.iOS:
        return 'iOS';
      case TargetPlatform.macOS:
        return 'MacOS';
      case TargetPlatform.windows:
        return 'Windows';
      case TargetPlatform.linux:
        return 'Linux';
      case TargetPlatform.fuchsia:
        return 'Fuchsia';
    }
  }
}

class _ThemeModeList extends StatelessWidget {
  const _ThemeModeList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key('settings-top-theme-section'),
      height: 100,
      child: Builder(builder: (context) {
        final theme = DynamicTheme.of(context);
        return ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _ThememodeWidget(
              theme: theme,
              label: AppLocalizations.of(context).brightness_system,
              mode: ThemeMode.system,
            ),
            _ThememodeWidget(
              theme: theme,
              label: AppLocalizations.of(context).brightness_light,
              mode: ThemeMode.light,
            ),
            _ThememodeWidget(
              theme: theme,
              label: AppLocalizations.of(context).brightness_dark,
              mode: ThemeMode.dark,
            ),
          ],
        );
      }),
    );
  }
}

class _ThememodeWidget extends StatelessWidget {
  const _ThememodeWidget({
    required this.theme,
    required this.mode,
    required this.label,
  });

  final DynamicThemeNotifier theme;
  final ThemeMode mode;
  final String label;

  @override
  Widget build(BuildContext context) {
    final b = DynamicTheme.resolveBrightness(context, mode);
    final ThemeData t;
    switch (b) {
      case Brightness.light:
        t = theme.light;
        break;
      case Brightness.dark:
        t = theme.dark;
        break;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: () => unawaited(theme.setThemeMode(mode)),
        child: AspectRatio(
          aspectRatio: 1,
          child: DecoratedBox(
            key: Key('mode-${describeEnum(mode).toLowerCase()}'),
            decoration: BoxDecoration(
                boxShadow: shadowListOf(context),
                color: mode == ThemeMode.system ? null : t.cardColor,
                border: theme.themeMode == mode
                    ? Border.all(
                        width: 2,
                        color: platformPrimaryColor(context),
                      )
                    : null,
                gradient: mode == ThemeMode.system
                    ? LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                            theme.light.colorScheme.background,
                            theme.dark.colorScheme.background,
                          ],
                        stops: const [
                            0.5,
                            0.5,
                          ])
                    : null,
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            child: Center(
              child: mode == ThemeMode.system
                  ? ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: ColoredBox(
                          color: Colors.white30,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 8, top: 4),
                            child: Text(
                              label,
                              style: t.textTheme.titleMedium!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Text(label, style: t.textTheme.titleMedium),
            ),
          ),
        ),
      ),
    );
  }
}

/* class _FontWeightTile extends StatelessWidget {
  const _FontWeightTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = DynamicTheme.of(context);
    const map = {-1: 'Light', 0: 'Normal', 1: 'Medium', 3: 'Bold'};
    // final t = theme.font
    //     .textTheme(Typography.material2018(platform: Theme.of(context).platform).englishLike)
    //     .bodyText1!;
    return SwiftSettingsPropertyTile<int>(
      property: SyncProperty<int>(
        onSet: (delta) => theme.fontWeightDelta = delta,
        initialValue: theme.fontWeightDelta,
      ),
      leading: const Icon(Icons.text_fields),
      title: const Text('Font weight'),
      options: map.keys
          .map((key) => ValueOption<int>(value: key, title: Text(map[key]!)))
          .toList(growable: false),
      valueBuilder: (_, i) => Text(map[i] ?? ''),
    );
  }
} */

final _itemsProvider =
    StateProvider.autoDispose<List<QuickActionsReorderableItem>>((ref) {
  ref.listenSelf((previous, next) {
    final list = next
        .whereType<QuickActionsFavoriteItem>()
        .map((e) => e.item)
        .toList(growable: false);
    ref.read(quickActionsManagerProvider).setQuickActions(list);
    ref.read(favoritesStoreProvider).save(list);
  });
  final store = ref.watch(favoritesStoreProvider);
  final list = store.items.map(QuickActionsReorderableItem.item).toList();
  // sort by quickActionsIndex
  list.sortBy<num>((e) => e.map(
        item: (e) => e.item.quickActionsIndex ?? double.infinity,
        divider: (_) => double.infinity - 1,
      ));
  // find index of last item with quickActionsIndex != null
  final lastItemIndex = list.lastIndexWhere((e) => e.map(
        item: (e) => e.item.quickActionsIndex != null,
        divider: (_) => false,
      ));
  // insert the divider after the last item with quickActionsIndex != null. if there is no such item, insert at the beginning
  list.insert(lastItemIndex + 1, const QuickActionsReorderableItem.divider());

  if (!list.any((e) => e.map(
        item: (e) => e.item is FavoriteUnionStationTabsCurrentLocation,
        divider: (_) => false,
      ))) {
    list.add(const QuickActionsReorderableItem.item(
      FavoriteUnionStationTabsCurrentLocation(
        quickActionsIndex: null,
        id: QuickActionsItem.stationTabsCurrentLocationId,
      ),
    ));
  }

  return list;
});

class QuickActionsEditionPage extends ConsumerWidget {
  const QuickActionsEditionPage({super.key});

  static const quickActions = QuickActions();

  // we want to be to reorder the list, as well as choose which favorites to display in the quick actions
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(_itemsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).quick_actions),
      ),
      body: Column(
        children: [
          // explanation
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              AppLocalizations.of(context).quick_actions_instructions,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const Divider(),
          ListTile(
              title:
                  Text(AppLocalizations.of(context).quick_actions_to_display)),
          ReorderableListView(
            shrinkWrap: true,
            onReorder: (oldIndex, newIndex) {
              final old = items[oldIndex];

              items.removeAt(oldIndex);
              // if we remove an item, we need to adjust the new index
              // take in account if the new index is after the old index
              if (newIndex > oldIndex) {
                newIndex--;
              }
              items.insert(newIndex, old);

              // get index of the divider in the new list
              final dividerIndex =
                  items.indexWhere((e) => e is QuickActionsFavoriteDivider);
              assert(dividerIndex != -1, 'divider not found');
              if (newIndex > dividerIndex) {
                // if the moved item is after the divider, we need set the moved item's index to null
                // so that it doesn't appear in the quick actions
                items[newIndex] = items[newIndex].map(
                  item: (e) => e.copyWith(
                      item: e.item.copyWith(quickActionsIndex: null)),
                  divider: (e) => e,
                );
              } else {
                // otherwise, we need to set the index of the moved item to the index of the divider
                // so that it appears in the quick actions
                items[newIndex] = items[newIndex].map(
                  item: (e) => e.copyWith(
                      item: e.item.copyWith(quickActionsIndex: newIndex)),
                  divider: (e) => e,
                );
              }
              // update the state of the list
              final list = List.of(items);
              ref.read(_itemsProvider.notifier).state = list;
            },
            children: items.mapIndexed((index, item) {
              return SizedBox(
                key: ValueKey(item),
                child: item.map(
                  item: (favItem) => ListTile(
                    leading: favItem.item.map(
                      stop: (_) => const Icon(Icons.place),
                      route: (_) => const Icon(Icons.directions_bus),
                      stationTabsCurrentLocation: (_) =>
                          const Icon(Icons.my_location),
                    ),
                    title: Text(favItem.item.when(
                      stop: (s, id, _) => s.name,
                      route: (r, id, _) => r.displayName ?? r.toPrettyString(),
                      stationTabsCurrentLocation: (_, __) =>
                          AppLocalizations.of(context)
                              .quick_actions_nearby_stops,
                    )),
                    subtitle: favItem.item.when(
                      stop: (s, id, _) => Text(s.stop),
                      route: (r, id, _) => Text(r.toPrettyString()),
                      stationTabsCurrentLocation: (_, __) => null,
                    ),
                    trailing: ReorderableDragStartListener(
                      index: index,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const Icon(Icons.reorder),
                      ),
                    ),
                  ),
                  divider: (_) => ReorderableDragStartListener(
                    index: index,
                    enabled: false,
                    child: ListTile(
                      title: Text(
                        AppLocalizations.of(context)
                            .quick_actions_to_not_display,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          // dismissed actions listview,
        ],
      ),
    );
  }
}

@immutable
class Indexed<T> {
  final int index;
  final T value;

  const Indexed(this.index, this.value);
}

extension ListX<T> on List<T> {
  List<Indexed<T>> get enumerated => mapIndexed(Indexed.new).toList();
}
