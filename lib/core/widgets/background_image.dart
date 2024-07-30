import 'package:flutter/material.dart';

import '../utils/assets.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsData.backgroundImage,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
