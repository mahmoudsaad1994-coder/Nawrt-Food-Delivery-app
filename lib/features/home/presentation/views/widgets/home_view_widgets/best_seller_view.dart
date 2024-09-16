import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/widgets/custom_search_bar.dart';
import '../../../../../../core/widgets/custtom_sliver_app_bar.dart';
import '../../../manager/cubit.dart';
import '../../../manager/states.dart';
import 'most_sale_grid_view.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});

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
                const CustomSliverAppBar(
                  inLayout: true,
                  title: 'الأكثر مبيــعا',
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
