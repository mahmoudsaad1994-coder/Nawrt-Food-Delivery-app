import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/manager/cubit.dart';
import '../../features/home/presentation/manager/states.dart';
import '../constants.dart';
import '../../features/home/domain/entities/food_entity.dart';
import '../utils/styles.dart';
import 'respnsive_text.dart';

class FooditemWidget extends StatelessWidget {
  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;
  final FoodEntity food;

  const FooditemWidget({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return LayoutBuilder(builder: (context, constrain) {
            return Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: constrain.maxHeight * .22),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: constrain.maxHeight * .16),
                        Padding(
                          padding:
                              EdgeInsets.only(right: constrain.maxWidth * .06),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ResponsiveText(
                                      height: constrain.maxHeight * .11,
                                      text: food.foodName,
                                      style: Styles.textStyleL(context,
                                          fontWeight: FontWeight.w700),
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
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  cubit.toggleFoodFav(food.foodID);
                                },
                                icon: Icon(
                                  cubit.isMealFavorite(food.foodID)
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  size: constrain.maxWidth * .17,
                                  color: kFFC436Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: constrain.maxWidth * .06),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${food.sizesAndPrice.values.first}',
                                    style: Styles.titleLayout(context,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    'جنية',
                                    style: Styles.titleLayout(context,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: constrain.maxHeight * .2,
                                height: constrain.maxHeight * .2,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    padding: WidgetStateProperty.all(
                                        EdgeInsets.zero),
                                    backgroundColor:
                                        WidgetStateProperty.all(kFFC436Color),
                                    foregroundColor:
                                        WidgetStateProperty.all(Colors.white),
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
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
                                    size: constrain.maxHeight * .15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: constrain.maxHeight * .45,
                  height: constrain.maxHeight * .45,
                  decoration: const ShapeDecoration(
                      shape: CircleBorder(), color: Colors.transparent),
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                        shape: const CircleBorder(),
                        shadows: const [
                          BoxShadow(
                            blurRadius: 1,
                          )
                        ],
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(food.foodImage))),
                  ),
                )
              ],
            );
          });
        });
  }
}
