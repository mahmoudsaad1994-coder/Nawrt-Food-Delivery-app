import 'package:flutter/material.dart';

import 'widgets/register_infromations_view_widgets/register_infromations_view_bottom_item.dart';
import 'widgets/register_infromations_view_widgets/register_infromations_view_top_item.dart';

class RegisterInfromationsScreen extends StatelessWidget {
  const RegisterInfromationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            RegisterInfromationsViewTopItem(),
            RegisterInfromationsViewBottomItem(),
          ],
        ),
      ),
    );
  }
}
