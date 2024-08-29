import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../constants.dart';
import '../../../../../../../../core/utils/app_router.dart';
import '../../../../../../../../core/utils/styles.dart';
import '../../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../../core/widgets/respnsive_text.dart';

class ActivateCodeBottomItem extends StatelessWidget {
  const ActivateCodeBottomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constrain) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: constrain.maxWidth * .1),
          child: Column(
            children: [
              SizedBox(height: constrain.maxHeight * .1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(4, (index) => textFieldBox(constrain, index))
                ],
              ),
              SizedBox(height: constrain.maxHeight * .1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResponsiveText(
                    height: constrain.maxHeight * .065,
                    text: 'دقيقة',
                    style: Styles.textStyle14,
                  ),
                  SizedBox(
                    width: constrain.maxWidth * .1,
                    child: TextButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: () {},
                      child: ResponsiveText(
                        height: constrain.maxHeight * .07,
                        text: '2:35',
                        style: Styles.textStyle14.copyWith(
                          color: kFFC436Color,
                        ),
                      ),
                    ),
                  ),
                  ResponsiveText(
                    height: constrain.maxHeight * .065,
                    text: 'سوف تنتهي صلاحية الكود خلال',
                    style: Styles.textStyle14,
                  ),
                ],
              ),
              SizedBox(height: constrain.maxHeight * .1),
              SizedBox(
                width: double.infinity,
                height: constrain.maxHeight * .15,
                child: CustomButton(
                  child: ResponsiveText(
                    height: constrain.maxHeight * .08,
                    text: 'متابعة',
                    style: Styles.textStyle16,
                  ),
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kLayoutView);
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  textFieldBox(BoxConstraints constrain, index) => Container(
        height: constrain.maxHeight * .15,
        width: constrain.maxWidth * .15,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffEAE7E3).withOpacity(.5),
        ),
        child: TextFormField(
          maxLength: 1,
          showCursor: false,
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
        ),
      );
}
