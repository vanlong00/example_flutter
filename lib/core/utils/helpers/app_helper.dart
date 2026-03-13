import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppHelper {
  static void showSnackBar(BuildContext context, String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showLoadingDialog(BuildContext context, {String message = 'Loading...'}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: '',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 250),
      transitionBuilder: (_, anim, __, child) => FadeTransition(
        opacity: CurvedAnimation(parent: anim, curve: Curves.easeOut),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.92, end: 1).animate(CurvedAnimation(parent: anim, curve: Curves.easeOutBack)),
          child: child,
        ),
      ),
      pageBuilder: (_, __, ___) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.lg),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: AppStyle.borderExtraLarge,
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.15), blurRadius: 24, offset: const Offset(0, 8))],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: AppSpacing.md,
              children: [
                SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.5, color: Theme.of(context).colorScheme.primary)),
                Text(message, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Future<bool> showConfirmDialog(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    IconData? icon,
    Color? iconColor,
    bool isDestructive = false,
  }) async {
    final result = await showGeneralDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (_, anim, __, child) => FadeTransition(
        opacity: CurvedAnimation(parent: anim, curve: Curves.easeOut),
        child: SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic)),
          child: child,
        ),
      ),
      pageBuilder: (ctx, _, __) => _ConfirmDialog(
        title: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        icon: icon,
        iconColor: iconColor,
        isDestructive: isDestructive,
      ),
    );
    return result ?? false;
  }

  static void showAppAboutDialog(
    BuildContext context, {
    required String appName,
    required String version,
    String? legalese,
    String? description,
    IconData icon = Icons.folder_rounded,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (_, anim, __, child) => FadeTransition(
        opacity: CurvedAnimation(parent: anim, curve: Curves.easeOut),
        child: SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic)),
          child: child,
        ),
      ),
      pageBuilder: (ctx, _, __) => _AboutDialog(appName: appName, version: version, legalese: legalese, description: description, icon: icon),
    );
  }

  static String formatCurrency(double amount, {String symbol = '\$'}) {
    return '$symbol${amount.toStringAsFixed(2)}';
  }

  static String formatCompactNumber(int number) {
    if (number < 1000) return number.toString();
    if (number < 1000000) return '${(number / 1000).toStringAsFixed(1)}K';
    if (number < 1000000000) return '${(number / 1000000).toStringAsFixed(1)}M';
    return '${(number / 1000000000).toStringAsFixed(1)}B';
  }

  static String getInitials(String name) {
    List<String> names = name.trim().split(' ');
    if (names.isEmpty) return '';
    if (names.length == 1) return names[0][0].toUpperCase();
    return '${names[0][0]}${names[names.length - 1][0]}'.toUpperCase();
  }

  static Color getColorFromString(String text) {
    int hash = 0;
    for (int i = 0; i < text.length; i++) {
      hash = text.codeUnitAt(i) + ((hash << 5) - hash);
    }
    final int color = (hash & 0x00FFFFFF) | 0xFF000000;
    return Color(color);
  }
}

// ─── Custom confirm dialog ────────────────────────────────────────────────────

class _ConfirmDialog extends StatelessWidget {
  const _ConfirmDialog({
    required this.title,
    required this.message,
    required this.confirmText,
    required this.cancelText,
    this.icon,
    this.iconColor,
    this.isDestructive = false,
  });

  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final IconData? icon;
  final Color? iconColor;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final effectiveIconColor = iconColor ?? (isDestructive ? scheme.error : scheme.primary);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: scheme.surface,
              borderRadius: AppStyle.borderExtraLarge,
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.18), blurRadius: 32, offset: const Offset(0, 12))],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: AppSpacing.xl),
                // icon badge
                if (icon != null) ...[
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: effectiveIconColor.withValues(alpha: 0.12)),
                    alignment: Alignment.center,
                    child: Icon(icon, size: 28, color: effectiveIconColor),
                  ),
                  const SizedBox(height: AppSpacing.md),
                ],
                // title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                // message
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(color: scheme.onSurface.withValues(alpha: 0.6), height: 1.5),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                // divider + action row
                Divider(height: 1, color: scheme.outlineVariant),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      // cancel
                      Expanded(
                        child: _DialogButton(
                          text: cancelText,
                          onTap: () => Navigator.of(context).pop(false),
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppStyle.radiusExtraLarge)),
                          color: scheme.onSurface.withValues(alpha: 0.05),
                          textColor: scheme.onSurface.withValues(alpha: 0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      VerticalDivider(width: 1, color: scheme.outlineVariant),
                      // confirm
                      Expanded(
                        child: _DialogButton(
                          text: confirmText,
                          onTap: () => Navigator.of(context).pop(true),
                          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(AppStyle.radiusExtraLarge)),
                          color: isDestructive ? scheme.error.withValues(alpha: 0.08) : scheme.primary.withValues(alpha: 0.08),
                          textColor: isDestructive ? scheme.error : scheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DialogButton extends StatelessWidget {
  const _DialogButton({
    required this.text,
    required this.onTap,
    required this.borderRadius,
    required this.color,
    required this.textColor,
    required this.fontWeight,
  });

  final String text;
  final VoidCallback onTap;
  final BorderRadius borderRadius;
  final Color color;
  final Color textColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: textColor, fontWeight: fontWeight),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── About dialog ─────────────────────────────────────────────────────────────

class _AboutDialog extends StatelessWidget {
  const _AboutDialog({required this.appName, required this.version, this.legalese, this.description, required this.icon});

  final String appName;
  final String version;
  final String? legalese;
  final String? description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: scheme.surface,
              borderRadius: AppStyle.borderExtraLarge,
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.18), blurRadius: 32, offset: const Offset(0, 12))],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: AppSpacing.x2l),
                // app icon badge
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(borderRadius: AppStyle.borderLarge, color: scheme.primary.withValues(alpha: 0.12)),
                  alignment: Alignment.center,
                  child: Icon(icon, size: 36, color: scheme.primary),
                ),
                const SizedBox(height: AppSpacing.md),
                // app name
                Text(appName, style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -0.3)),
                const SizedBox(height: AppSpacing.xs),
                // version badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 3),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: scheme.primary.withValues(alpha: 0.10)),
                  child: Text(
                    'v$version',
                    style: textTheme.labelSmall?.copyWith(color: scheme.primary, fontWeight: FontWeight.w600),
                  ),
                ),
                if (description != null) ...[
                  const SizedBox(height: AppSpacing.md),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                    child: Text(
                      description!,
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium?.copyWith(color: scheme.onSurface.withValues(alpha: 0.6), height: 1.5),
                    ),
                  ),
                ],
                const SizedBox(height: AppSpacing.xl),
                Divider(height: 1, color: scheme.outlineVariant),
                if (legalese != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                    child: Text(legalese!, style: textTheme.bodySmall?.copyWith(color: scheme.onSurface.withValues(alpha: 0.4))),
                  ),
                // close button
                _DialogButton(
                  text: 'Close',
                  onTap: () => Navigator.of(context).pop(),
                  borderRadius: legalese != null
                      ? const BorderRadius.only(
                          bottomLeft: Radius.circular(AppStyle.radiusExtraLarge),
                          bottomRight: Radius.circular(AppStyle.radiusExtraLarge),
                        )
                      : const BorderRadius.only(
                          bottomLeft: Radius.circular(AppStyle.radiusExtraLarge),
                          bottomRight: Radius.circular(AppStyle.radiusExtraLarge),
                        ),
                  color: scheme.primary.withValues(alpha: 0.08),
                  textColor: scheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
