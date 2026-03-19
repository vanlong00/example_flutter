import 'package:url_launcher/url_launcher.dart';

class LauncherHelper {
  static Future<void> launcher(String path, {LaunchMode mode = LaunchMode.platformDefault}) async {
    final Uri uri = Uri.parse(path);
    await launchUrl(uri, mode: mode);
  }
}
