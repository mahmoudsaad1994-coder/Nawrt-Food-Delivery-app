import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';
import '../../manager/search_cubit.dart';
import 'sort_widget.dart';

class ShowAs extends StatelessWidget {
  const ShowAs({super.key, required this.cubit});
  final SearchCubit cubit;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .06),
      child: SortWidget(
        title: 'العرض حسب',
        childern: [
          SwitchListTile(
            value: cubit.showItemesRatingMoreThan4,
            onChanged: (val) {
              cubit.changeBoolItemesRatingMoreThan4(newValue: val);
            },
            title: Text(
              'عرض المنتجات ذات تصنيف +4 نجوم فقط',
              style: Styles.textStyle14(context),
            ),
            activeTrackColor: kFFC436Color,
            activeColor: Colors.white,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: k96908AColor,
          ),
          SwitchListTile(
            value: cubit.showPriceWithOffer,
            onChanged: (val) {
              cubit.changeBoolPriceWithOffer(newValue: val);
            },
            title: Text(
              'عرض الاسعار مع الخصم',
              style: Styles.textStyle14(context),
            ),
            activeTrackColor: kFFC436Color,
            activeColor: Colors.white,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: k96908AColor,
          ),
        ],
      ),
    );
  }
}
