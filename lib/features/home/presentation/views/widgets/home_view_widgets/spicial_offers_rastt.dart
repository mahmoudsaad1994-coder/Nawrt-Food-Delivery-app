import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/widgets/food_item_with_offer.dart';
import '../../../manager/cubit.dart';
import '../../../manager/states.dart';

class SpicialOffersRastt extends StatelessWidget {
  const SpicialOffersRastt({super.key, this.isHome = false});
  final bool? isHome;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .06),
          child: GridView.custom(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (170 / 172),
              crossAxisSpacing: width * .05,
              mainAxisSpacing: width * .03,
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(AppRouter.kFoodDetailsView, extra: {
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
          ),
        );
      },
    );
  }
}
