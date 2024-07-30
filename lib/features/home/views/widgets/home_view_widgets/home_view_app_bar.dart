import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/respnsive_text.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * .06),
      child: LayoutBuilder(builder: (context, constrain) {
        return Row(
          children: [
            IconButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: WidgetStateProperty.all(EdgeInsets.zero),
              ),
              icon: Icon(
                Icons.notifications,
                applyTextScaling: true,
                color: Colors.blue,
                size: constrain.maxWidth * .08,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        ResponsiveText(
                          height: constrain.maxWidth * .07,
                          text: '$name ,',
                          style: Styles.textStyle16.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        ResponsiveText(
                          height: constrain.maxWidth * .06,
                          text: 'أهلا بعودتك',
                          style: Styles.textStyle16.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: ResponsiveText(
                            height: constrain.maxWidth * .05,
                            text: 'تغيير العنوان',
                            style: Styles.textStyle14.copyWith(
                              color: kFFC436Color,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        ResponsiveText(
                          height: constrain.maxWidth * .05,
                          text: 'العنوان الحالي',
                          style: Styles.textStyle14.copyWith(
                            color: k96908AColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          Icons.location_on_outlined,
                          size: constrain.maxWidth * .05,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(width: constrain.maxWidth * .02),
                CircleAvatar(
                  backgroundColor: const Color(0xffD9D9D9),
                  radius: constrain.maxWidth * .06,
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
