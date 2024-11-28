import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawrt/core/utils/extensions.dart';
import 'package:nawrt/core/widgets/dialog.dart';

import '../../../core/constants.dart';
import '../../../core/utils/app_router.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../home/presentation/manager/cubit.dart';
import 'shopping_item_widget.dart';

class ShoppingCartBody extends StatelessWidget {
  const ShoppingCartBody({super.key, required this.cubit});

  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: cubit.cartItems.length,
            itemBuilder: (context, index) {
              final item = cubit.cartItems[index];
              return ShoppingItemWidget(item: item, cubit: MainCubit());
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          ),
        ),
        const SizedBox(height: 10),
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
              GoRouter.of(context).push(AppRouter.kConfirmOrder);
            },
            child: Text(
              "الذهاب للدفع",
              style: Styles.textStyleXL(context, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
