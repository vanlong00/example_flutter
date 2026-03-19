import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/features/home/bloc/explorable_bloc/explorable_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CacheSettingPage extends StatefulWidget {
  const CacheSettingPage({super.key});

  @override
  State<CacheSettingPage> createState() => _CacheSettingPageState();
}

class _CacheSettingPageState extends State<CacheSettingPage> with SingleTickerProviderStateMixin {
  int _cacheBytes = 0;
  bool _isLoading = true;
  bool _isClearing = false;
  bool _justCleared = false;

  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut));
    _loadCacheSize();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _loadCacheSize() async {
    setState(() => _isLoading = true);
    final size = await StorageHelper.getCacheSize();
    if (mounted)
      setState(() {
        _cacheBytes = size;
        _isLoading = false;
      });
  }

  Future<void> _onClearCache() async {
    final confirmed = await AppHelper.showConfirmDialog(
      context,
      title: 'Clear cache',
      message: 'All cached files will be permanently deleted. This cannot be undone.',
      confirmText: 'Clear',
      cancelText: 'Cancel',
      icon: Icons.delete_sweep_outlined,
      isDestructive: true,
    );
    if (!confirmed || !mounted) return;

    setState(() => _isClearing = true);
    await FileHelper.clearTemporaryFiles();
    if (!mounted) return;
    // Reload both the cache indicator and the file tree in the home page
    context.read<ExplorableBloc>().add(const ExplorableEvent.started());
    await _loadCacheSize();
    if (!mounted) return;
    setState(() {
      _isClearing = false;
      _justCleared = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _justCleared = false);
    if (mounted) context.showSnackBar('Cache cleared successfully');
  }

  @override
  Widget build(BuildContext context) {
    final isEmpty = _cacheBytes == 0 && !_isLoading;

    return Scaffold(
      appBar: const AppAppBar(title: 'Cache'),
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.pagePadding,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCacheIndicator(context, isEmpty),
                    const SizedBox(height: AppSpacing.xl),
                    Text(
                      isEmpty ? 'Nothing to clear' : 'Cached files are taking up space',
                      style: context.textTheme.titleMedium?.semiBold,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      isEmpty
                          ? 'Your app cache is clean.\nFiles will be re-created as you use the app.'
                          : 'These are temporary files created while using the app.\nClearing them frees up device storage.',
                      style: context.textTheme.bodyMedium?.copyWith(color: context.semanticColors.neutral60),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.x2l),
                    _buildInfoRow(context),
                  ],
                ),
              ),
              _buildClearButton(context, isEmpty),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCacheIndicator(BuildContext context, bool isEmpty) {
    final color = isEmpty ? context.semanticColors.success : Colors.blueGrey;

    if (_isLoading) {
      return SizedBox(
        height: 160,
        width: 160,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(strokeWidth: 2, color: color.withValues(alpha: 0.4)),
            Text('...', style: context.textTheme.titleMedium?.copyWith(color: context.semanticColors.neutral60)),
          ],
        ),
      );
    }

    if (_justCleared) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 600),
        curve: Curves.elasticOut,
        builder: (_, value, child) => Transform.scale(scale: value, child: child),
        child: Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(shape: BoxShape.circle, color: context.semanticColors.success.withValues(alpha: 0.12)),
          child: Icon(Icons.check_rounded, size: 72, color: context.semanticColors.success),
        ),
      );
    }

    return ScaleTransition(
      scale: isEmpty ? const AlwaysStoppedAnimation(1.0) : _pulseAnimation,
      child: Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: 0.10),
          border: Border.all(color: color.withValues(alpha: 0.25), width: 2),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isEmpty ? Icons.check_circle_outline_rounded : Icons.folder_outlined, size: 36, color: color),
            const SizedBox(height: AppSpacing.sm),
            Text(isEmpty ? '0 B' : FileHelper.formatFileSize(_cacheBytes), style: context.textTheme.headlineSmall?.semiBold.copyWith(color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context) {
    return Row(
      spacing: AppSpacing.md,
      children: [
        Expanded(
          child: _InfoCard(icon: Icons.insert_drive_file_outlined, label: 'Type', value: 'Temp files', color: Colors.orange),
        ),
        Expanded(
          child: _InfoCard(icon: Icons.auto_delete_outlined, label: 'Auto-cleared', value: 'On uninstall', color: Colors.indigo),
        ),
        Expanded(
          child: _InfoCard(icon: Icons.security_outlined, label: 'Risk', value: 'None', color: context.semanticColors.success),
        ),
      ],
    );
  }

  Widget _buildClearButton(BuildContext context, bool isEmpty) {
    return AnimatedOpacity(
      opacity: isEmpty ? 0.4 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: FilledButton.icon(
        onPressed: isEmpty || _isClearing ? null : _onClearCache,
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: AppStyle.borderButton),
          backgroundColor: Colors.blueGrey,
          disabledBackgroundColor: Colors.blueGrey.withValues(alpha: 0.3),
        ),
        icon: _isClearing
            ? SizedBox.square(dimension: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white.withValues(alpha: 0.8)))
            : const Icon(Icons.cleaning_services_rounded, size: 20),
        label: Text(_isClearing ? 'Clearing…' : 'Clear cache', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.icon, required this.label, required this.value, required this.color});

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.md),
      decoration: BoxDecoration(
        borderRadius: AppStyle.borderCard,
        border: Border.all(color: context.colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(height: AppSpacing.xs),
          Text(value, style: context.textTheme.labelMedium?.semiBold),
          Text(label, style: context.textTheme.labelSmall?.copyWith(color: context.semanticColors.neutral60)),
        ],
      ),
    );
  }
}
