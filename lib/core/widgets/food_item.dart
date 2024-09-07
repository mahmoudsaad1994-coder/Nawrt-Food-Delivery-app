import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/styles.dart';
import 'respnsive_text.dart';

class FooditemWidget extends StatelessWidget {
  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;

  const FooditemWidget(
      {super.key,
      required this.foodName,
      required this.description,
      required this.price,
      required this.image});
  final String foodName;
  final String description;
  final String image;
  final num price;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: constrain.maxHeight * .22),
            child: Card(
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: constrain.maxHeight * .16),
                  Padding(
                    padding: EdgeInsets.only(right: constrain.maxWidth * .06),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ResponsiveText(
                                height: constrain.maxHeight * .11,
                                text: foodName,
                                style: Styles.textStyle14(context,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                description,
                                style: Styles.textStyle14(
                                  context,
                                  fontWeight: FontWeight.w700,
                                  color: k96908AColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_outline,
                            size: constrain.maxWidth * .17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: constrain.maxWidth * .06),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            ResponsiveText(
                              height: constrain.maxHeight * .13,
                              text: 'جنية',
                              style: Styles.textStyle18
                                  .copyWith(color: Colors.black),
                            ),
                            const SizedBox(width: 3),
                            ResponsiveText(
                              height: constrain.maxHeight * .16,
                              text: '$price',
                              style: Styles.textStyle18
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: constrain.maxHeight * .2,
                          height: constrain.maxHeight * .2,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(EdgeInsets.zero),
                              backgroundColor:
                                  WidgetStateProperty.all(kFFC436Color),
                              foregroundColor:
                                  WidgetStateProperty.all(Colors.white),
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(2),
                                    bottomRight: Radius.circular(2),
                                    bottomLeft: Radius.circular(14),
                                    topRight: Radius.circular(14),
                                  ),
                                  side: BorderSide.none,
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.add,
                              size: constrain.maxHeight * .15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: constrain.maxHeight * .45,
            height: constrain.maxHeight * .45,
            decoration: const ShapeDecoration(
                shape: CircleBorder(), color: Colors.white),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(image))),
            ),
          )
        ],
      );
    });
  }
}
