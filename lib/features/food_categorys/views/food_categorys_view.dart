import 'package:flutter/material.dart';

import '../../../core/widgets/custom_search_bar.dart';
import '../../../core/widgets/custtom_sliver_app_bar.dart';
import '../../../data.dart';

class FoodCategorysView extends StatelessWidget {
  const FoodCategorysView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const CustomSliverAppBar(
              inLayout: true,
              title: 'قائمة الطعام',
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: width * .04,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomSearchBar(),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.all(width * .06),
          child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (160 / 120),
              crossAxisSpacing: width * .05,
              mainAxisSpacing: width * .03,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ...List.generate(
                    categorysList.length, (index) => categorysList[index])
              ]),
        ),
      ),
    );
  }
}
