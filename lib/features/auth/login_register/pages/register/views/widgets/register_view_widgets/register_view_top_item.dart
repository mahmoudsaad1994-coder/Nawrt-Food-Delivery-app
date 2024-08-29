import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/assets.dart';
import '../../../../../../../../core/utils/responsive.dart';
import '../../../../../../../../core/utils/styles.dart';
import '../../../../../../../../core/widgets/respnsive_text.dart';
import '../../../../../../../../core/widgets/top_auth_item.dart';

class RegisterViewTopItem extends StatelessWidget {
  const RegisterViewTopItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return TopAuthItem(
      sizeHeight: .4,
      title: ResponsiveText(
        height: size.width * .08,
        text: 'إنشاء حساب',
        style: Styles.textStyle20,
      ),
      image: AspectRatio(
        aspectRatio: Responsive.isMobile(context) ? 1 / .4 : 1 / .25,
        child: Image.asset(
          AssetsData.registerImage,
        ),
      ),
    );
  }
}
