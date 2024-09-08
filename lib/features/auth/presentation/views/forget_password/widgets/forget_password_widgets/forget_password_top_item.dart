import 'package:flutter/material.dart';

import '../../../../../../../constants.dart';
import '../../../../../../../core/utils/assets.dart';
import '../../../../../../../core/utils/responsive.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../../../core/widgets/respnsive_text.dart';
import '../../../../../../../core/widgets/top_auth_item.dart';

class ForgetPasswordTopItem extends StatelessWidget {
  const ForgetPasswordTopItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TopAuthItem(
      sizeHeight: .52,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ResponsiveText(
            height: size.width * .09,
            text: 'إعادة تعيين كلمة المرور',
            style: Styles.textStyle23(context),
          ),
          const SizedBox(height: 16),
          ResponsiveText(
            height: size.width * .054,
            text: 'ادخل بريدك الالكتروني لارسال كود التفعيل',
            style: Styles.textStyle14(
              context,
              color: k96908AColor,
            ),
          ),
        ],
      ),
      image: AspectRatio(
        aspectRatio: Responsive.isMobile(context) ? 1 / .45 : 1 / .3,
        child: Image.asset(
          AssetsData.forgetPasswordImage,
        ),
      ),
    );
  }
}
