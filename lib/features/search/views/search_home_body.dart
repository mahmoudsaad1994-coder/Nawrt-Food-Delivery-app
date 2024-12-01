import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../../core/widgets/custom_search_bar.dart';
import '../../../core/widgets/custtom_sliver_app_bar.dart';
import '../../../core/widgets/view_item_title.dart';
import '../../home/presentation/views/widgets/home_view_widgets/most_sale_grid_view.dart';
import '../manager/search_cubit.dart';
import '../manager/search_states.dart';
import 'widgets/recent_searches.dart';

class SearchHomeBody extends StatelessWidget {
  const SearchHomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
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
              if (cubit.searchController.text == '' ||
                  cubit.searchController.text.isEmpty)
                ...fristLook
            ],
          );
        });
  }
}

List fristLook = [
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
];
