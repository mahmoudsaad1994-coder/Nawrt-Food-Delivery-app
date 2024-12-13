import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../features/home/presentation/manager/cubit.dart';
import '../../features/home/presentation/manager/states.dart';
import '../constants.dart';
import '../utils/app_router.dart';
import '../utils/styles.dart';
import 'custom_button.dart';
import 'dialog.dart';
import 'discount_widget.dart';

class PaymentInfoWidget extends StatelessWidget {
  const PaymentInfoWidget(
      {super.key,
      this.isPaymentConfirm = false,
      required this.orderIsDelivery});

  final bool isPaymentConfirm;
  final bool orderIsDelivery;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "تفاصيل الدفع",
                style: Styles.textStyleXXL(context,
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "السعر المطلوب",
                    style: Styles.textStyleXL(context,
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${cubit.totalPrice.toStringAsFixed(2)} جنيه",
                    style: Styles.textStyleXXL(context,
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (isPaymentConfirm) DiscountWidget(cubit: cubit),
              const SizedBox(height: 10),
              if (cubit.discount != 0.0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الخصم",
                      style: Styles.textStyleXL(context,
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${cubit.discount} جنيه",
                      style: Styles.textStyleXXL(context,
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              const SizedBox(height: 10),
              if (isPaymentConfirm)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "السعر الكلي",
                      style: Styles.textStyleXL(context,
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${cubit.finalPrice.toStringAsFixed(2)} جنيه",
                      style: Styles.textStyleXXL(context,
                          color: kFFC436Color, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: context.width * .12,
                child: CustomButton(
                  onPressed: () {
                    isPaymentConfirm
                        ? confirmationPaymentMethodShowDialog(
                            context: context,
                            done: true,
                            ordernumber: 36,
                            isDelivery: orderIsDelivery,
                          )
                        : GoRouter.of(context).push(AppRouter.kConfirmOrder);
                  },
                  child: Text(
                    isPaymentConfirm ? 'تاكيد الـدفع' : "الذهاب للدفع",
                    style: Styles.textStyleXL(context, color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
