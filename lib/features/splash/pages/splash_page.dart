import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/routes/key_route.dart';
import '../../ads/constants/ads_enums.dart';
import '../../ads/cubit/ads_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _navigated = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Kick off the full ads initialization flow
    context.read<AdsCubit>().initialize();

    // Safety net: navigate home after 5 s even if initialization stalls
    // _timer = Timer(const Duration(seconds: 5), _navigateHome);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void _navigateHome() {
    if (_navigated || !mounted) return;
    _navigated = true;
    Navigator.of(context).pushNamedAndRemoveUntil(KeyRoute.main, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdsCubit, AdsState>(
      // Fire only on the transition to isInitialized == true
      listenWhen: (prev, curr) => !prev.isInitialized && curr.isInitialized,
      listener: (context, state) async {
        if (state.appOpenAdStatus == AdLoadStatus.ready) {
          // Show App Open Ad; navigate home after it is dismissed or fails
          await context.read<AdsCubit>().showAppOpenAd();
        }
        _navigateHome();
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO: replace with app logo asset when available
                Assets.launcherIcon.iconTransparent.image(width: 96, height: 96),
                AppSpacing.gapLg,
                const CircularProgressIndicator.adaptive(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
