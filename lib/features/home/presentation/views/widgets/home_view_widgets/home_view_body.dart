import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/widgets/custom_search_bar.dart';
import '../../../../../../core/widgets/today_dish_item.dart';
import '../../../manager/cubit.dart';
import '../../../manager/states.dart';
import 'food_categorys_list_view_item.dart';
import '../../../../../../core/widgets/app_bar_info.dart';
import '../../../../../../core/widgets/view_item_title.dart';
import 'most_sale_grid_view.dart';
import 'spicial_offer_slider.dart';
import 'spicial_offers_rastt.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const AppBarInfo(name: 'رانيــا'),
                  const CustomSearchBar(isHome: true),
                  SizedBox(height: width * .05),
                  const SpicialOfferSlider(),
                  SizedBox(height: width * .01),
                  FoodCategorysListViewItem(categories: cubit.categoriesList),
                  SizedBox(height: width * .05),
                  ViewItemTitle(
                    title: 'الأكثر مبيعا',
                    onPressTitle: 'عرض الكل',
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kBestSellerView);
                    },
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: MostSaleGridView(
                  foodList: cubit.foodsList, cubit: cubit, isHome: true),
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
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kSpicialOffersView);
                    },
                  ),
                  SizedBox(height: width * .02),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SpicialOffersRastt(isHome: true),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: width * .05),
            ),
          ],
        );
      },
    );
  }
}
