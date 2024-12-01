import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../constants.dart';
import '../utils/styles.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.inLayout,
    this.isPinned = false,
    required this.title,
  });
  final bool inLayout;
  final bool isPinned;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      pinned: isPinned,
      backgroundColor: Colors.white,
      leadingWidth: context.width * .2,
      leading: !inLayout
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            )
          : Container(),
      toolbarHeight: context.width * .1,
      title: Text(
        title,
        style: Styles.titleLayout(context, color: kBlackColor),
      ),
    );
  }
}
