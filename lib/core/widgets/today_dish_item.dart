import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/responsive.dart';
import '../utils/styles.dart';
import 'custom_button.dart';
import 'respnsive_text.dart';

class TodayDishItem extends StatelessWidget {
  const TodayDishItem({
    super.key,
    required this.title,
    required this.image,
    required this.price,
  });
  final String title;
  final String image;
  final num price;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .06),
        child: Container(
          height: MediaQuery.of(context).size.height * .25,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * .06),
            color: kBlackBlueColor,
          ),
          child: LayoutBuilder(builder: (context, constrain) {
            return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: constrain.maxWidth * .05,
                      vertical: constrain.maxHeight * .07,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResponsiveText(
                          height: constrain.maxWidth * .06,
                          text: 'طبق اليوم',
                          style: Styles.textStyleL(
                            context,
                            fontWeight: FontWeight.w400,
                            color: k96908AColor,
                          ),
                        ),
                        SizedBox(height: constrain.maxHeight * .01),
                        ResponsiveText(
                          height: constrain.maxWidth * .08,
                          text: title,
                          style: Styles.textStyle16old.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ResponsiveText(
                              height: constrain.maxWidth * .08,
                              text: '$price',
                              style: Styles.textStyleMulish18.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(width: constrain.maxWidth * .01),
                            ResponsiveText(
                              height: constrain.maxWidth * .04,
                              text: 'جنية',
                              style: Styles.textStyleMulish18.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: constrain.maxWidth * .35,
                          height: constrain.maxHeight * .25,
                          child: CustomButton(
                            onPressed: () {},
                            child: ResponsiveText(
                              height: constrain.maxWidth * .08,
                              text: 'اطلب الآن',
                              style: Styles.textStyle16old,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(.04),
                        radius: Responsive.isMobile(context)
                            ? constrain.maxWidth * .3
                            : constrain.maxWidth * .18,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(.06),
                        radius: Responsive.isMobile(context)
                            ? constrain.maxWidth * .2
                            : constrain.maxWidth * .16,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(image),
                        radius: Responsive.isMobile(context)
                            ? constrain.maxWidth * .15
                            : constrain.maxWidth * .14,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
