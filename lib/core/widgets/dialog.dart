import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../constants.dart';
import '../utils/app_router.dart';
import '../utils/styles.dart';
import 'custom_button.dart';

void confirmationItemsShowDialog({
  required BuildContext context,
}) {
  dialogWidget(
      done: true,
      context: context,
      text: 'تم إضافة الطلب إلى عربة التسوق بنجاح!',
      firstTextButton: 'الذهاب إلى عربة التسوق',
      secondTextButton: 'الاستمرار بالتسوق',
      onPressedSecondButton: () {
        GoRouter.of(context).pushReplacement(AppRouter.kLayoutView);
      },
      onPressedFirstButton: () {
        GoRouter.of(context).push(AppRouter.kShoppingCartViewOutside);
      });
}

void confirmationPaymentMethodShowDialog({
  required BuildContext context,
  required bool done,
  int ordernumber = 1,
}) {
  dialogWidget(
    context: context,
    done: done,
    text: done ? 'تم تأكيد الطلب بنجاح ' : 'تعذر تأكيد الطلب',
    orderNumber: ordernumber,
    firstTextButton: done ? 'عرض معلومات الطلب' : 'إعادة الطلب',
    secondTextButton: 'العودة للرئيسية',
    onPressedFirstButton: () {
      done
          ? GoRouter.of(context).pushReplacement(AppRouter.kOrderInfoView)
          : GoRouter.of(context).pop();
    },
    onPressedSecondButton: () {
      GoRouter.of(context).pushReplacement(AppRouter.kLayoutView);
    },
  );
}

dialogWidget({
  required BuildContext context,
  required String text,
  bool done = false,
  int orderNumber = 1,
  required String firstTextButton,
  required String secondTextButton,
  required void Function()? onPressedSecondButton,
  required void Function()? onPressedFirstButton,
}) {
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
            Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ],
              ),
              child: Icon(
                done ? Icons.check_circle : Icons.error_outline,
                color: kFFC436Color,
                size: context.width * .2,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              text,
              textAlign: TextAlign.center,
              style: Styles.textStyleXL(
                context,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (text == 'تم تأكيد الطلب بنجاح ')
              Text(
                'رقم الطلب : #$orderNumber',
                textAlign: TextAlign.center,
                style: Styles.textStyleL(
                  context,
                  color: kFFC436Color,
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
                    onPressed: onPressedFirstButton,
                    child: Text(
                      firstTextButton,
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
                    onPressed: onPressedSecondButton,
                    child: Text(
                      secondTextButton,
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
