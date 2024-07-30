import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  const ResponsiveText({
    super.key,
    required this.height,
    this.width,
    required this.style,
    required this.text,
  });
  final double height;
  final double? width;
  final TextStyle style;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(
        child: Text(
          text,
          style: style,
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
