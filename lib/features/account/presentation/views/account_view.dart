import 'package:flutter/material.dart';

import '../../../../core/widgets/app_bar_info.dart';
import 'widgets/buttons_list_tile.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarInfo(name: 'سلمي'),
            ButtonsListTile(),
          ],
        ),
      )),
    );
  }
}
