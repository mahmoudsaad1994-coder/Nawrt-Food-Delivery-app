import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_router.dart';
import '../../../core/utils/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToSplashHome(context);
  }

  void navigateToSplashHome(context) {
    Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).push(AppRouter.kLayoutView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: AspectRatio(
          aspectRatio: .3,
          child: Image.asset(AssetsData.splashLogo),
        ),
      )),
    );
  }
}
