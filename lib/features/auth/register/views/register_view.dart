import 'package:flutter/material.dart';
import 'widgets/register_view_widgets/register_view_bottom_item.dart';
import 'widgets/register_view_widgets/register_view_top_item.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            RegisterViewTopItem(),
            RegisterViewBottomItem(),
          ],
        ),
      ),
    );
  }
}
