import 'package:flutter/material.dart';

import '../../../../../data.dart';

class SpicialOffersRastt extends StatelessWidget {
  const SpicialOffersRastt({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
          (context, index) => foodItemsWithOffers[index],
          childCount: foodItemsWithOffers.length,
        ),
      ),
    );
  }
}
