import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/respnsive_text.dart';

class RegistrationPageBottomItem extends StatelessWidget {
  const RegistrationPageBottomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constrain) => Padding(
          padding: EdgeInsets.symmetric(horizontal: constrain.maxWidth * .06),
          child: Column(
            children: [
              SizedBox(height: constrain.maxHeight * .2),
              SizedBox(
                height: constrain.maxHeight * .13,
                child: CustomButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kRegisterScreen);
                  },
                  child: ResponsiveText(
                    height: constrain.maxHeight * .07,
                    width: double.infinity,
                    text: 'إنشاء حساب',
                    style: Styles.textStyle16old.copyWith(
                      fontFamily: kAvenirArabic,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              SizedBox(height: constrain.maxHeight * .04),
              SizedBox(
                height: constrain.maxHeight * .13,
                child: CustomButton(
                  backgroundColor: Colors.white,
                  borderSide: const BorderSide(
                    color: kFFC436Color,
                  ),
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kLoginScreen);
                  },
                  child: SizedBox(
                    height: constrain.maxHeight * .07,
                    width: double.infinity,
                    child: FittedBox(
                      child: Text(
                        'تسجيل دخول',
                        style: Styles.textStyle16old.copyWith(
                          fontFamily: kAvenirArabic,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
