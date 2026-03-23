import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// Shows a birth-year picker as a root [Overlay] entry so it survives
/// [Navigator.pushNamedAndRemoveUntil] without being popped.
///
/// Returns the selected year when the user confirms.
class BirthYearPickerDialog {
  BirthYearPickerDialog._();

  static Future<int?> show(BuildContext context) {
    final completer = Completer<int?>();
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) => _BirthYearPickerOverlay(
        onConfirm: (year) {
          entry.remove();
          completer.complete(year);
        },
      ),
    );

    Navigator.of(context).overlay!.insert(entry);
    return completer.future;
  }
}

// ── Overlay widget ────────────────────────────────────────────────────────────

class _BirthYearPickerOverlay extends StatefulWidget {
  const _BirthYearPickerOverlay({required this.onConfirm});

  final ValueChanged<int> onConfirm;

  @override
  State<_BirthYearPickerOverlay> createState() => _BirthYearPickerOverlayState();
}

class _BirthYearPickerOverlayState extends State<_BirthYearPickerOverlay> with SingleTickerProviderStateMixin {
  static const int _minYear = 1920;
  static final int _maxYear = DateTime.now().year;
  static final int _defaultYear = DateTime.now().year - 25;

  late final FixedExtentScrollController _controller;
  late final AnimationController _animController;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;
  late int _selectedYear;

  @override
  void initState() {
    super.initState();
    _selectedYear = _defaultYear;
    _controller = FixedExtentScrollController(initialItem: _defaultYear - _minYear);

    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero)
        .animate(CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic));

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const bottomRadius = BorderRadius.only(
      bottomLeft: Radius.circular(AppStyle.radiusExtraLarge),
      bottomRight: Radius.circular(AppStyle.radiusExtraLarge),
    );

    return FadeTransition(
      opacity: _fadeAnim,
      child: Material(
        color: Colors.black54,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: SlideTransition(
              position: _slideAnim,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                        child: Text(
                          'Year of Birth',
                          textAlign: TextAlign.center,
                          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      SizedBox(
                        height: 200,
                        child: ListWheelScrollView.useDelegate(
                          controller: _controller,
                          itemExtent: 48,
                          perspective: 0.003,
                          diameterRatio: 1.8,
                          physics: const FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) => setState(() => _selectedYear = _minYear + index),
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: _maxYear - _minYear + 1,
                            builder: (context, index) {
                              final year = _minYear + index;
                              final isSelected = year == _selectedYear;
                              return Center(
                                child: Text(
                                  '$year',
                                  style: (isSelected ? textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700) : textTheme.bodyLarge)
                                      ?.copyWith(color: isSelected ? scheme.primary : scheme.onSurface.withValues(alpha: 0.4)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Divider(height: 1, color: scheme.outlineVariant),
                      Material(
                        color: scheme.primary.withValues(alpha: 0.08),
                        borderRadius: bottomRadius,
                        child: InkWell(
                          onTap: () => widget.onConfirm(_selectedYear),
                          borderRadius: bottomRadius,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                            child: Center(
                              child: Text(
                                'Confirm',
                                style: textTheme.labelLarge?.copyWith(color: scheme.primary, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
