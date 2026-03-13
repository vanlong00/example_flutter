import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

/// Helper for requesting and checking external storage permissions.
///
/// - **Android API 30+**: requests `MANAGE_EXTERNAL_STORAGE` (all-files access,
///   required for a file-manager style app). Opens the system settings screen.
/// - **Android API 29**: requests `READ_EXTERNAL_STORAGE` / `WRITE_EXTERNAL_STORAGE`
///   with `requestLegacyExternalStorage` fallback.
/// - **Android API < 29**: requests legacy `READ/WRITE_EXTERNAL_STORAGE`.
/// - **iOS**: returns `true` immediately — file access is handled through the system
///   document picker and does not require an explicit runtime permission.
class PermissionHelper {
  const PermissionHelper._();

  /// Requests the appropriate storage permission for the current platform/API level.
  ///
  /// Returns `true` when access is granted, `false` otherwise.
  /// When a permission is permanently denied, call [openSettings] to let the
  /// user enable it manually.
  static Future<bool> requestStoragePermission() async {
    if (Platform.isIOS) return true;

    // `MANAGE_EXTERNAL_STORAGE` only exists on Android 11+ (API 30+).
    // On older APIs the permission status is `restricted` or `granted` without
    // a real prompt, so we only request it when the OS supports it.
    final manageStatus = await Permission.manageExternalStorage.status;

    if (manageStatus.isGranted) return true;

    // `restricted` means the OS does not support MANAGE_EXTERNAL_STORAGE (< API 30).
    // Fall through to legacy READ/WRITE_EXTERNAL_STORAGE in that case.
    if (!manageStatus.isRestricted && !manageStatus.isPermanentlyDenied) {
      final result = await Permission.manageExternalStorage.request();
      if (result.isGranted) return true;
    }

    // Fallback for Android < API 30: READ / WRITE_EXTERNAL_STORAGE.
    final storageStatus = await Permission.storage.request();
    return storageStatus.isGranted;
  }

  /// Returns `true` when storage permission is already granted (no dialog shown).
  static Future<bool> hasStoragePermission() async {
    if (Platform.isIOS) return true;

    if (await Permission.manageExternalStorage.isGranted) return true;
    return Permission.storage.isGranted;
  }

  /// Returns `true` when the user has permanently denied a storage permission,
  /// meaning the app must direct them to system settings.
  static Future<bool> isStoragePermissionPermanentlyDenied() async {
    if (Platform.isIOS) return false;

    final manage = await Permission.manageExternalStorage.status;
    if (manage.isPermanentlyDenied) return true;

    final storage = await Permission.storage.status;
    return storage.isPermanentlyDenied;
  }

  /// Opens the app's system settings page so the user can manually grant
  /// a permission that was permanently denied.
  static Future<bool> openSettings() => openAppSettings();
}
