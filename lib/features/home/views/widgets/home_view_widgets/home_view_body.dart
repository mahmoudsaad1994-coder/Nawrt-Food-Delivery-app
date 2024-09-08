import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_search_bar.dart';
import '../../../../../core/widgets/today_dish_item.dart';
import 'food_categorys_list_view_item.dart';
import 'home_view_app_bar.dart';
import '../../../../../core/widgets/view_item_title.dart';
import 'most_sale_grid_view.dart';
import 'spicial_offer_slider.dart';
import 'spicial_offers_rastt.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const HomeViewAppBar(name: 'سلمي'),
              const CustomSearchBar(isHome: true),
              SizedBox(height: width * .05),
              const SpicialOfferSlider(),
              SizedBox(height: width * .05),
              const FoodCategorysListViewItem(),
              SizedBox(height: width * .05),
              ViewItemTitle(
                title: 'الأكثر مبيعا',
                onPressTitle: 'عرض الكل',
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: MostSaleGridView(),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const TodayDishItem(
                image: AssetsData.testtest2Image,
                price: 200,
                title: 'بيتزا ايطالية',
              ),
              ViewItemTitle(
                title: 'عروض توفير ابن الشام',
                onPressTitle: 'عرض الكل',
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SpicialOffersRastt(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: width * .05),
        ),
      ],
    );
  }
}
