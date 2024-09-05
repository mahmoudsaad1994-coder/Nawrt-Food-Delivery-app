import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/respnsive_text.dart';
import '../../../../../data.dart';
import '../../../../../core/widgets/view_item_title.dart';

class FoodCategorysListViewItem extends StatelessWidget {
  const FoodCategorysListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ViewItemTitle(
          title: 'التصنيفات',
          onPressTitle: 'عرض الكل',
          onPressed: () {},
        ),
        SizedBox(height: width * .02),
        SizedBox(
          height: width * .26,
          child: ListView.separated(
            itemCount: homeCategorysList.length,
            padding: EdgeInsets.symmetric(horizontal: width * .06),
            reverse: true,
            separatorBuilder: (context, index) => SizedBox(width: width * .05),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Column(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage(homeCategorysList[index].categoryImage),
                  radius: width * .1,
                ),
                ResponsiveText(
                  height: width * .05,
                  text: homeCategorysList[index].categoryName,
                  style: Styles.textStyle14(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
