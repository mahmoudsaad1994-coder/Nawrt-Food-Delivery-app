import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/view_item_title.dart';
import '../../manager/search_cubit.dart';

class SetPriceFilter extends StatelessWidget {
  const SetPriceFilter({super.key, required this.cubit});
  final SearchCubit cubit;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ViewItemTitle(
          onPressed: () {},
          title: 'السعر',
          onPressTitle: '',
          isButtonHidden: true,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .025),
          child: RangeSlider(
            values: RangeValues(cubit.startPrice, cubit.endPrice),
            onChanged: (rangeValues) {
              cubit.changeRangePrice(rangeValues: rangeValues);
            },
            min: 0,
            max: 700,
            divisions: 70,
            labels: RangeLabels(
                cubit.startPrice.toString(), cubit.endPrice.toString()),
            inactiveColor: k0xfff4f3f1Color, // اللي مش مقروء
            activeColor: kFFC436Color, // المقروء
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .06),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    cubit.endPrice.round().toString(),
                    style: Styles.textStyleXXL(context),
                  ),
                  Text(
                    ' : إلي',
                    style: Styles.textStyleL(context),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    cubit.startPrice.round().toString(),
                    style: Styles.textStyleXXL(context),
                  ),
                  Text(
                    ' : من',
                    style: Styles.textStyleL(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
