import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/responsive.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/top_auth_item.dart';
import '../../../manager/cubit.dart';

class ActivateCodeTopItem extends StatelessWidget {
  const ActivateCodeTopItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TopAuthItem(
      sizeHeight: .55,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'كود التفعيل',
            style: Styles.textStyleXXXL(context),
          ),
          SizedBox(height: size.width * .03),
          Text(
            'تم ارسال كود التفعيل على البريد الألكتروني',
            style: Styles.textStyleL(
              context,
              color: k96908AColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  BlocProvider.of<AuthCubit>(context).email,
                  style: Styles.textStyleL(context),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: size.width * .02),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                child: Text(
                  'تعديل البريد',
                  style: Styles.textStyleL(
                    context,
                    color: kFFC436Color,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      image: AspectRatio(
        aspectRatio: Responsive.isMobile(context) ? 1 / .45 : 1 / .3,
        child: Image.asset(
          AssetsData.activateCodeImage,
        ),
      ),
    );
  }
}
