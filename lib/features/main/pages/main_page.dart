import 'package:example/core/core.dart';
import 'package:example/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

/// Entry-point shell of the app.
///
/// Hosts the [ShowCaseWidget] so that any descendant — including [HomePage] —
/// can register [Showcase] targets against the same showcase controller.
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(enableAutoScroll: true, builder: (_) => const _MainPageView());
  }
}

class _MainPageView extends StatefulWidget {
  const _MainPageView();

  @override
  State<_MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<_MainPageView> {
  @override
  void initState() {
    super.initState();
    _maybeStartTutorial();
  }

  Future<void> _maybeStartTutorial() async {
    if (!await TutorialService.shouldShow()) return;
    // markSeen before starting so a mid-tutorial crash doesn't loop the tutorial.
    await TutorialService.markSeen();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ShowCaseWidget.of(context).startShowCase(TutorialKeys.orderedKeys);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      // bottomNavigationBar: NavigationBar(
      //   selectedIndex: _selectedIndex,
      //   onDestinationSelected: (index) => setState(() => _selectedIndex = index),
      //   destinations: const [
      //     NavigationDestination(icon: Icon(Icons.folder_outlined), selectedIcon: Icon(Icons.folder_rounded), label: 'Management'),
      //     NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings_rounded), label: 'Settings'),
      //   ],
      // ),
    );
  }
}
