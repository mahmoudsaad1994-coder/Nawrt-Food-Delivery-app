import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/widgets/food_item_widget.dart';
import '../../../manager/cubit.dart';
import '../../../manager/states.dart';

class MostSaleGridView extends StatelessWidget {
  const MostSaleGridView({
    super.key,
    this.isHome = false,
  });

  final bool? isHome;

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * .06, vertical: width * .02),
            child: GridView.custom(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 146 / 170,
                crossAxisSpacing: width * .05,
                mainAxisSpacing: width * .03,
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kFoodDetailsView,
                          extra: cubit.foodsList[index]);
                    },
                    child: FooditemWidget(
                      food: cubit.foodsList[index],
                    )),
                childCount: isHome == null || isHome == true
                    ? 4
                    : cubit.foodsList.length,
              ),
            ),
          );
        });
  }
}
