import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/custom_bottom_sheet.dart';
import '../../home/presentation/manager/cubit.dart';
import '../../home/presentation/manager/states.dart';

class PickupBranchBottomSheet extends StatelessWidget {
  const PickupBranchBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return CustomBottomSheet(
            label: 'اختر الفرع',
            textButton: 'استلام من هذا الفرع',
            body: Column(
              children: List.generate(cubit.branchs.length, (index) {
                return Card(
                  elevation: 3,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: cubit.branchs[index] != cubit.branchSelected
                            ? Colors.transparent
                            : kFFC436Color),
                    borderRadius: BorderRadius.circular(25), // الحواف المستديرة
                  ),
                  child: ListTile(
                    title: Text(
                      cubit.branchs[index],
                      style: TextStyle(fontSize: context.width * .04),
                    ),
                    leading: Radio(
                      value: cubit.branchs[index],
                      groupValue: cubit.branchSelected,
                      onChanged: (String? value) {
                        cubit.changebranchSelected(value!);
                      },
                    ),
                    // trailing: ,
                  ),
                );
              }),
            ),
          );
        });
  }
}
