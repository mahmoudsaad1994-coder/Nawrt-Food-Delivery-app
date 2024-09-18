import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/manager/cubit.dart';
import '../../../home/presentation/manager/states.dart';

class FoodAdditionsWidget extends StatelessWidget {
  final int index;
  const FoodAdditionsWidget({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 2,
            child: CheckboxListTile.adaptive(
              value: cubit.isAdditionChecked[index],
              onChanged: (bool? val) {
                cubit.selectAdition(index, val);
              },
              controlAffinity: ListTileControlAffinity.leading,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              activeColor: kFFC436Color,
              title: Text(
                cubit.foodAdditionsWidgetList[index].keys.first,
                style: Styles.textStyleL(
                  context,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              secondary: Text(
                '${cubit.foodAdditionsWidgetList[index].values.first} جنيه',
                style: Styles.textStyleL(context,
                    fontWeight: FontWeight.w500, color: kFFC436Color),
              ),
              dense: true,
            ),
          ),
        );
      },
    );
  }
}
/*  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: cubit.isAdditionChecked[index],
                        onChanged: (bool? val) {
                          cubit.selectAdition(index, val);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        activeColor: kFFC436Color,
                      ),
                      Text(
                        cubit.foodAdditionsWidgetList[index].keys.first,
                        style: Styles.textStyleL(
                          context,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${cubit.foodAdditionsWidgetList[index].values.first} جنيه',
                    style: Styles.textStyleL(context,
                        fontWeight: FontWeight.w500, color: kFFC436Color),
                  ),
                ],
              ), */