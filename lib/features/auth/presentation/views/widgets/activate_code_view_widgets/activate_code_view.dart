import 'package:flutter/material.dart';

import 'activate_code_bottom_item.dart';
import 'activate_code_top_item.dart';

class ActivateCode extends StatelessWidget {
  const ActivateCode({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            ActivateCodeTopItem(),
            ActivateCodeBottomItem(),
          ],
        ),
      ),
    );
  }
}
