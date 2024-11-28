import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../../../../core/constants.dart';
import '../../../../home/domain/entities/food_entity.dart';
import '../../../../home/presentation/manager/cubit.dart';

class FoodDetailsAppBarWidget extends StatelessWidget {
  const FoodDetailsAppBarWidget(
      {super.key, required this.food, required this.cubit});
  final FoodEntity food;
  final MainCubit cubit;
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;

    return SliverAppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      expandedHeight: height * .4,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          food.foodImage,
          fit: BoxFit.fill,
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: height * .03,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          child: Container(
            width: width * .25,
            height: 5.0,
            decoration: BoxDecoration(
              color: kFFC436Color,
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ),
      ),
      leadingWidth: width * .2,
      leading: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: width * .07,
          ),
        ),
      ),
      actions: [
        Container(
          width: width * .14,
          height: width * .14,
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
              size: width * .07,
              color: kFFC436Color,
            ),
          ),
        ),
        SizedBox(width: width * .05),
      ],
    );
  }
}
