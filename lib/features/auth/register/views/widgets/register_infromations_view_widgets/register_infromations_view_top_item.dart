import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/responsive.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/respnsive_text.dart';
import '../../../../../../core/widgets/top_auth_item.dart';

class RegisterInfromationsViewTopItem extends StatelessWidget {
  const RegisterInfromationsViewTopItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TopAuthItem(
      sizeHeight: .45,
      title: ResponsiveText(
        height: size.width * .08,
        text: 'استكمال البيانات',
        style: Styles.textStyle23,
      ),
      image: AspectRatio(
        aspectRatio: Responsive.isMobile(context) ? 1 / .45 : 1 / .3,
        child: Image.asset(
          AssetsData.registerInfromationsImage,
        ),
      ),
    );
  }
}
