import 'package:flutter/material.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../core/constants.dart';
import '../../core/utils/styles.dart';
import '../../core/widgets/custom_payment_button.dart';
import '../../core/widgets/payment_info_widget.dart';
import '../home/presentation/manager/cubit.dart';
import 'widgets/wallet_form_info.dart';

class OrderDelivery extends StatelessWidget {
  const OrderDelivery({super.key, required this.cubit});
  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: context.width,
          minHeight: context.height * .84,
        ),
        child: IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: context.width * .04, horizontal: context.width * .05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPaymentButton(
                  icon: Icons.location_on_outlined,
                  label:
                      "طلخا بجوار مطعم هجرس طلخا بجوار مطعم هجرس طلخا بجوار مطعم هجرس",
                  isAddress: true,
                  onTap: () {},
                ),
                Text(
                  'طريقة الدفع',
                  style: Styles.textStyleXL(context, color: Colors.black),
                ),
                Card(
                  elevation: 3,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: cubit.isCashOnDeliverySelected
                            ? Colors.transparent
                            : kFFC436Color),
                    borderRadius: BorderRadius.circular(25), // الحواف المستديرة
                  ),
                  child: ListTile(
                    title: Text(
                      'دفع عند الاستلام',
                      style: TextStyle(fontSize: context.width * .04),
                    ),
                    leading: Radio(
                      value: false,
                      groupValue: cubit.isCashOnDeliverySelected,
                      onChanged: (value) {
                        cubit.changeDeliverySelected(value!);
                      },
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // الحواف المستديرة
                    side: BorderSide(
                        color: !cubit.isCashOnDeliverySelected
                            ? Colors.transparent
                            : kFFC436Color),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'بطاقة ائتمان',
                          style: TextStyle(fontSize: context.width * .04),
                        ),
                        leading: Radio(
                          value: true,
                          groupValue: cubit.isCashOnDeliverySelected,
                          onChanged: (value) {
                            cubit.changeDeliverySelected(value!);
                          },
                        ),
                      ),
                      if (cubit.isCashOnDeliverySelected)
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.width * .05, vertical: 10),
                          child: WalletFormInfo(cubit: cubit),
                        ),
                    ],
                  ),
                ),
                const Spacer(),
                const PaymentInfoWidget(
                  isPaymentConfirm: true,
                  orderIsDelivery: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
