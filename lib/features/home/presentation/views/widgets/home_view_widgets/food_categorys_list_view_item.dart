import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/respnsive_text.dart';
import '../../../../../../core/widgets/view_item_title.dart';
import '../../../../../layout/manager/layout_cubit/layout_cubit.dart';
import '../../../../domain/entities/categoray.dart';

class FoodCategorysListViewItem extends StatelessWidget {
  const FoodCategorysListViewItem({super.key, required this.categories});
  final List<CategoriesEntity> categories;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ViewItemTitle(
          title: 'التصنيفات',
          onPressTitle: 'عرض الكل',
          onPressed: () {
            LayoutCubit.get(context).changeBottomNaviIndex(1);
          },
        ),
        SizedBox(height: width * .02),
        SizedBox(
          height: width * .26,
          child: ListView.separated(
            itemCount: categories.length,
            padding: EdgeInsets.symmetric(horizontal: width * .06),
            separatorBuilder: (context, index) => SizedBox(width: width * .05),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                GoRouter.of(context)
                    .push(AppRouter.kFoodsView, extra: categories[index]);
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(categories[index].image),
                    radius: width * .1,
                  ),
                  ResponsiveText(
                    height: width * .05,
                    text: categories[index].name,
                    style: Styles.textStyleL(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
