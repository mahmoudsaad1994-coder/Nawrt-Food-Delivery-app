import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_router.dart';
import '../../../core/widgets/custom_search_widget.dart';
import '../../../core/widgets/custtom_sliver_app_bar.dart';
import '../../../core/widgets/grid_view.dart';
import '../../home/presentation/manager/cubit.dart';
import '../../home/presentation/manager/states.dart';
import 'widgets/category_item.dart';

class FoodCategorysView extends StatelessWidget {
  const FoodCategorysView({super.key});

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
              const CustomSliverAppBar(
                inLayout: true,
                title: 'قائمة الطعام',
                isPinned: true,
              ),
              const SliverToBoxAdapter(
                child: CustomSearchWidget(),
              ),
              SliverToBoxAdapter(
                child: GridViewWidget(
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) => GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kFoodsView,
                            extra: cubit.categoriesList[index]);
                      },
                      child: CategoryItem(
                        categoryName: cubit.categoriesList[index].name,
                        image: cubit.categoriesList[index].image,
                      ),
                    ),
                    childCount: cubit.categoriesList.length,
                  ),
                ),
              )
            ]);
      },
    );
  }
}
