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
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffD9D9D9),
                  radius: constrain.maxWidth * .06,
                ),
                SizedBox(width: constrain.maxWidth * .02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ResponsiveText(
                          height: constrain.maxWidth * .07,
                          text: '$name ,',
                          style: Styles.textStyle16old.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        ResponsiveText(
                          height: constrain.maxWidth * .06,
                          text: 'أهلا بعودتك',
                          style: Styles.textStyle16old.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: constrain.maxWidth * .01),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: constrain.maxWidth * .05,
                        ),
                        const SizedBox(width: 5),
                        ResponsiveText(
                          height: constrain.maxWidth * .05,
                          text: 'العنوان الحالي',
                          style: Styles.textStyle14(
                            context,
                            color: k96908AColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {},
                          child: ResponsiveText(
                            height: constrain.maxWidth * .05,
                            text: 'تغيير العنوان',
                            style: Styles.textStyle14(
                              context,
                              color: kFFC436Color,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
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
          ],
        );
      }),
    );
  }
}
