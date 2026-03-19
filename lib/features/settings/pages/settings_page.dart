import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Settings'),
      body: ListView(
        physics: const ScrollPhysics(),
        padding: AppSpacing.horizontalMd,
        children: [
          _SectionHeader('Personalization'),
          _SettingsTile(
            icon: Icons.palette_outlined,
            iconColor: Colors.deepPurple,
            title: 'Appearance',
            subtitle: 'Theme and display options',
            onTap: () => context.pushNamed(KeyRoute.themeSetting),
          ),
          AppSpacing.gapSm,
          _SectionHeader('Storage'),
          _SettingsTile(
            icon: Icons.cleaning_services_outlined,
            iconColor: Colors.blueGrey,
            title: 'Cache',
            subtitle: 'Manage temporary cached files',
            onTap: () => context.pushNamed(KeyRoute.cacheSetting),
          ),
          AppSpacing.gapSm,
          _SectionHeader('Info'),
          _SettingsTile(
            icon: Icons.privacy_tip_outlined,
            iconColor: Colors.blue,
            title: 'Privacy Policy',
            subtitle: 'How we handle your data',
            onTap: () {},
          ),
          AppSpacing.gapSm,
          _SettingsTile(
            icon: Icons.gavel_outlined,
            iconColor: Colors.brown,
            title: 'Terms of Conditions',
            subtitle: 'Rules and agreements for using the app',
            onTap: () {},
          ),
          AppSpacing.gapSm,
          _SettingsTile(
            icon: Icons.info_outline_rounded,
            iconColor: Colors.teal,
            title: 'About',
            subtitle: 'Version 1.0.0',
            onTap: () => AppHelper.showAppAboutDialog(
              context,
              appName: 'Example',
              version: '1.0.0',
              description: 'A simple and powerful file manager for your device.',
              legalese: '© 2026 Example App',
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.lg, bottom: AppSpacing.sm),
      child: Text(title.toUpperCase(), style: context.textTheme.labelSmall?.copyWith(color: context.semanticColors.neutral60, letterSpacing: 1.2)),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({required this.icon, required this.iconColor, required this.title, required this.subtitle, required this.onTap});

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppStyle.borderCard,
      child: Container(
        padding: AppSpacing.allMd,
        decoration: BoxDecoration(
          borderRadius: AppStyle.borderCard,
          border: Border.all(color: context.colorScheme.outlineVariant),
        ),
        child: Row(
          spacing: AppSpacing.md,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.12), borderRadius: AppStyle.borderMedium),
              alignment: Alignment.center,
              child: Icon(icon, size: 20, color: iconColor),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: context.textTheme.titleSmall?.semiBold),
                  Text(subtitle, style: context.textTheme.bodySmall?.copyWith(color: context.semanticColors.neutral60)),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: context.semanticColors.neutral60, size: 20),
          ],
        ),
      ),
    );
  }
}
