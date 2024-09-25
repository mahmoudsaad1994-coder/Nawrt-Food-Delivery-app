import 'package:flutter/material.dart';

import '../constants.dart';
import '../../features/home/domain/entities/food_entity.dart';
import '../utils/styles.dart';
import 'respnsive_text.dart';

class FoodItemWithOffer extends StatelessWidget {
  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;

  const FoodItemWithOffer({
    super.key,
    required this.food,
  });
  final FoodEntity food;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Card(
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * .03,
              ),
              child: Container(
                width: double.infinity,
                height: constraints.maxWidth * .47,
                clipBehavior: Clip.antiAliasWithSaveLayer,
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
                        food.foodImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: constraints.maxHeight * .1,
                      alignment: Alignment.center,
                      color: kFFC436Color.withOpacity(.7),
                      child: Text(
                        food.foodofferdescrption!,
                        style: Styles.textStyleSL(context, color: Colors.white),
                      ),
                    ),
                  ],
                ),
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
                    text: food.foodName,
                    style: Styles.textStyle16old.copyWith(color: kBlackColor),
                  ),
                  Text(
                    food.foodDescreption,
                    style: Styles.textStyleL(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${food.sizesAndPriceafterOffer!.values.first}',
                        style: Styles.textStyleXL(context, color: Colors.black),
                      ),
                      Text(
                        'ج.م',
                        style: Styles.textStyleXL(context, color: Colors.black),
                      ),
                      SizedBox(width: constraints.maxWidth * .05),
                      Text(
                        '${food.sizesAndPrice.values.first}',
                        style: Styles.textStyleOldPrice(context),
                      ),
                      Text(
                        'ج.م',
                        style: Styles.textStyleOldPrice(context),
                      ),
                    ],
                  ),
                  const Spacer(),
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
