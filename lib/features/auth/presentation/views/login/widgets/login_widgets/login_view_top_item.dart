import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/assets.dart';
import '../../../../../../../../core/utils/styles.dart';
import '../../../../../../../core/utils/responsive.dart';
import '../../../../../../../core/widgets/top_auth_item.dart';

class LoginViewTopItem extends StatelessWidget {
  const LoginViewTopItem({super.key});

  @override
  Widget build(BuildContext context) {
    return TopAuthItem(
      sizeHeight: .4,
      title: Text(
        'تسجيل الدخول',
        style: Styles.textStyleXXXL(context),
      ),
      image: AspectRatio(
          aspectRatio: Responsive.isMobile(context) ? 1 / .35 : 1 / .24,
          child: Image.asset(
            AssetsData.loginImage,
          )),
    );
  }
}
