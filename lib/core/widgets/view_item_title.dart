import 'package:flutter/material.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../constants.dart';
import '../utils/styles.dart';
import 'respnsive_text.dart';

class ViewItemTitle extends StatelessWidget {
  const ViewItemTitle({
    super.key,
    required this.title,
    required this.onPressTitle,
    this.onPressed,
    this.isButtonHidden = false,
  });
  final String title;
  final String onPressTitle;
  final Function()? onPressed;
  final bool isButtonHidden;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * .06),
      child: Row(
        children: [
          Text(
            title,
            style: Styles.titleLayout(context, color: Colors.black),
          ),
          const Spacer(),
          if (!isButtonHidden)
            TextButton(
              onPressed: onPressed,
              child: Text(
                onPressTitle,
                style: Styles.titleLayout(
                  context,
                  color: kFFC436Color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
