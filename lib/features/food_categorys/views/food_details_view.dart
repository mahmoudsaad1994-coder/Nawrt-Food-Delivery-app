import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../constants.dart';
import '../../../core/utils/styles.dart';
import '../../home/domain/entities/food_entity.dart';
import '../../home/presentation/manager/cubit.dart';
import '../../home/presentation/manager/states.dart';
import 'widgets/count_and_add_food_cart_widget.dart';
import 'widgets/food_additions_widget.dart';

class FoodDetailsView extends StatelessWidget {
  const FoodDetailsView({super.key, required this.food});
  final FoodEntity food;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<MainCubit, MainStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = MainCubit.get(context);
            var selectedPrice =
                cubit.selectedPrice ?? food.sizesAndPrice.values.first;
            var selectedSize =
                cubit.selectedSize ?? food.sizesAndPrice.keys.first;
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top),
                  child: Image.asset(
                    food.foodImage,
                    height: size.height * .4,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .06,
                      vertical: MediaQuery.of(context).viewPadding.top + 20),
                  child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back)),
                        const Spacer(),
                        Container(
                          width: size.width * .14,
                          height: size.width * .14,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: IconButton(
                            onPressed: () {
                              cubit.toggleFoodFav(food.foodID);
                            },
                            icon: Icon(
                              cubit.isMealFavorite(food.foodID)
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              size: size.width * .07,
                              color: kFFC436Color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    height: size.height * .54,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(size.width * .07),
                          topRight: Radius.circular(size.width * .07),
                        )),
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .06,
                        vertical: size.width * .02),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              food.foodName,
                              style: Styles.textStyleXXL(context,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '$selectedPrice جنيه',
                              style: Styles.textStyleXXL(context,
                                  fontWeight: FontWeight.w700,
                                  color: kFFC436Color),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: size.width * .02),
                          child: Text(
                            food.foodDescreption,
                            style: Styles.textStyleL(context,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Text(
                          'الحجم',
                          style: Styles.textStyleXXL(context,
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: size.height * .013,
                              top: size.height * .005),
                          child: SizedBox(
                            height: size.height * .06,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: food.sizesAndPrice.keys.map(
                                (foodSize) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        end: size.width * .02),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .26,
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
                          style: Styles.textStyleXXL(context,
                              fontWeight: FontWeight.w700),
                        ),
                        ...List.generate(cubit.foodAdditionsWidgetList.length,
                            (index) {
                          return FoodAdditionsWidget(index: index);
                        }),
                        SizedBox(height: size.height * .02),
                        const CountAndAddFoodCartWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
