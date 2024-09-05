import 'package:flutter/material.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../core/widgets/respnsive_text.dart';

class ResetNewPasswordViewBottomItem extends StatelessWidget {
  const ResetNewPasswordViewBottomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constrain) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: constrain.maxWidth * .06),
          child: Column(
            children: [
              SizedBox(height: constrain.maxHeight * .1),
              SizedBox(
                height: constrain.maxHeight * .15,
                width: double.infinity,
                child: const CustomTextFormField(
                  hintText: 'كلمة المرور الجديدة',
                  icon: Icons.lock_outline,
                  suffixIcon: Icons.visibility_off_outlined,
                ),
              ),
              SizedBox(height: constrain.maxHeight * .05),
              SizedBox(
                height: constrain.maxHeight * .15,
                width: double.infinity,
                child: const CustomTextFormField(
                  hintText: 'تأكيد كلمة المرور الجديدة',
                  icon: Icons.lock_outline,
                  suffixIcon: Icons.visibility_off_outlined,
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
                    // GoRouter.of(context)
                    //     .push(AppRouter.kRegisterInfromationScreen);
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
