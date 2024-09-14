import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../data.dart';

class MostSaleGridView extends StatelessWidget {
  const MostSaleGridView({super.key});

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
                GoRouter.of(context).push(AppRouter.kFoodDetailsView);
              },
              child: fooditemWidgetList[index]),
          childCount: fooditemWidgetList.length,
        ),
      ),
    );
  }
}
