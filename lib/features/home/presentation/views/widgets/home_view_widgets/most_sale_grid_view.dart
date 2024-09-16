import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/widgets/food_item_widget.dart';
import '../../../../domain/entities/food_entity.dart';
import '../../../manager/cubit.dart';

class MostSaleGridView extends StatelessWidget {
  const MostSaleGridView(
      {super.key,
      required this.foodList,
      this.isHome = false,
      required this.cubit});
  final List<FoodEntity> foodList;
  final bool? isHome;
  final MainCubit cubit;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * .06, vertical: width * .02),
      child: GridView.custom(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 146 / 170,
          crossAxisSpacing: width * .05,
          mainAxisSpacing: width * .03,
        ),
        physics: const NeverScrollableScrollPhysics(),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => GestureDetector(
              onTap: () {
                GoRouter.of(context)
                    .push(AppRouter.kFoodDetailsView, extra: foodList[index]);
              },
              child: FooditemWidget(
                food: foodList[index],
                cubit: cubit,
              )),
          childCount: isHome == null || isHome == true ? 4 : foodList.length,
        ),
      ),
    );
  }
}
