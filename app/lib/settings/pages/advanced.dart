import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/settings/widgets/settings_page_widget.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';

import 'error_reporting.dart';

class AdvancedSettingsPage extends ConsumerStatefulWidget {
  const AdvancedSettingsPage({super.key});

  @override
  _AdvancedSettingsPageState createState() => _AdvancedSettingsPageState();
}

class _AdvancedSettingsPageState extends ConsumerState<AdvancedSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SettingsPageWidget(
      title: Text(AppLocalizations.of(context).advanced_settings),
      children: [
        // SwiftSettingsSwitchTile.property(
        //   property: ref.read(preferencesProvider).useAnalytics,
        //   title: const Text('Use analytics'),
        //   subtitle: const Text('The app collects anonymized crash reports.'),
        //   tileBorders: TileBorders.all,
        //   isSubtitleOutside: true,
        // ),
        SwiftSettingsTile(
          title: const Text('Error reporting'),
          onTap: () async {
            await Navigator.of(context).push<void>(
                MaterialPageRoute(builder: (_) => const ErrorReportingPage()));
          },
          tileBorders: TileBorders.all,
        ),
      ],
    );
  }
}
