import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/background_image.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/respnsive_text.dart';

class ResetNewPasswordDoneScreen extends StatelessWidget {
  const ResetNewPasswordDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: size.height * .2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .3),
                child: Image.asset(
                  AssetsData.changePasswordImage,
                  height: size.width * .5,
                  width: size.width * .5,
                ),
              ),
              const SizedBox(height: 60),
              ResponsiveText(
                height: size.height * .05,
                text: 'تم تغيير كلمة المرور بنجاح',
                style: Styles.textStyle23,
              ),
              const SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                height: size.width * .15,
                width: double.infinity,
                child: CustomButton(
                  child: ResponsiveText(
                    height: size.width * .06,
                    text: 'تم',
                    style: Styles.textStyle16,
                  ),
                  onPressed: () {
                    // GoRouter.of(context)
                    //     .push(AppRouter.kRegisterInfromationScreen);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
