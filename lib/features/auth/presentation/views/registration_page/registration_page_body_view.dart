import 'package:flutter/material.dart';
import 'widgets/registration_page_bottom_item.dart';
import 'widgets/registration_page_top_item.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          RegistrationPageTopItem(),
          RegistrationPageBottomItem(),
        ],
      ),
    );
  }
}
