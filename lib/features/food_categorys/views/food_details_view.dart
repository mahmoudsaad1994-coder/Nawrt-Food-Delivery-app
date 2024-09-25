import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/domain/entities/food_entity.dart';
import '../../home/presentation/manager/cubit.dart';
import '../../home/presentation/manager/states.dart';
import 'widgets/count_and_add_food_cart_widget.dart';
import 'widgets/food_details_widgets/food_details_description.dart';
import 'widgets/food_details_widgets/food_details_AppBar_widget.dart';

class FoodDetailsView extends StatelessWidget {
  const FoodDetailsView({super.key, required this.food});
  final FoodEntity food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);

          return CustomScrollView(
            slivers: <Widget>[
              FoodDetailsAppBarWidget(
                food: food,
                cubit: cubit,
              ),
              FoodDetailsDescription(
                cubit: cubit,
                food: food,
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        color: Colors.white,
        height: MediaQuery.of(context).size.height * .09,
        child: const CountAndAddFoodCartWidget(),
      ),
    );
  }
}
