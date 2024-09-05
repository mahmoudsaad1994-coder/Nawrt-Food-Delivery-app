import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../core/widgets/respnsive_text.dart';

class ForgetPasswordViewBottomItem extends StatelessWidget {
  const ForgetPasswordViewBottomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constrain) {
        return Padding(
          padding: EdgeInsets.all(constrain.maxWidth * .05),
          child: Column(
            children: [
              SizedBox(height: constrain.maxHeight * .1),
              SizedBox(
                height: constrain.maxHeight * .16,
                width: double.infinity,
                child: const CustomTextFormField(
                  hintText: 'email',
                  icon: Icons.email_outlined,
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
                    GoRouter.of(context).push(AppRouter.kActivateCodeScreen);
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
