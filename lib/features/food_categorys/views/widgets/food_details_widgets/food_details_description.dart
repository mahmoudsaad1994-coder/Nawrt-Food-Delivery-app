import 'package:flutter/material.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/domain/entities/food_entity.dart';
import '../../../../home/presentation/manager/cubit.dart';
import '../food_additions_widget.dart';

class FoodDetailsDescription extends StatelessWidget {
  const FoodDetailsDescription(
      {super.key, required this.food, required this.cubit});
  final FoodEntity food;
  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var selectedPrice = cubit.selectedPrice ?? food.sizesAndPrice.values.first;
    var selectedSize = cubit.selectedSize ?? food.sizesAndPrice.keys.first;
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(width * .07),
              topRight: Radius.circular(width * .07),
            )),
        padding: EdgeInsets.symmetric(
            horizontal: width * .06, vertical: width * .02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  food.foodName,
                  style:
                      Styles.textStyleXXL(context, fontWeight: FontWeight.w700),
                ),
                Text(
                  '$selectedPrice جنيه',
                  style: Styles.textStyleXXL(context,
                      fontWeight: FontWeight.w700, color: kFFC436Color),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: width * .02),
              child: Text(
                food.foodDescreption,
                style: Styles.textStyleL(context, fontWeight: FontWeight.w400),
              ),
            ),
            Text(
              'الحجم',
              style: Styles.textStyleXXL(context, fontWeight: FontWeight.w700),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: height * .013, top: height * .005),
              child: SizedBox(
                height: height * .06,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: food.sizesAndPrice.keys.map(
                    (foodSize) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(end: width * .02),
                        child: InkWell(
                          onTap: () {
                            cubit.changePriceAndSize(
                                foodSize: foodSize,
                                newselectedPrice:
                                    food.sizesAndPrice[foodSize]!);
                          },
                          child: Card(
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: selectedSize == foodSize
                                    ? Colors.yellow
                                    : Colors.transparent,
                                width: 2.0,
                              ),
                            ),
                            child: Container(
                              width: width * .26,
                              alignment: Alignment.center,
                              child: Text(
                                '$foodSize جرام',
                                style: Styles.textStyleL(
                                  context,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            Text(
              'الإضافات',
              style: Styles.textStyleXXL(context, fontWeight: FontWeight.w700),
            ),
            ...List.generate(cubit.foodAdditionsWidgetList.length, (index) {
              return FoodAdditionsWidget(index: index);
            }),
            SizedBox(height: height * .02),
          ],
        ),
      ),
    );
  }
}