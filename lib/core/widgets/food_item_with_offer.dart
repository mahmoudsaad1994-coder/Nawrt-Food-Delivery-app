import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/styles.dart';
import 'respnsive_text.dart';

class FoodItemWithOffer extends StatelessWidget {
  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;

  const FoodItemWithOffer({
    super.key,
    required this.foodName,
    required this.description,
    required this.price,
    required this.image,
    required this.offer,
    required this.priceAfterOffer,
  });
  final String foodName;
  final String description;
  final String image;
  final String offer;
  final num price;
  final num priceAfterOffer;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Card(
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * .03,
                vertical: constraints.maxHeight * .04,
              ),
              width: double.infinity,
              height: constraints.maxWidth * .45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth * .42,
                    height: constraints.maxHeight * .1,
                    decoration: const BoxDecoration(
                        color: kFFC436Color,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                        )),
                    child: Center(
                        child: ResponsiveText(
                      height: constraints.maxHeight * .1,
                      text: offer,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    )),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: constraints.maxWidth * .052),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResponsiveText(
                    height: constraints.maxHeight * .14,
                    text: foodName,
                    style: Styles.textStyle16old.copyWith(color: kBlackColor),
                  ),
                  Text(
                    description,
                    style: Styles.textStyle14(
                      context,
                      fontWeight: FontWeight.w700,
                      color: k96908AColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: constraints.maxWidth * .052),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ResponsiveText(
                        height: constraints.maxHeight * .15,
                        text: '$priceAfterOffer',
                        style: Styles.textStyle18.copyWith(color: Colors.black),
                      ),
                      ResponsiveText(
                        height: constraints.maxHeight * .15,
                        text: 'جنيه',
                        style: Styles.textStyle18.copyWith(color: Colors.black),
                      ),
                      SizedBox(width: constraints.maxWidth * .02),
                      ResponsiveText(
                        height: constraints.maxHeight * .12,
                        text: '$price',
                        style: Styles.textStyle13,
                      ),
                      ResponsiveText(
                        height: constraints.maxHeight * .12,
                        text: 'جنيه',
                        style: Styles.textStyle13,
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: constraints.maxWidth * .221,
                    height: constraints.maxHeight * .221,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                        backgroundColor: WidgetStateProperty.all(kFFC436Color),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              bottomRight: Radius.circular(2),
                              bottomLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                            ),
                            side: BorderSide.none,
                          ),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        size: constraints.maxHeight * .18,
                        applyTextScaling: true,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
