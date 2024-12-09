import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../../core/constants.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/dialog.dart';
import '../../home/domain/entities/food_entity.dart';
import '../../home/presentation/manager/cubit.dart';
import '../../home/presentation/manager/states.dart';
import 'widgets/food_details_widgets/food_details_description.dart';
import 'widgets/food_details_widgets/food_details_AppBar_widget.dart';
import 'widgets/food_details_widgets/food_details_description_with_offer.dart';

class FoodDetailsView extends StatelessWidget {
  const FoodDetailsView({super.key, required this.food, this.isOffer = false});
  final FoodEntity food;
  final bool isOffer;
  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      isOffer
          ? context.read<MainCubit>().gettotalPrice(
                foodSize: food.sizesAndPrice.keys.first,
                newselectedPrice: food.sizesAndPrice.values.first,
                isOffer: isOffer,
                newselectedPriceOffer:
                    food.sizesAndPriceafterOffer!.values.first,
              )
          : context.read<MainCubit>().gettotalPrice(
                foodSize: food.sizesAndPrice.keys.first,
                newselectedPrice: food.sizesAndPrice.values.first,
                isOffer: isOffer,
              );
    });
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                FoodDetailsAppBarWidget(
                  food: food,
                  cubit: cubit,
                ),
                isOffer
                    ? FoodDetailsDescriptionWithOffer(
                        cubit: cubit,
                        food: food,
                      )
                    : FoodDetailsDescription(
                        cubit: cubit,
                        food: food,
                      ),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              padding: EdgeInsetsDirectional.only(
                end: context.width * .06,
                start: context.width * .06,
                bottom: 2,
              ),
              color: Colors.white,
              height: context.height * .07,
              child: CustomButton(
                onPressed: () {
                  confirmationItemsShowDialog(context: context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'إضافة إلى عربة التسوق',
                        style: Styles.textStyleXL(context, color: Colors.white),
                      ),
                      SizedBox(width: context.width * .03),
                      Text(
                        '${cubit.totalPriceForMeal} جنيه',
                        style:
                            Styles.textStyleXXL(context, color: kFFC436Color),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
