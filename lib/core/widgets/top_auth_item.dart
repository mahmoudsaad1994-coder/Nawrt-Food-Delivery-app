import 'package:flutter/material.dart';

import 'background_image.dart';

class TopAuthItem extends StatelessWidget {
  const TopAuthItem(
      {super.key,
      required this.sizeHeight,
      required this.title,
      required this.image});
  final double sizeHeight;
  final Widget title;
  final Widget image;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * sizeHeight,
        width: double.infinity,
        child: Stack(
          children: [
            const BackgroundImage(),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: size.height * .08,
                      top: size.width * .08,
                      left: size.width * .10,
                      right: size.width * .10,
                    ),
                    child: title,
                  ),
                ),
                image,
              ],
            )
          ],
        ));
  }
}
