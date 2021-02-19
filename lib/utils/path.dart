import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

Future<String> getHivePathOf(Directory? appDir, [List<String> paths = const ['hive_data']]) async {
  if (appDir == null) throw Exception('Failed to get application path.');

  final finalPath = path.joinAll([appDir.path, ...paths]);
  return finalPath;
}

Future<Directory?> getApplicationPath() async {
  if (Platform.isWindows || Platform.isLinux) {
    return await getApplicationSupportDirectory();
  } else if (Platform.isIOS || Platform.isMacOS) {
    return await getLibraryDirectory();
  } else if (Platform.isAndroid) {
    return await getExternalStorageDirectory();
  }
}
