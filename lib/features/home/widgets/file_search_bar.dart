import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class FileSearchBar extends StatelessWidget {
  const FileSearchBar({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hasSearchText,
    required this.onChanged,
    required this.onClear,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueNotifier<bool> hasSearchText;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.sm),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search .melsave, .melworld...',
          prefixIconConstraints: const BoxConstraints(minWidth: 24, minHeight: 24),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: AppSpacing.md, right: AppSpacing.xs),
            child: Assets.icons.regular.search.image(color: context.semanticColors.neutral600, width: 24, height: 24),
          ),
          suffixIconConstraints: const BoxConstraints(minWidth: 24, minHeight: 24),
          suffixIcon: ValueListenableBuilder(
            valueListenable: hasSearchText,
            builder: (context, hasText, _) {
              return Padding(
                padding: const EdgeInsets.only(right: AppSpacing.md, left: AppSpacing.xs),
                child: hasText
                    ? GestureDetector(
                        onTap: onClear,
                        child: Assets.icons.regular.times.image(color: context.semanticColors.neutral600, width: 24, height: 24),
                      )
                    : const SizedBox.square(dimension: 24),
              );
            },
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppSpacing.md)),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
