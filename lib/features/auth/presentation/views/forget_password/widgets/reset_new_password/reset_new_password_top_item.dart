import 'package:flutter/material.dart';
import 'package:nawrt/core/widgets/respnsive_text.dart';

import '../../../../../../../constants.dart';
import '../../../../../../../core/utils/assets.dart';
import '../../../../../../../core/utils/responsive.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../../../core/widgets/top_auth_item.dart';

class ResetNewPasswordTopItem extends StatelessWidget {
  const ResetNewPasswordTopItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TopAuthItem(
      sizeHeight: .52,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'إعادة تعيين كلمة المرور',
            style: Styles.textStyleXXXL(context),
          ),
          SizedBox(height: size.width * .02),
          Text(
            'ادخل كلمة المرور الجديدة',
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
          AssetsData.resetPasswordImage,
        ),
      ),
    );
  }
}
