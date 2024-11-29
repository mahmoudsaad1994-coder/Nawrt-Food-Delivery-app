import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawrt/core/utils/extensions.dart';
import 'package:nawrt/core/widgets/dialog.dart';

import '../../../core/constants.dart';
import '../../../core/utils/app_router.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/payment_info_widget.dart';
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
        PaymentInfoWidget(cubit: cubit),
      ],
    );
  }
}
