import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../../core/constants.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/dialog.dart';
import '../../home/domain/entities/food_entity.dart';
import '../../home/presentation/manager/cubit.dart';
import '../../home/presentation/manager/states.dart';
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
        padding: EdgeInsetsDirectional.only(
          end: context.width * .06,
          start: context.width * .06,
          bottom: 2,
        ),
        color: Colors.white,
        height: context.height * .07,
        child: CustomButton(
          onPressed: () {
            confirmationItemsShowDialog(context: context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'إضافة إلى عربة التسوق',
                  style: Styles.textStyleXL(context, color: Colors.white),
                ),
                SizedBox(width: context.width * .03),
                Text(
                  '150 جنيه',
                  style: Styles.textStyleXXL(context, color: kFFC436Color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
