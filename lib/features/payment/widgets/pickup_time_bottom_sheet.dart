import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/custom_bottom_sheet.dart';
import '../../home/presentation/manager/cubit.dart';
import '../../home/presentation/manager/states.dart';

class PickupTimeBottomSheet extends StatelessWidget {
  const PickupTimeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return CustomBottomSheet(
            label: 'وقت الاستلام',
            textButton: 'تأكيد',
            body: Column(children: [
              Card(
                elevation: 3,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: cubit.pickupTime != 'استلام سريع'
                          ? Colors.transparent
                          : kFFC436Color),
                  borderRadius: BorderRadius.circular(25), // الحواف المستديرة
                ),
                child: ListTile(
                  title: Text(
                    'استلام سريع',
                    style: TextStyle(
                        fontSize: context.width * .04,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Radio(
                    value: 'استلام سريع',
                    groupValue: cubit.pickupTime,
                    onChanged: (String? value) {
                      cubit.changePickupTime(value!);
                    },
                  ),
                  subtitle: Text(
                    'سيتم تجهيز طلبك في خلال 20 دقيقة',
                    style: TextStyle(fontSize: context.width * .035),
                  ),
                ),
              ),
              Card(
                elevation: 3,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: cubit.pickupTime != 'تحديد وقت الاستلام'
                          ? Colors.transparent
                          : kFFC436Color),
                  borderRadius: BorderRadius.circular(25), // الحواف المستديرة
                ),
                child: ListTile(
                  title: Text(
                    'تحديد وقت الاستلام',
                    style: TextStyle(
                        fontSize: context.width * .04,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Radio(
                    value: 'تحديد وقت الاستلام',
                    groupValue: cubit.pickupTime,
                    onChanged: (String? value) {
                      cubit.changePickupTime(value!);
                      cubit.selectPickupTimeDate(context);
                    },
                  ),
                  subtitle: Text(
                    'قم بتحديد الوقت المناسب لاستلام طلبك',
                    style: TextStyle(fontSize: context.width * .035),
                  ),
                ),
              ),
            ]),
          );
        });
  }
}
