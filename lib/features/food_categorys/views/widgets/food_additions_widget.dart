import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';

class FoodAdditionsWidget extends StatelessWidget {
  const FoodAdditionsWidget(
      {super.key,
      required this.nameFoodAdditions,
      required this.priceFoodAdditions});
  final String nameFoodAdditions;
  final int priceFoodAdditions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .003),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    activeColor: kFFC436Color,
                  ),
                  Text(
                    nameFoodAdditions,
                    style: Styles.textStyleL(
                      context,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                '$priceFoodAdditions جنيه',
                style: Styles.textStyleL(context,
                    fontWeight: FontWeight.w500, color: kFFC436Color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
