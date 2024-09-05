import 'package:flutter/material.dart';

import '../../../../../../../../constants.dart';
import '../../../../../../../../core/utils/styles.dart';
import '../../../../../../../../core/widgets/custom_button.dart';
import 'activate_code_widgets.dart';

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
              ActivateCodeWidgets(width: constrain.maxWidth),
              SizedBox(height: constrain.maxHeight * .1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'دقيقة',
                    style: Styles.textStyle14(context),
                  ),
                  SizedBox(width: constrain.maxWidth * .01),
                  Text(
                    '2:35',
                    style: Styles.textStyle14(context, color: kFFC436Color),
                  ),
                  SizedBox(width: constrain.maxWidth * .01),
                  Text(
                    'سوف تنتهي صلاحية الكود خلال',
                    style: Styles.textStyle14(context),
                  ),
                ],
              ),
              SizedBox(height: constrain.maxHeight * .1),
              SizedBox(
                width: double.infinity,
                height: constrain.maxHeight * .15,
                child: CustomButton(
                  child: Text(
                    'متابعة',
                    style: Styles.textStyle16(context),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
