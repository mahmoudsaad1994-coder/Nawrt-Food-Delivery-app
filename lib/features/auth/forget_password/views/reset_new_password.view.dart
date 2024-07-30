import 'package:flutter/material.dart';

import 'widgets/reset_new_password/reset_new_password_bottom_item.dart';
import 'widgets/reset_new_password/reset_new_password_top_item.dart';

class ResetNewPasswordScreen extends StatelessWidget {
  const ResetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          ResetNewPasswordTopItem(),
          ResetNewPasswordViewBottomItem(),
        ],
      ),
    );
  }
}
