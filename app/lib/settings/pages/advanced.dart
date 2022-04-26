import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/settings/widgets/settings_page_widget.dart';
import 'package:swift_travel/settings/widgets/switch.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';

class AdvancedSettingsPage extends ConsumerStatefulWidget {
  const AdvancedSettingsPage({Key? key}) : super(key: key);

  @override
  _AdvancedSettingsPageState createState() => _AdvancedSettingsPageState();
}

class _AdvancedSettingsPageState extends ConsumerState<AdvancedSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SettingsPageWidget(
      title: Text(AppLocalizations.of(context).advanced_settings),
      children: [
        SwiftSettingsSwitchTile.property(
          property: ref.read(preferencesProvider).useAnalytics,
          title: const Text('Use analytics'),
          subtitle: const Text('The app collects anonymized crash reports.'),
          tileBorders: TileBorders.all,
          isSubtitleOutside: true,
        ),
      ],
    );
  }
}
