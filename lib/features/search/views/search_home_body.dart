import 'package:flutter/material.dart';

import '../../../core/widgets/custom_search_bar.dart';
import '../../../core/widgets/custtom_sliver_app_bar.dart';
import '../../../core/widgets/view_item_title.dart';
import '../../home/views/widgets/home_view_widgets/most_sale_grid_view.dart';
import '../manager/search_cubit.dart';
import 'widgets/recent_searches.dart';

class SearchHomeBody extends StatelessWidget {
  const SearchHomeBody({super.key, required this.cubit});
  final SearchCubit cubit;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const CustomSliverAppBar(
          inLayout: false,
          title: 'البحث',
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: width * .04),
            child: const CustomSearchBar(),
          ),
        ),
        SliverToBoxAdapter(
          child: ViewItemTitle(
            onPressed: () {},
            title: 'البحث الأخير',
            onPressTitle: 'حذف الكل',
          ),
        ),
        const SliverToBoxAdapter(
          child: RecentSearches(),
        ),
        SliverToBoxAdapter(
          child: ViewItemTitle(
            onPressed: () {},
            title: 'أصناف قد تعجبك',
            onPressTitle: '',
            isButtonHidden: true,
          ),
        ),
        const SliverToBoxAdapter(
          child: MostSaleGridView(),
        ),
      ],
    );
  }
}
