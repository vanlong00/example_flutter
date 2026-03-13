import 'dart:io';

import 'package:name_plus/name_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class StorageHelper {
  static Future<Directory> getCacheDirectoryApp() async {
    final cacheDir = await getTemporaryDirectory();
    final appCacheDir = Directory('${cacheDir.path}/app_cache');
    if (!(await appCacheDir.exists())) {
      await appCacheDir.create(recursive: true);
    }
    return appCacheDir;
  }

  static Future<File> saveFileToCache({required String path, required List<int> bytes}) async {
    final appCacheDir = await getCacheDirectoryApp();
    final parentDir = p.dirname(path);
    if (parentDir != '.' && parentDir != '/') {
      final dir = Directory('${appCacheDir.path}/$parentDir');
      if (!await dir.exists()) await dir.create(recursive: true);
      final file = await File(dir.path).namePlus(p.basename(path), format: '(d)');
      await file.writeAsBytes(bytes);
      return file;
    } else {
      final file = await File(appCacheDir.path).namePlus(p.basename(path), format: '(d)');
      await file.writeAsBytes(bytes);
      return file;
    }
  }

  static Future<Directory> saveDirToCache({required String name}) async {
    final appCacheDir = await getCacheDirectoryApp();
    final dir = await Directory(appCacheDir.path).namePlus(p.basename(name), format: '(d)');
    return dir;
  }

  static Future<void> clearTemporaryFiles() async {
    final appCacheDir = await getCacheDirectoryApp();
    if (await appCacheDir.exists()) {
      await appCacheDir.delete(recursive: true);
    }
  }

  /// Returns total size in bytes of all files under the app cache directory.
  static Future<int> getCacheSize() async {
    final appCacheDir = await getCacheDirectoryApp();
    if (!await appCacheDir.exists()) return 0;
    int total = 0;
    await for (final entity in appCacheDir.list(recursive: true, followLinks: false)) {
      if (entity is File) {
        total += await entity.length();
      }
    }
    return total;
  }

  static Future<File> getTemporaryFile(String fileName) async {
    final appCacheDir = await getCacheDirectoryApp();
    final file = File('${appCacheDir.path}/$fileName');
    return file;
  }
}
