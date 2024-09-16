import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/assets.dart';
import '../../../core/widgets/custom_search_bar.dart';
import '../../../core/widgets/custtom_sliver_app_bar.dart';
import '../../home/domain/entities/categoray.dart';
import '../../home/presentation/manager/cubit.dart';
import '../../home/presentation/manager/states.dart';
import '../../home/presentation/views/widgets/home_view_widgets/most_sale_grid_view.dart';

class FoodsView extends StatelessWidget {
  const FoodsView({super.key, required this.categoryItem});
  final CategoriesEntity categoryItem;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MainCubit, MainStates>(
          listener: (context, state) {},
          builder: (context, state) => NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                CustomSliverAppBar(
                  inLayout: true,
                  title: categoryItem.name,
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
                        AssetsData.banner6Image,
                        height: size.height * .23,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: MostSaleGridView(
              foodList: MainCubit.get(context).foodsList,
              cubit: MainCubit.get(context),
            ),
          ),
        ),
      ),
    );
  }
}