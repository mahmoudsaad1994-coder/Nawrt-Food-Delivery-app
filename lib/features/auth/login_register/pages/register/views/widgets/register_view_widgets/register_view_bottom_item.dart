import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../constants.dart';
import '../../../../../../../../core/utils/app_router.dart';
import '../../../../../../../../core/utils/styles.dart';
import '../../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../../../core/widgets/respnsive_text.dart';

class RegisterViewBottomItem extends StatelessWidget {
  const RegisterViewBottomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constrain) {
        return Padding(
          padding: EdgeInsets.all(constrain.maxWidth * .06),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ResponsiveText(
                  height: constrain.maxHeight * .07,
                  text: 'ادخل بريدك الالكتروني',
                  style: Styles.textStyle20,
                ),
              ),
              SizedBox(height: constrain.maxHeight * .07),
              SizedBox(
                width: double.infinity,
                height: constrain.maxHeight * .13,
                child: const CustomTextFormField(
                  hintText: 'email',
                  icon: Icons.email_outlined,
                ),
              ),
              SizedBox(height: constrain.maxHeight * .07),
              SizedBox(
                height: constrain.maxHeight * .13,
                width: double.infinity,
                child: CustomButton(
                  backgroundColor: kPrimaryColor,
                  child: ResponsiveText(
                    height: constrain.maxHeight * .06,
                    text: 'متابعة',
                    style: Styles.textStyle16,
                  ),
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kActivateCodeScreen);
                  },
                ),
              ),
              SizedBox(height: constrain.maxHeight * .07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kLoginScreen);
                    },
                    child: ResponsiveText(
                      height: constrain.maxHeight * .05,
                      text: 'تسجيل دخول',
                      style: Styles.textStyle16.copyWith(
                        color: kFFC436Color,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  ResponsiveText(
                    height: constrain.maxHeight * .05,
                    text: ' لديك حساب بالفعل؟ ',
                    style: Styles.textStyle16.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
