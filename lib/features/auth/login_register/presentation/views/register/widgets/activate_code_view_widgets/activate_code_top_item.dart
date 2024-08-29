import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../constants.dart';
import '../../../../../../../../core/utils/app_router.dart';
import '../../../../../../../../core/utils/assets.dart';
import '../../../../../../../../core/utils/styles.dart';
import '../../../../../../../../core/widgets/background_image.dart';
import '../../../../../../../../core/widgets/respnsive_text.dart';

class ActivateCodeTopItem extends StatelessWidget {
  const ActivateCodeTopItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .55,
      width: double.infinity,
      child: Stack(
        children: [
          const BackgroundImage(),
          LayoutBuilder(builder: (context, constrains) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: constrains.maxWidth * .1,
                      vertical: constrains.maxHeight * .05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ResponsiveText(
                          height: constrains.maxHeight * .09,
                          style: Styles.textStyle23,
                          text: 'كود التفعيل',
                        ),
                        SizedBox(height: constrains.maxHeight * .04),
                        ResponsiveText(
                          height: constrains.maxHeight * .06,
                          text: 'تم ارسال كود التفعيل على رقم الهاتف',
                          style: Styles.textStyle14.copyWith(
                            color: k96908AColor,
                          ),
                        ),
                        SizedBox(height: constrains.maxHeight * .02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: constrains.maxHeight * .06,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  GoRouter.of(context)
                                      .push(AppRouter.kLoginScreen);
                                },
                                child: ResponsiveText(
                                  height: constrains.maxHeight * .06,
                                  text: 'تعديل الرقم',
                                  style: Styles.textStyle14.copyWith(
                                    color: kFFC436Color,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: constrains.maxWidth * .02),
                            ResponsiveText(
                              height: constrains.maxHeight * .06,
                              text: '+20 123456789',
                              style: Styles.textStyle14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AssetsData.activateCodeImage,
                      height: constrains.maxHeight * .45,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
