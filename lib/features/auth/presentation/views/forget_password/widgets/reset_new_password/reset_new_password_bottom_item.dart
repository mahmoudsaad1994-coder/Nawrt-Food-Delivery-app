import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/utils/app_router.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../../core/widgets/respnsive_text.dart';
import '../../../../manager/cubit.dart';
import '../../../../manager/states.dart';

class ResetNewPasswordViewBottomItem extends StatefulWidget {
  const ResetNewPasswordViewBottomItem({super.key});

  @override
  State<ResetNewPasswordViewBottomItem> createState() =>
      _ResetNewPasswordViewBottomItemState();
}

class _ResetNewPasswordViewBottomItemState
    extends State<ResetNewPasswordViewBottomItem> {
  TextEditingController passwordControllor = TextEditingController();
  TextEditingController confirmPasswordControllor = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    confirmPasswordControllor.dispose();
    passwordControllor.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constrain) {
        return BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: constrain.maxWidth * .06),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: constrain.maxHeight * .1),
                      SizedBox(
                        height: constrain.maxHeight * .15,
                        width: double.infinity,
                        child: CustomTextFormField(
                          hintText: 'كلمة المرور',
                          icon: Icons.lock_outline,
                          controller: passwordControllor,
                          suffixIcon: cubit.isHidden
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          hidden: cubit.isHidden,
                          suffixOnPressed: cubit.togglePassowrd,
                          validator: (value) {
                            RegExp regex = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            if (value!.isEmpty) {
                              return 'نسيت الباسورد الجديد ولا ايه ؟';
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
                      SizedBox(height: constrain.maxHeight * .05),
                      SizedBox(
                        height: constrain.maxHeight * .15,
                        width: double.infinity,
                        child: CustomTextFormField(
                          hintText: 'تأكيد كلمة المرور',
                          icon: Icons.lock_outline,
                          controller: confirmPasswordControllor,
                          suffixIcon: cubit.isHiddenConfirm
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          hidden: cubit.isHiddenConfirm,
                          suffixOnPressed: cubit.toggleConfirmPassowrd,
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
                      SizedBox(height: constrain.maxHeight * .1),
                      SizedBox(
                        height: constrain.maxHeight * .15,
                        width: double.infinity,
                        child: CustomButton(
                          child: ResponsiveText(
                            height: constrain.maxHeight * .06,
                            text: 'تم',
                            style: Styles.textStyle16old,
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.isForgetPassord = false;
                              GoRouter.of(context)
                                  .push(AppRouter.kResetNewPasswordDoneScreen);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
