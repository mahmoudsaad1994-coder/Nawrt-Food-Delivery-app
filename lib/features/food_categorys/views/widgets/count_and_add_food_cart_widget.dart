import 'package:flutter/material.dart';
import 'package:nawrt/core/constants.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_button.dart';

class CountAndAddFoodCartWidget extends StatelessWidget {
  const CountAndAddFoodCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .05,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: k96908AColor, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.remove,
                  size: size.width * .05,
                ),
              ),
              SizedBox(width: size.width * .03),
              Text(
                '1',
                style: Styles.textStyleXXL(
                  context,
                ),
              ),
              SizedBox(width: size.width * .03),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.add,
                  size: size.width * .05,
                ),
              ),
            ],
          ),
          CustomButton(
            onPressed: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Row(
                children: [
                  Text(
                    'إضافة إلى عربة التسوق',
                    style: Styles.textStyleXL(context, color: Colors.white),
                  ),
                  SizedBox(width: size.width * .03),
                  Text(
                    '150 جنيه',
                    style: Styles.textStyleXXL(context, color: kFFC436Color),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
