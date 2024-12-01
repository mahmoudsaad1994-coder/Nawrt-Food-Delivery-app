import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/payment_info_widget.dart';
import '../../home/presentation/manager/cubit.dart';
import '../../home/presentation/manager/states.dart';
import 'shopping_item_widget.dart';

class ShoppingCartBody extends StatelessWidget {
  const ShoppingCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);

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
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                ),
              ),
              const SizedBox(height: 10),
              const PaymentInfoWidget(orderIsDelivery: false),
            ],
          );
        });
  }
}
