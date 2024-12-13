import 'package:flutter/material.dart';
import 'package:nawrt/core/utils/extensions.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key, required this.childrenDelegate});
  final SliverChildDelegate childrenDelegate;
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * .06, vertical: width * .02),
      child: GridView.custom(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (170 / 172),
          crossAxisSpacing: width * .05,
          mainAxisSpacing: width * .03,
        ),
        childrenDelegate: childrenDelegate,
      ),
    );
  }
}
