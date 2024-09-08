import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../constants.dart';
import '../../../../../../../core/utils/app_router.dart';
import '../../../../../../../core/utils/assets.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../../../core/widgets/background_image.dart';
import '../../../../manager/cubit.dart';

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
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: constrains.maxWidth * .1,
                      vertical: constrains.maxHeight * .05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'كود التفعيل',
                          style: Styles.textStyle23(context),
                        ),
                        SizedBox(height: constrains.maxHeight * .03),
                        Text(
                          'تم ارسال كود التفعيل على البريد الألكتروني',
                          style: Styles.textStyle14(
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
                                style: Styles.textStyle14(context),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: constrains.maxWidth * .02),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(AppRouter.kRegisterScreen);
                              },
                              child: Text(
                                'تعديل البريد',
                                style: Styles.textStyle14(
                                  context,
                                  color: kFFC436Color,
                                ),
                              ),
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
