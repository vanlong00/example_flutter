import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:flutter/services.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:example/core/core.dart';
import 'package:example/features/home/bloc/explorable_bloc/explorable_bloc.dart';
import 'package:example/features/home/cubit/browser_cubit.dart';
import 'package:example/features/home/cubit/search_cubit.dart';
import 'package:example/features/home/widgets/file_list_body.dart';
import 'package:example/features/home/widgets/home_header_widget.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BrowserCubit()),
        BlocProvider(create: (_) => SearchCubit()),
      ],
      child: _HomePageView(),
    );
  }
}

class _HomePageView extends StatefulWidget {
  @override
  State<_HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<_HomePageView> {
  StreamSubscription? _intentSub;
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _showScrollToTop = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _initSharingIntent();
    _scrollController.addListener(() {
      final show = _scrollController.offset > 200;
      if (show != _showScrollToTop.value) _showScrollToTop.value = show;
    });
  }

  void _initSharingIntent() {
    ReceiveSharingIntent.instance.getInitialMedia().then((files) {
      for (final f in files) {
        if (f.path.isNotEmpty) {
          context.read<ExplorableBloc>().add(ExplorableEvent.shareFile(filePath: f.path));
        }
      }
      ReceiveSharingIntent.instance.reset();
    });
    _intentSub = ReceiveSharingIntent.instance.getMediaStream().listen((files) {
      for (final f in files) {
        if (f.path.isNotEmpty) {
          context.read<ExplorableBloc>().add(ExplorableEvent.shareFile(filePath: f.path));
        }
      }
      ReceiveSharingIntent.instance.reset();
    });
  }

  @override
  void dispose() {
    _intentSub?.cancel();
    _scrollController.dispose();
    _showScrollToTop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) async {
        final navStack = context.read<BrowserCubit>().state;
        if (navStack.isNotEmpty) {
          context.read<BrowserCubit>().navigateTo(navStack.length - 2);
          return;
        }
        final shouldExit = await AppHelper.showConfirmDialog(
          context,
          title: 'Exit App',
          message: 'Are you sure you want to exit PArchiver?',
          confirmText: 'Exit',
          cancelText: 'Cancel',
          icon: Icons.exit_to_app_rounded,
          isDestructive: true,
        );
        if (shouldExit) SystemNavigator.pop();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: ValueListenableBuilder<bool>(
          valueListenable: _showScrollToTop,
          builder: (_, show, child) => show
              ? FloatingActionButton.small(
                  onPressed: () => _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut),
                  backgroundColor: context.colorScheme.primary,
                  tooltip: 'Scroll to top',
                  child: child,
                )
              : const SizedBox.shrink(),
          child: const Icon(Icons.keyboard_arrow_up_rounded),
        ),
        appBar: AppAppBar(
          title: 'Management File',
          centerTitle: true,
          leading: IconButton(
            onPressed: () => context.pushNamed(KeyRoute.settings),
            icon: Assets.icons.feat.setting2.image(width: 24, height: 24, color: context.colorScheme.onSurface),
            tooltip: 'Settings',
          ),
          actions: [
            Showcase.withWidget(
              key: TutorialKeys.addFile,
              height: 210,
              width: 284,
              overlayOpacity: 0.7,
              targetBorderRadius: BorderRadius.circular(24),
              container: TutorialCard(
                icon: Icons.file_upload_outlined,
                iconColor: context.colorScheme.primary,
                title: 'Import Files',
                description: 'Tap + to import your game mod files.\nSupports .melmod, .melsave, .mcworld, .mcpack, .mcaddon, .zip and more.',
                stepIndex: 0,
                totalSteps: 2,
                onNext: () => ShowCaseWidget.of(context).completed(TutorialKeys.addFile),
                onSkip: () => ShowCaseWidget.of(context).dismiss(),
              ),
              child: IconButton(
                onPressed: () => context.read<ExplorableBloc>().add(const ExplorableEvent.pickFile()),
                icon: Assets.icons.feat.ic24Plus.image(width: 24, height: 24, color: context.colorScheme.onSurface),
                tooltip: 'Import File',
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: AppSpacing.xl),
          child: Column(
            spacing: AppSpacing.smMd,
            children: [
              const HomeHeaderWidget(),
              Expanded(child: FileListBody(scrollController: _scrollController)),
            ],
          ),
        ),
      ),
    );
  }
}
