import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/assets.dart';
import '../../../../../../../../core/widgets/custom_text_form_field.dart';

class SetAddressMapViewTopItem extends StatelessWidget {
  const SetAddressMapViewTopItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .7,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            AssetsData.testMapImage,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
            child: CustomTextFormField(
              hintText: 'قناة السويس, المنصورة',
              icon: Icons.location_on_outlined,
              color: Color(0xffEAE7E3),
            ),
          )
        ],
      ),
    );
  }
}
