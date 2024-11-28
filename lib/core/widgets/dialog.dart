import 'package:flutter/material.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../constants.dart';
import '../utils/styles.dart';
import 'custom_button.dart';

void showOrderConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(context.width * .08),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.amber,
              size: context.width * .2,
            ),
            const SizedBox(height: 15),
            Text(
              'تم إضافة الطلب إلى عربة التسوق بنجاح!',
              textAlign: TextAlign.center,
              style: Styles.textStyleXL(
                context,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: context.height * .05,
                  child: CustomButton(
                    onPressed: () {
                      // الانتقال إلى عربة التسوق
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'الذهاب إلى عربة التسوق',
                      style: TextStyle(
                        fontFamily: kAvenirArabic,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: context.width * .04,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: context.height * .05,
                  width: double.infinity,
                  child: CustomButton(
                    backgroundColor: Colors.white,
                    borderSide: const BorderSide(
                      color: kFFC436Color,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'الاستمرار بالتسوق',
                      style: Styles.textStyle16old.copyWith(
                        fontFamily: kAvenirArabic,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: context.width * .04,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
