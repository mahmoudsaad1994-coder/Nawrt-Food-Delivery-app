import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.image, required this.categoryName});
  final String image;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.fill,
            ),
            Text(
              categoryName,
              style: Styles.titleLayout(context),
            ),
          ],
        ),
      );
    });
  }
}
