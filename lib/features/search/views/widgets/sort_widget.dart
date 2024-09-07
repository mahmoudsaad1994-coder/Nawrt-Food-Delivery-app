import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';

class SortWidget extends StatelessWidget {
  const SortWidget({super.key, required this.title, required this.childern});
  final String title;
  final List<Widget> childern;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Card(
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100))),
      child: ExpansionTile(
        dense: true,
        childrenPadding: EdgeInsets.all(width * .01),
        tilePadding: EdgeInsets.symmetric(
          horizontal: width * .05,
          vertical: width * .01,
        ),
        collapsedShape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        title: Text(
          title,
          style: Styles.textStyle16old.copyWith(
            color: kBlackColor,
            fontSize: width * .04,
          ),
        ),
        children: childern,
      ),
    );
  }
}
