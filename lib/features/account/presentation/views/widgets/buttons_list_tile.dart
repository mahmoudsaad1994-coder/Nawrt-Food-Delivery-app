import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/button_tile.dart';

class ButtonsListTile extends StatelessWidget {
  const ButtonsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * .04,
        vertical: width * .04,
      ),
      child: Column(
        children: [
          SizedBox(
            height: width * .2,
            child: ButtonTile(
              name: 'أوردراتك',
              icon: IconAssetsManager.orderListIcon,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kOrdersScreen);
              },
            ),
          ),
          SizedBox(
            height: width * .2,
            child: ButtonTile(
              name: 'العروض',
              icon: IconAssetsManager.offerIcon,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kOfferScreen);
              },
            ),
          ),
          SizedBox(
            height: width * .2,
            child: ButtonTile(
              name: 'الأعدادات',
              icon: IconAssetsManager.settingIcon,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSettingsView);
              },
            ),
          ),
          SizedBox(
            height: width * .2,
            child: ButtonTile(
              name: 'الدفع',
              icon: IconAssetsManager.walletIcon,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kPaymentsView);
              },
            ),
          ),
          SizedBox(
            height: width * .2,
            child: ButtonTile(
              name: 'مـساعدة',
              icon: IconAssetsManager.helpIcon,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kHelpView);
              },
            ),
          ),
          SizedBox(
            height: width * .2,
            child: ButtonTile(
              name: 'عنـنا',
              icon: IconAssetsManager.aboutUsIcon,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kAboutUs);
              },
            ),
          ),
        ],
      ),
    );
  }
}
