import 'package:flutter/material.dart';

import 'widgets/forget_password_widgets/forget_password_bottom_item.dart';
import 'widgets/forget_password_widgets/forget_password_top_item.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            ForgetPasswordTopItem(),
            ForgetPasswordViewBottomItem(),
          ],
        ),
      ),
    );
  }
}
