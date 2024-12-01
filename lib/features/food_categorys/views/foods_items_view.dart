import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/assets.dart';
import '../../../core/widgets/custom_search_widget.dart';
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
          builder: (context, state) => CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                inLayout: false,
                title: categoryItem.name,
                isPinned: true,
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: size.width * .04,
                ),
              ),
              const SliverToBoxAdapter(child: CustomSearchWidget()),
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
              const SliverFillRemaining(
                child: MostSaleGridView(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
