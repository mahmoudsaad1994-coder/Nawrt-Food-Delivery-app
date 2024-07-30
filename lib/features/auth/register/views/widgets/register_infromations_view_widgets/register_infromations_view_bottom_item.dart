import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../core/widgets/respnsive_text.dart';

class RegisterInfromationsViewBottomItem extends StatefulWidget {
  const RegisterInfromationsViewBottomItem({super.key});

  @override
  State<RegisterInfromationsViewBottomItem> createState() =>
      _RegisterInfromationsViewBottomItemState();
}

class _RegisterInfromationsViewBottomItemState
    extends State<RegisterInfromationsViewBottomItem> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constrain) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: constrain.maxWidth * .06),
          child: Form(
              key: formKey,
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: constrain.maxHeight * .14,
                    width: double.infinity,
                    child: const CustomTextFormField(
                      hintText: 'اسم المستخدم',
                      icon: Icons.person_outline_rounded,
                    ),
                  ),
                  SizedBox(height: constrain.maxHeight * .04),
                  SizedBox(
                    height: constrain.maxHeight * .14,
                    width: double.infinity,
                    child: const CustomTextFormField(
                      hintText: 'كلمة المرور',
                      icon: Icons.lock_outline,
                      suffixIcon: Icons.visibility_off_outlined,
                    ),
                  ),
                  SizedBox(height: constrain.maxHeight * .04),
                  SizedBox(
                    height: constrain.maxHeight * .14,
                    width: double.infinity,
                    child: const CustomTextFormField(
                      hintText: 'تأكيد كلمة المرور',
                      icon: Icons.lock_outline,
                      suffixIcon: Icons.visibility_off_outlined,
                    ),
                  ),
                  SizedBox(height: constrain.maxHeight * .06),
                  SizedBox(
                    width: double.infinity,
                    height: constrain.maxHeight * .14,
                    child: CustomButton(
                      child: ResponsiveText(
                        height: constrain.maxHeight * .06,
                        text: 'متابعة',
                        style: Styles.textStyle16,
                      ),
                      onPressed: () {
                        // GoRouter.of(context)
                        //     .push(AppRouter.kRegisterInfromationScreen);
                      },
                    ),
                  ),
                  SizedBox(height: constrain.maxHeight * .04),
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
                          height: constrain.maxHeight * .07,
                          text: 'تسجيل دخول',
                          style: Styles.textStyle16.copyWith(
                            color: kFFC436Color,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      ResponsiveText(
                        height: constrain.maxHeight * .07,
                        text: ' لديك حساب بالفعل؟ ',
                        style: Styles.textStyle16.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        );
      }),
    );
  }
}
