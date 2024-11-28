import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../constants.dart';
import '../utils/styles.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar(
      {super.key, required this.inLayout, required this.title});
  final bool inLayout;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      leadingWidth: context.width * .2,
      leading: !inLayout
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                GoRouter.of(context).pop();
                print('back');
              },
            )
          : Container(),
      toolbarHeight: MediaQuery.of(context).size.width * .1,
      title: Text(
        title,
        style: Styles.titleLayout(context, color: kBlackColor),
      ),
    );
  }
}
