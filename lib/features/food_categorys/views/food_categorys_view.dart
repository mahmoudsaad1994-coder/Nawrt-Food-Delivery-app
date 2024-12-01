import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_router.dart';
import '../../../core/widgets/custom_search_bar.dart';
import '../../../core/widgets/custtom_sliver_app_bar.dart';
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
        return NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const CustomSliverAppBar(
                inLayout: true,
                title: 'قائمة الطعام',
                isPinned: true,
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .06),
            child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (160 / 120),
                crossAxisSpacing: width * .05,
                mainAxisSpacing: width * .03,
                children: [
                  ...List.generate(
                    cubit.categoriesList.length,
                    (index) => GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kFoodsView,
                            extra: cubit.categoriesList[index]);
                      },
                      child: CategoryItem(
                        categoryName: cubit.categoriesList[index].name,
                        image: cubit.categoriesList[index].image,
                      ),
                    ),
                  )
                ]),
          ),
        );
      },
    );
  }
}
