import 'package:flutter/material.dart';

import '../../constants.dart';

abstract class Styles {
  static textStyle23(context) => TextStyle(
        fontSize: MediaQuery.of(context).size.width * .06,
        fontWeight: FontWeight.w900,
      );
  static textStyle14(context,
          {color = kBlackColor, fontWeight = FontWeight.w500}) =>
      TextStyle(
        fontSize: MediaQuery.of(context).size.width * .04,
        fontWeight: fontWeight,
        color: color,
      );
  static textStyle16(context,
          {color = Colors.white, fontWeight = FontWeight.w700}) =>
      TextStyle(
        fontSize: MediaQuery.of(context).size.width * .04,
        fontWeight: fontWeight,
        color: color,
      );

  static const textStyle16old = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static const textStyle13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: k96908AColor,
    decoration: TextDecoration.lineThrough,
    decorationColor: k96908AColor,
  );
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static const textStyleMulish18 = TextStyle(
    color: Color(0xffFFC436),
    fontFamily: kMulish,
  );
}
