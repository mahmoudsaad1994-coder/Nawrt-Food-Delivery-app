import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/widgets/food_item_with_offer.dart';
import '../../../../../../core/widgets/grid_view.dart';
import '../../../manager/cubit.dart';
import '../../../manager/states.dart';

class SpicialOffersRastt extends StatelessWidget {
  const SpicialOffersRastt({super.key, this.isHome = false});
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
                  GoRouter.of(context).push(AppRouter.kFoodDetailsView, extra: {
                    'food': cubit.foodListWithOffers[index],
                    'isOffer': true,
                  });
                },
                child:
                    FoodItemWithOffer(food: cubit.foodListWithOffers[index])),
            childCount: isHome == null || isHome == true
                ? 4
                : cubit.foodListWithOffers.length,
          ),
        );
      },
    );
  }
}
