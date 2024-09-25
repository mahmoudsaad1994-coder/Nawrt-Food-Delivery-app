import 'package:flutter/material.dart';

import '../../../../../../../core/constants.dart';
import '../../../../../../../core/utils/assets.dart';
import '../../../../../../../core/utils/responsive.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../../../core/widgets/top_auth_item.dart';

class ForgetPasswordTopItem extends StatelessWidget {
  const ForgetPasswordTopItem({super.key});

  @override
  Widget build(BuildContext context) {
    return TopAuthItem(
      sizeHeight: .52,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'إعادة تعيين كلمة المرور',
            style: Styles.textStyleXXXL(context),
          ),
          const SizedBox(height: 16),
          Text(
            'ادخل بريدك الالكتروني لارسال كود التفعيل',
            style: Styles.textStyleL(
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
