import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/respnsive_text.dart';
import '../../../../data.dart';

class RecentSearches extends StatelessWidget {
  const RecentSearches({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * .06, vertical: width * .02),
      child: Wrap(
        textDirection: TextDirection.rtl,
        spacing: width * .025, // gap between adjacent chips
        runSpacing: width * .02, // gap between lines
        children: recentSearchs.map((item) {
          return LayoutBuilder(
            builder: (context, constrain) => Container(
              padding: EdgeInsets.symmetric(
                horizontal: constrain.maxWidth * .06,
              ),
              decoration: BoxDecoration(
                color: k0xfff4f3f1Color,
                borderRadius: BorderRadius.circular(width * .08),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResponsiveText(
                    height: constrain.maxWidth * .13,
                    text: item,
                    style: const TextStyle(
                      fontFamily: 'Neo Sans Arabic',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.48,
                      color: k0xff867e7eColor,
                      height: 3,
                    ),
                  ),
                  SizedBox(width: constrain.maxWidth * .01),
                  Icon(
                    Icons.read_more,
                    size: constrain.maxWidth * .06,
                    color: k0xff867e7eColor,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
