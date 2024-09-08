import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../constants.dart';
import '../../../../../../../core/utils/app_router.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../../core/widgets/respnsive_text.dart';
import '../../../../../domain/repos/auth_repo.dart';
import '../../../../manager/cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.constrain, required this.cubit});
  final BoxConstraints constrain;
  final AuthCubit cubit;
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();

  TextEditingController userNameControllor = TextEditingController();
  TextEditingController emailControllor = TextEditingController();
  TextEditingController hponeControllor = TextEditingController();
  TextEditingController passwordControllor = TextEditingController();
  TextEditingController confirmPasswordControllor = TextEditingController();

  @override
  void dispose() {
    emailControllor.dispose();
    userNameControllor.dispose();
    confirmPasswordControllor.dispose();
    passwordControllor.dispose();
    hponeControllor.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: widget.constrain.maxWidth * .06),
      child: Form(
          key: formKey,
          child: Column(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: widget.constrain.maxHeight * .12,
                width: double.infinity,
                child: CustomTextFormField(
                  hintText: 'اسم المستخدم',
                  icon: Icons.person_outline_rounded,
                  controller: userNameControllor,
                  validator: (val) {
                    if (val!.isEmpty || val.length < 5) {
                      return 'ادخل اسمك ثنائي بشكل صحيح';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: widget.constrain.maxHeight * .02),
              SizedBox(
                height: widget.constrain.maxHeight * .12,
                width: double.infinity,
                child: CustomTextFormField(
                  hintText: 'البريد الألكتروني',
                  icon: Icons.email_outlined,
                  controller: emailControllor,
                  validator: (val) {
                    String p =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(p);
                    if (val!.isEmpty) {
                      return 'نسيت تدخل ايميلك';
                    } else if (regExp.hasMatch(val)) {
                      return null;
                    }
                    return 'ادخل ايميلك بشكل صحيح';
                  },
                ),
              ),
              SizedBox(height: widget.constrain.maxHeight * .02),
              SizedBox(
                height: widget.constrain.maxHeight * .12,
                width: double.infinity,
                child: CustomTextFormField(
                  hintText: 'رقم التلفون',
                  icon: Icons.phone,
                  controller: hponeControllor,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'نسيت رقم تلفونك ';
                    } else if (val.length == 11 && val.startsWith('01')) {
                      return null;
                    }
                    return 'ادخل رقمك الصحيح (01000000000)';
                  },
                ),
              ),
              SizedBox(height: widget.constrain.maxHeight * .02),
              SizedBox(
                height: widget.constrain.maxHeight * .12,
                width: double.infinity,
                child: CustomTextFormField(
                  hintText: 'كلمة المرور',
                  icon: Icons.lock_outline,
                  controller: passwordControllor,
                  suffixIcon: widget.cubit.isHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  hidden: widget.cubit.isHidden,
                  suffixOnPressed: widget.cubit.togglePassowrd,
                  validator: (value) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value!.isEmpty) {
                      return 'نسيت الباسورد ولا ايه ؟';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return '(A,a,!@#\$&*~,0-9,اكتر من 8 احرف)';
                      } else {
                        return null;
                      }
                    }
                  },
                ),
              ),
              SizedBox(height: widget.constrain.maxHeight * .02),
              SizedBox(
                height: widget.constrain.maxHeight * .12,
                width: double.infinity,
                child: CustomTextFormField(
                  hintText: 'تأكيد كلمة المرور',
                  icon: Icons.lock_outline,
                  controller: confirmPasswordControllor,
                  suffixIcon: widget.cubit.isHiddenConfirm
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  hidden: widget.cubit.isHiddenConfirm,
                  suffixOnPressed: widget.cubit.toggleConfirmPassowrd,
                  validator: (val) {
                    if (passwordControllor.text !=
                        confirmPasswordControllor.text) {
                      return 'غير مطابقة لكلمة السر';
                    } else if (val!.isEmpty) {
                      return 'أين كلمه السر يغالي';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: widget.constrain.maxHeight * .03),
              SizedBox(
                height: widget.constrain.maxHeight * .12,
                width: double.infinity,
                child: CustomButton(
                  child: widget.cubit.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : ResponsiveText(
                          height: widget.constrain.maxHeight * .06,
                          text: 'متابعة',
                          style: Styles.textStyle16old,
                        ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      widget.cubit.getEmail(emailControllor.text);
                      widget.cubit.register(
                          params: RegisterParams(
                        email: emailControllor.text,
                        password: passwordControllor.text,
                        name: userNameControllor.text,
                        phone: hponeControllor.text,
                      ));
                      formKey.currentState!.save();
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' لديك حساب بالفعل؟ ',
                    style: Styles.textStyle16old.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: widget.constrain.maxWidth * .04,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kLoginScreen);
                    },
                    child: Text(
                      'تسجيل دخول',
                      style: Styles.textStyle16old.copyWith(
                        color: kFFC436Color,
                        fontWeight: FontWeight.w400,
                        fontSize: widget.constrain.maxWidth * .04,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
