import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/respnsive_text.dart';

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
            ResponsiveText(
              height: constrain.maxHeight * .23,
              text: categoryName,
              style: Styles.textStyle18,
            ),
          ],
        ),
      );
    });
  }
}
