import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/styles.dart';

class AppBarInfo extends StatelessWidget {
  const AppBarInfo({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * .06),
      child: LayoutBuilder(builder: (context, constrain) {
        return Row(
          children: [
            Row(
              children: [
                Container(
                  width: size.width * .11,
                  height: size.width * .11,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: k96908AColor,
                      )),
                  child: const Icon(Icons.person_outlined),
                ),
                SizedBox(width: constrain.maxWidth * .02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style:
                              Styles.textStyleXL(context, color: Colors.black),
                        ),
                        Text(
                          ' أهلا بعودتك',
                          style: Styles.textStyleL(context),
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
                        Text(
                          'العنوان الحالي',
                          style: Styles.textStyleSL(context),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'تغيير العنوان',
                            style: Styles.textStyleSL(context,
                                color: kFFC436Color),
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
                color: kPrimaryColor,
                size: constrain.maxWidth * .08,
              ),
            ),
          ],
        );
      }),
    );
  }
}
