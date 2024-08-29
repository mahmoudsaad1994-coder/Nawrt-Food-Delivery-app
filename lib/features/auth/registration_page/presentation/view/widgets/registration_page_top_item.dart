import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/widgets/background_image.dart';

class RegistrationPageTopItem extends StatelessWidget {
  const RegistrationPageTopItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          const BackgroundImage(),
          AspectRatio(
            aspectRatio: 1 / .5,
            child: Image.asset(
              AssetsData.splashLogo,
            ),
          ),
        ],
      ),
    );
  }
}
