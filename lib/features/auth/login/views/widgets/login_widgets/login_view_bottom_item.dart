import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../constants.dart';
import '../../../../../../../core/utils/app_router.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../core/widgets/respnsive_text.dart';

class LoginViewBottomItem extends StatelessWidget {
  const LoginViewBottomItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(size.width * .06),
        child: LayoutBuilder(
          builder: (context, constrain) => Column(
            children: [
              SizedBox(
                height: constrain.maxHeight * .15,
                width: double.infinity,
                child: const CustomTextFormField(
                  hintText: 'رقم الهاتف',
                  icon: Icons.phone,
                ),
              ),
              SizedBox(height: constrain.maxHeight * .04),
              SizedBox(
                height: constrain.maxHeight * .15,
                width: double.infinity,
                child: const CustomTextFormField(
                  hintText: 'كلمة المرور',
                  icon: Icons.lock_outline,
                  suffixIcon: Icons.visibility_off_outlined,
                ),
              ),
              SizedBox(height: constrain.maxHeight * .02),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kForgetPasswordScreen);
                  },
                  child: ResponsiveText(
                    height: constrain.maxHeight * .07,
                    text: 'هل نسيت كلمة المرور؟',
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: constrain.maxHeight * .1),
              SizedBox(
                width: double.infinity,
                height: constrain.maxHeight * .16,
                child: CustomButton(
                  child: ResponsiveText(
                    height: constrain.maxWidth * .07,
                    text: 'متابعة',
                    style: Styles.textStyle16,
                  ),
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kActivateCodeScreen);
                  },
                ),
              ),
              SizedBox(height: constrain.maxHeight * .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kRegisterScreen);
                    },
                    child: ResponsiveText(
                      height: constrain.maxWidth * .06,
                      text: 'إنشاء حساب جديد',
                      style: Styles.textStyle16.copyWith(
                        color: kFFC436Color,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  ResponsiveText(
                    height: constrain.maxWidth * .06,
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
        ),
      ),
    );
  }
}
