import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class FoodWeightButton extends StatelessWidget {
  const FoodWeightButton({super.key, required this.foodWeight});
  final String foodWeight;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width * .26,
          alignment: Alignment.center,
          child: Text(
            foodWeight,
            style: Styles.textStyleL(
              context,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
