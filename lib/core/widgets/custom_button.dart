import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor,
    this.borderRadius,
    required this.child,
    this.borderSide,
    required this.onPressed,
  });
  final Widget child;
  final Color? backgroundColor;
  final BorderSide? borderSide;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ??
              BorderRadius.circular(
                MediaQuery.of(context).size.height * .02,
              ),
          side: borderSide ?? BorderSide.none,
        ),
      ),
      child: child,
    );
  }
}
