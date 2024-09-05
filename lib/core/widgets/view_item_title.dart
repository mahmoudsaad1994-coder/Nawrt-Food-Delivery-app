import 'package:flutter/material.dart';

import '../../constants.dart';
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
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .06),
      child: Row(
        children: [
          if (!isButtonHidden)
            TextButton(
              onPressed: onPressed,
              child: ResponsiveText(
                height: MediaQuery.of(context).size.width * .06,
                text: onPressTitle,
                style: Styles.textStyle16old.copyWith(
                  color: kFFC436Color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          const Spacer(),
          ResponsiveText(
            height: MediaQuery.of(context).size.width * .06,
            text: title,
            style: Styles.textStyle18.copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
