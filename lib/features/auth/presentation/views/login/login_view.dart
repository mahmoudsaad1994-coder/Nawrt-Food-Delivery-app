import 'package:flutter/material.dart';

import 'widgets/login_widgets/login_view_bottom_item.dart';
import 'widgets/login_widgets/login_view_top_item.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            LoginViewTopItem(),
            LoginViewBottomItem(),
          ],
        ),
      ),
    );
  }
}
