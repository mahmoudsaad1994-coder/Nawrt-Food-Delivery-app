import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../core/utils/assets.dart';
import '../../../core/widgets/custom_search_bar.dart';
import '../../../core/widgets/custtom_sliver_app_bar.dart';
import '../../home/views/widgets/home_view_widgets/most_sale_grid_view.dart';
import 'widgets/category_item.dart';

class FoodsView extends StatelessWidget {
  const FoodsView({super.key, required this.categoryItem});
  final CategoryItem categoryItem;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              CustomSliverAppBar(
                inLayout: true,
                title: categoryItem.categoryName,
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: size.width * .04,
                ),
              ),
              const SliverToBoxAdapter(
                child: CustomSearchBar(
                  isHome: true,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(size.width * .06),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size.width * .05),
                    child: Image.asset(
                      AssetsData.offFood2,
                      height: size.height * .23,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: const MostSaleGridView(),
        ),
      ),
    );
  }
}
