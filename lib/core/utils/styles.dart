import 'package:flutter/material.dart';

import '../../constants.dart';

abstract class Styles {
  // 24
  static textStyleXXXL(context) => TextStyle(
        fontSize: MediaQuery.of(context).size.width * .06,
        fontWeight: FontWeight.w700,
      );
  // 20
  static textStyleXXL(context,
          {fontWeight = FontWeight.w500, color = Colors.black}) =>
      TextStyle(
          fontSize: MediaQuery.of(context).size.width * .05,
          fontWeight: fontWeight,
          color: color);
  // 18
  static textStyleXL(context,
          {color = Colors.white, fontWeight = FontWeight.w700}) =>
      TextStyle(
        fontSize: MediaQuery.of(context).size.width * .04,
        fontWeight: fontWeight,
        color: color,
      );
  // 16
  static textStyleL(context,
          {color = kBlackColor, fontWeight = FontWeight.w700}) =>
      TextStyle(
        fontSize: MediaQuery.of(context).size.width * .035,
        fontWeight: fontWeight,
        color: color,
      );
  static textStyleSL(context,
          {color = k96908AColor, fontWeight = FontWeight.w400}) =>
      TextStyle(
        fontSize: MediaQuery.of(context).size.width * .03,
        fontWeight: fontWeight,
        color: color,
      );
  //offer
  static textStyleOldPrice(context) => TextStyle(
        fontSize: MediaQuery.of(context).size.width * .035,
        fontWeight: FontWeight.w500,
        // color: k96908AColor,
        decoration: TextDecoration.lineThrough,
        decorationColor: k96908AColor,
      );
  //////

  static const textStyle16old = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static titleLayout(context, {color = Colors.white}) => TextStyle(
        fontSize: MediaQuery.of(context).size.width * .05,
        fontWeight: FontWeight.w700,
        color: color,
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
