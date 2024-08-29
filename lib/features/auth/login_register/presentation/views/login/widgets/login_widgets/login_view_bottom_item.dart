import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../constants.dart';
import '../../../../../../../../../core/utils/app_router.dart';
import '../../../../../../../../../core/utils/styles.dart';
import '../../../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../../core/utils/build_error_snack_bar.dart';
import '../../../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../../../core/widgets/respnsive_text.dart';
import '../../../../../domain/repos/auth_repo.dart';
import '../../../../manager/cubit.dart';
import '../../../../manager/states.dart';

class LoginViewBottomItem extends StatefulWidget {
  const LoginViewBottomItem({super.key});

  @override
  State<LoginViewBottomItem> createState() => _LoginViewBottomItemState();
}

class _LoginViewBottomItemState extends State<LoginViewBottomItem> {
  final TextEditingController emailControlor = TextEditingController();
  final TextEditingController passwordControlor = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailControlor.dispose();
    passwordControlor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
      if (state is SucsessAuthStates) {
        GoRouter.of(context).pushReplacement(AppRouter.kLayoutView);
      }
      if (state is ErrorAuthStates) {
        ScaffoldMessenger.of(context).showSnackBar(
          buildErrorWidget(state.error),
        );
      }
    }, builder: (context, state) {
      var cubit = AuthCubit.get(context);
      return Expanded(
        child: Padding(
          padding: EdgeInsets.all(size.width * .06),
          child: Form(
            key: formkey,
            child: LayoutBuilder(
              builder: (context, constrain) => Column(
                children: [
                  CustomTextFormField(
                    hintText: 'الإيميل',
                    icon: Icons.email,
                    controller: emailControlor,
                    validator: (val) {
                      if (val!.isEmpty || !val.contains('@')) {
                        return 'ادخل ايميلك الصحيح';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: constrain.maxHeight * .04),
                  CustomTextFormField(
                    hintText: 'كلمة المرور',
                    icon: Icons.lock_outline,
                    suffixIcon: Icons.visibility_off_outlined,
                    suffixOnPressed: cubit.togglePassowrd,
                    hidden: cubit.isHidden,
                    controller: passwordControlor,
                    validator: (val) {
                      if (val!.isEmpty || val.length < 6) {
                        return 'ادخل الباسورد الصحيح';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: constrain.maxHeight * .02),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .push(AppRouter.kForgetPasswordScreen);
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
                      child: cubit.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            )
                          : ResponsiveText(
                              height: constrain.maxWidth * .07,
                              text: 'متابعة',
                              style: Styles.textStyle16,
                            ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          cubit.login(
                              params: LoginParams(
                            email: emailControlor.text,
                            password: passwordControlor.text,
                          ));
                          formkey.currentState!.save();
                        }
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
        ),
      );
    });
  }
}
