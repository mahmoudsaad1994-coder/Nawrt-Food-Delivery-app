import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 680 &&
      MediaQuery.sizeOf(context).width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1200;

  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;
}
