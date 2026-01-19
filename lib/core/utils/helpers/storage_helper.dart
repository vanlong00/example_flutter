import 'dart:io';

import 'package:name_plus/name_plus.dart';
import 'package:path_provider/path_provider.dart';

class StorageHelper {
  static Future<Directory> getCacheDirectoryApp() async {
    final cacheDir = await getTemporaryDirectory();
    final appCacheDir = Directory('${cacheDir.path}/app_cache');
    if (!(await appCacheDir.exists())) {
      await appCacheDir.create(recursive: true);
    }
    return appCacheDir;
  }

  static Future<File> saveFileToCache({required String fileName, required List<int> bytes}) async {
    final appCacheDir = await getCacheDirectoryApp();
    final file = await File(appCacheDir.path).namePlus(fileName, format: '(d)');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future<void> clearTemporaryFiles() async {
    final appCacheDir = await getCacheDirectoryApp();
    if (await appCacheDir.exists()) {
      await appCacheDir.delete(recursive: true);
    }
  }

  static Future<File> getTemporaryFile(String fileName) async {
    final appCacheDir = await getCacheDirectoryApp();
    final file = File('${appCacheDir.path}/$fileName');
    return file;
  }
}
