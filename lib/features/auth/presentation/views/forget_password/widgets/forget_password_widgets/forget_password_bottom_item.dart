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

class ForgetPasswordViewBottomItem extends StatefulWidget {
  const ForgetPasswordViewBottomItem({super.key});

  @override
  State<ForgetPasswordViewBottomItem> createState() =>
      _ForgetPasswordViewBottomItemState();
}

class _ForgetPasswordViewBottomItemState
    extends State<ForgetPasswordViewBottomItem> {
  final TextEditingController emailControlor = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailControlor.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constrain) {
        return BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.all(constrain.maxWidth * .05),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(height: constrain.maxHeight * .1),
                      SizedBox(
                        height: constrain.maxHeight * .16,
                        width: double.infinity,
                        child: CustomTextFormField(
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
                      ),
                      SizedBox(height: constrain.maxHeight * .15),
                      SizedBox(
                        height: constrain.maxHeight * .16,
                        width: double.infinity,
                        child: CustomButton(
                          child: ResponsiveText(
                            height: constrain.maxHeight * .075,
                            text: 'إرسال الكود',
                            style: Styles.textStyle16old,
                          ),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              AuthCubit.get(context)
                                  .getEmail(emailControlor.text);
                              AuthCubit.get(context).isForgetPassord = true;
                              formkey.currentState!.save();
                              GoRouter.of(context)
                                  .push(AppRouter.kActivateCodeScreen);
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
