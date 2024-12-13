import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/widgets/food_item_widget.dart';
import '../../../../../../core/widgets/grid_view.dart';
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
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return GridViewWidget(
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(AppRouter.kFoodDetailsView, extra: {
                      'food': cubit.foodListWithOffers[index],
                      'isOffer': false,
                    });
                  },
                  child: FooditemWidget(
                    food: cubit.foodsList[index],
                  )),
              childCount:
                  isHome == null || isHome == true ? 4 : cubit.foodsList.length,
            ),
          );
        });
  }
}
