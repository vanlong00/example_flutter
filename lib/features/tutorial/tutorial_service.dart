import 'package:shared_preferences/shared_preferences.dart';

/// Manages whether the in-app tutorial should be shown.
///
/// Uses [SharedPreferences] to persist the "seen" state across launches.
/// Call [shouldShow] on startup and [markSeen] right before starting the
/// showcase so that a crash mid-tutorial doesn't reset it.
abstract final class TutorialService {
  static const _key = 'tutorial_seen_v1';

  /// Returns `true` if the user has never completed the tutorial.
  static Future<bool> shouldShow() async {
    final prefs = await SharedPreferences.getInstance();
    return !(prefs.getBool(_key) ?? false);
  }

  /// Marks the tutorial as seen so it is never shown again.
  static Future<void> markSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
  }
}
