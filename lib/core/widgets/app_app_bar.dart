import 'package:example/core/core.dart';
import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({super.key, required this.title, this.centerTitle = false, this.leading, this.actions});

  final String title;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      titleTextStyle: TextStyle(
        fontSize: context.textTheme.titleLarge?.fontSize,
        letterSpacing: context.textTheme.titleMedium?.letterSpacing,
        height: context.textTheme.titleMedium?.height,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ).withColor(context.colorScheme.onSurface),
      surfaceTintColor: Colors.transparent,
      leading: leading,
      actions: actions,
    );
  }
}
