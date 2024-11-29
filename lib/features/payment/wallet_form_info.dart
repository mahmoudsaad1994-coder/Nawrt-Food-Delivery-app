import 'package:flutter/material.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../core/constants.dart';
import '../home/presentation/manager/cubit.dart';
import 'widgets/wallet_textfield_widget.dart';

class WalletFormInfo extends StatefulWidget {
  const WalletFormInfo({super.key, required this.cubit});
  final MainCubit cubit;

  @override
  State<WalletFormInfo> createState() => _WalletFormInfoState();
}

class _WalletFormInfoState extends State<WalletFormInfo> {
  final formKey = GlobalKey<FormState>();
  TextEditingController walletName = TextEditingController();
  TextEditingController walletNumber = TextEditingController();
  TextEditingController walletDate = TextEditingController();
  TextEditingController walletCVV = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            WalletTextfieldWidget(
                text: 'اسم صاحب البطاقة', controller: walletName),
            const SizedBox(height: 10),
            WalletTextfieldWidget(
                text: 'رقم البطاقة', controller: walletNumber),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: WalletTextfieldWidget(
                      text: 'تاريخ الانتهاء', controller: walletDate),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child:
                      WalletTextfieldWidget(text: 'CVV', controller: walletCVV),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'حفظ تفاصيل البطاقة',
                  style: TextStyle(
                    fontSize: context.width * .04,
                  ),
                ),
                Switch(
                  value: widget.cubit.saveWalletInfo,
                  onChanged: widget.cubit.toggleSaveWalletInfo,
                  activeTrackColor: kFFC436Color,
                  activeColor: Colors.white,
                ),
              ],
            )
          ],
        ));
  }
}
