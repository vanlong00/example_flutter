import 'package:flutter/foundation.dart';

/// AdMob ad unit IDs.
/// In debug mode, Google's official test IDs are returned automatically.
abstract final class AdUnitIds {
  /// AdMob Application ID (used in AndroidManifest.xml / Info.plist).
  static const String appId = 'ca-app-pub-9131188183332364~4072553748';

  /// Test device IDs — add your physical device ID here during development.
  /// Find it in logcat: "Use RequestConfiguration.Builder().setTestDeviceIds(...)"
  static const List<String> testDeviceIds = [];

  static String get banner => kDebugMode
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-9131188183332364/9021628092';

  static String get interstitial => kDebugMode
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-9131188183332364/5353845825';

  static String get native => kDebugMode
      ? 'ca-app-pub-3940256099942544/2247696110'
      : 'ca-app-pub-9131188183332364/4040764158';

  static String get appOpen => kDebugMode
      ? 'ca-app-pub-3940256099942544/9257395921'
      : 'ca-app-pub-9131188183332364/5485707768';
}
