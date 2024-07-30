import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/styles.dart';
import 'custom_button.dart';
import 'respnsive_text.dart';

class CustomCardOffer extends StatelessWidget {
  const CustomCardOffer({
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
    return LayoutBuilder(builder: (context, constrain) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(constrain.maxWidth * .05),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(constrain.maxWidth * .05),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff00000d).withOpacity(.05),
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 251, 249, 241),
                Color.fromARGB(255, 248, 242, 218),
                Color(0xffFFFFFF),
              ],
            ),
          ),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.fill,
              ),
              Container(
                alignment: Alignment.topRight,
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.only(
                  top: constrain.maxHeight * .1,
                  right: constrain.maxWidth * .04,
                  bottom: constrain.maxHeight * .05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ResponsiveText(
                      height: constrain.maxHeight * .12,
                      text: 'عرض خاص',
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w400,
                        color: k96908AColor,
                      ),
                    ),
                    SizedBox(height: constrain.maxHeight * .015),
                    SizedBox(
                      width: constrain.maxWidth * .55,
                      height: constrain.maxHeight * .24,
                      child: Text(
                        title,
                        style: Styles.textStyle16.copyWith(
                          color: Colors.black,
                          fontSize: constrain.maxHeight * .084,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(height: constrain.maxHeight * .04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResponsiveText(
                          height: constrain.maxHeight * .1,
                          text: 'جنية',
                          style: Styles.textStyleMulish18.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: constrain.maxWidth * .008),
                        ResponsiveText(
                          height: constrain.maxHeight * .15,
                          text: '$price',
                          style: Styles.textStyleMulish18.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: constrain.maxHeight * .04),
                    SizedBox(
                      width: constrain.maxWidth * .3,
                      height: constrain.maxHeight * .18,
                      child: CustomButton(
                        onPressed: () {},
                        child: ResponsiveText(
                          height: constrain.maxHeight * .14,
                          text: 'اطلب الآن',
                          style: Styles.textStyle16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
