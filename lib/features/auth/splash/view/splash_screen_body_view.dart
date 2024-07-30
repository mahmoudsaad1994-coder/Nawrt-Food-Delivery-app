import 'package:flutter/material.dart';
import 'widgets/splash_screen_bottom_item.dart';
import 'widgets/splash_screen_top_item.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SplashScreenTopItem(),
          SplashScreenBottomItem(),
        ],
      ),
    );
  }
}
