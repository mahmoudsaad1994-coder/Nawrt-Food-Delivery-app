import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../features/home/presentation/manager/cubit.dart';
import '../constants.dart';
import '../utils/app_router.dart';
import '../utils/styles.dart';
import 'custom_button.dart';
import 'dialog.dart';

class PaymentInfoWidget extends StatelessWidget {
  const PaymentInfoWidget(
      {super.key, required this.cubit, this.isPaymentConfirm = false});
  final MainCubit cubit;
  final bool isPaymentConfirm;
  @override
  Widget build(BuildContext context) {
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
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Expanded(
              child: SizedBox(
                height: context.width * .12,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    hintText: "كود الخصم",
                    hintStyle: TextStyle(fontSize: context.width * .035),
                    prefixIcon: const Icon(
                        Icons.discount_outlined), // الأيقونة على اليمين
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide:
                          const BorderSide(color: kFFC436Color, width: 2.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.width * .12,
              width: context.width * .3,
              child: TextButton(
                onPressed: cubit.applyDiscount,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: kFFC436Color),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  "تطبيق",
                  style: Styles.textStyleL(context,
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
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
  }
}
