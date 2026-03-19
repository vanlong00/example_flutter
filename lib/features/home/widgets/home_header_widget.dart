import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/features/home/cubit/search_cubit.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> with SingleTickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool _isActive = false;

  late final AnimationController _anim;

  // Single animation drives everything — forward fast (260ms), reverse slow (380ms)
  late final Animation<double> _expandAnim; // 0→1: TextField + Cancel expand in
  late final Animation<double> _fadeInAnim; // 0→1: TextField + Cancel fade in
  late final Animation<double> _iconFade; // 1→0: icon fades out
  late final Animation<double> _cancelScale; // 0.8→1.0: cancel pops in with spring

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(vsync: this, duration: const Duration(milliseconds: 260), reverseDuration: const Duration(milliseconds: 380));

    // Icon fades out quickly on activate, fades in slowly on deactivate
    _iconFade = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _anim, curve: Curves.easeOutCubic, reverseCurve: Curves.easeInCubic));

    // TextField + pill/cancel slide+fade in
    _expandAnim = CurvedAnimation(parent: _anim, curve: Curves.easeOutCubic, reverseCurve: Curves.easeInCubic);
    _fadeInAnim = CurvedAnimation(parent: _anim, curve: Curves.easeOut, reverseCurve: Curves.easeIn);
    _cancelScale = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _anim, curve: Curves.easeOutBack, reverseCurve: Curves.easeInCubic));
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    _anim.dispose();
    super.dispose();
  }

  void _activate() {
    setState(() => _isActive = true); // single setState — only for IgnorePointer switch
    _anim.forward();
    _focusNode.requestFocus();
  }

  void _deactivate() {
    _focusNode.unfocus();
    _anim.reverse().then((_) {
      if (mounted) {
        setState(() => _isActive = false);
        context.read<SearchCubit>().clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, String>(
      listenWhen: (prev, curr) => curr.isEmpty && prev.isNotEmpty,
      listener: (_, _) => _textController.clear(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: Row(
          spacing: AppSpacing.sm,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ── 1. Search icon — clips horizontally when active ───────
            ClipRect(
              child: AnimatedBuilder(
                animation: _iconFade,
                builder: (_, child) => Align(alignment: Alignment.centerLeft, widthFactor: _iconFade.value, child: child),
                child: FadeTransition(
                  opacity: _iconFade,
                  child: IgnorePointer(
                    ignoring: _isActive,
                    child: GestureDetector(
                      onTap: _activate,
                      child: SizedBox.square(
                        dimension: 48,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: AppStyle.borderRound,
                            border: Border.all(color: context.semanticColors.neutral90),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Assets.icons.feat.searchNormal.image(color: context.colorScheme.primary),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ── 2. TextField — expands left→right with fade ───────────
            Expanded(
              child: FadeTransition(
                opacity: _fadeInAnim,
                child: AnimatedBuilder(
                  animation: _expandAnim,
                  builder: (_, child) => ClipRect(
                    child: IgnorePointer(
                      ignoring: !_isActive,
                      child: Align(alignment: Alignment.centerLeft, widthFactor: _expandAnim.value, child: child),
                    ),
                  ),
                  child: TextField(
                    controller: _textController,
                    focusNode: _focusNode,
                    onChanged: (q) => context.read<SearchCubit>().search(q),
                    onTapOutside: (_) {
                      _focusNode.unfocus();
                      _deactivate();
                    },
                    style: context.textTheme.bodyMedium,
                    cursorColor: context.colorScheme.onSurface,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: context.textTheme.bodyMedium?.copyWith(color: context.semanticColors.neutral60),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 4),
                        child: Assets.icons.feat.searchNormal.image(color: context.colorScheme.onSurface, width: 18, height: 18),
                      ),

                      prefixIconConstraints: const BoxConstraints.tightFor(width: 36, height: 36),
                      isDense: true,
                      filled: true,
                      fillColor: context.semanticColors.backgroundCard.withValues(alpha: context.isDarkMode ? 0.6 : 0.08),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppStyle.radiusExtraLarge * 2), borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppStyle.radiusExtraLarge * 2),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppStyle.radiusExtraLarge * 2),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: AppSpacing.smMd),
                    ),
                  ),
                ),
              ),
            ),

            // ── 3. Right: pill ↔ cancel ─────────────────────────────────
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizeTransition(
                  sizeFactor: _iconFade,
                  axis: Axis.horizontal,
                  axisAlignment: 1,
                  child: FadeTransition(
                    opacity: _iconFade,
                    child: IgnorePointer(ignoring: _isActive, child: const _ManagementPill()),
                  ),
                ),
                SizeTransition(
                  sizeFactor: _expandAnim,
                  axis: Axis.horizontal,
                  axisAlignment: -1,
                  child: FadeTransition(
                    opacity: _fadeInAnim,
                    child: ScaleTransition(
                      scale: _cancelScale,
                      alignment: Alignment.centerLeft,
                      child: IgnorePointer(
                        ignoring: !_isActive,
                        child: TextButton(
                          onPressed: _isActive ? _deactivate : null,
                          child: Text('Cancel', style: context.textTheme.bodyMedium?.semiBold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ManagementPill extends StatelessWidget {
  const _ManagementPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.smMd),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppStyle.radiusExtraLarge * 2),
        color: context.semanticColors.backgroundCard.withValues(alpha: context.isDarkMode ? 0.6 : 0.08),
      ),
      child: Row(
        spacing: AppSpacing.sm,
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icons.feat.folderOpen.image(
            width: context.textTheme.titleSmall!.fontSize! * context.textTheme.titleSmall!.height!,
            color: context.colorScheme.primary,
          ),
          Text(
            'Management',
            style: context.textTheme.titleSmall?.regular.withColor(
              context.isDarkMode ? context.semanticColors.neutral0 : context.semanticColors.neutral50,
            ),
          ),
        ],
      ),
    );
  }
}
