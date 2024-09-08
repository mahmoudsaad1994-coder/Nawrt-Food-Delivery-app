import 'package:flutter/material.dart';

import '../../../../../../../core/utils/styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';

class SetAressMapBotomView extends StatelessWidget {
  const SetAressMapBotomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * .10),
      child: Column(
        children: [
          Text(
            'رجاء ادخال الموقع للحصول على تجربة توصيل أفضل',
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: MediaQuery.of(context).size.width * .10),
          CustomButton(
            child: const Text(
              'تأكيد الموقع',
              style: Styles.textStyle16old,
            ),
            onPressed: () {
              // GoRouter.of(context)
              //     .push(AppRouter.kRegisterInfromationScreen);
            },
          ),
        ],
      ),
    );
  }
}
