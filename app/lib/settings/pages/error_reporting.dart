import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swift_travel/constants/build.dart';
import 'package:swift_travel/settings/widgets/settings_page_widget.dart';
import 'package:swift_travel/utils/errors.dart';

class ErrorReportingPage extends StatelessWidget {
  const ErrorReportingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformSettingsScaffold(
      title: const Text('Error reporting'),
      action: IconButton(
        icon: Icon(Icons.adaptive.share),
        onPressed: () async {
          final errors = errorEvents.map((e) => e.toJson()).toList();
          final res = const JsonEncoder.withIndent('  ').convert({
            'errors': errors,
            'build': {
              'commit_hash': commitHash,
              'commit_date': commitBuildDate,
              'commit_message': commitMessage,
              'build': await PackageInfo.fromPlatform()
                  .then((value) => 'v${value.version}+${value.buildNumber}'),
            }
          });
          log(res);
          final temp = await getTemporaryDirectory();
          final file = File('${temp.path}/errors.json');
          await file.writeAsString(res);
          await Share.shareXFiles([XFile(file.path)]);
        },
      ),
      child: errorEvents.isEmpty
          ? Center(
              child: Text(
                'No error happened yet :)',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            )
          : ListView.builder(
              itemCount: errorEvents.length,
              itemBuilder: (context, index) {
                final e = errorEvents[index];
                final details = e.errorDetails;
                final time = e.time;
                return ListTile(
                  title: Text(details.exceptionAsString()),
                  subtitle: Text(time.toString()),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => unawaited(
                    Navigator.of(context).push<void>(
                      MaterialPageRoute(
                        builder: (_) => ErrorPage(details),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
