import 'package:flutter/material.dart';

SnackBar buildErrorWidget(
  String errMessage,
) {
  return SnackBar(
    content: Text(
      errMessage,
      textAlign: TextAlign.start,
    ),
    duration: const Duration(seconds: 3),
  );
}

SnackBar buildErrorMapWidget(Map errorMap) {
  String errorName = '';
  String errorDesc = '';
  return SnackBar(
    content: LayoutBuilder(builder: (context, constrains) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...errorMap.keys.map((key) {
            if (key == 'email') {
              errorName = 'البريد الألكتروني';
              errorDesc = 'هذا البريد موجود بالفعل جرب بريد أخر';
            } else {
              errorName = 'خطأ';
              errorDesc = 'يوجد خطا فالتسجيل جرب مره اخري ببايانات صحيحة';
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '$errorName : ',
                  style: TextStyle(fontSize: constrains.maxWidth * .05),
                  textAlign: TextAlign.start,
                ),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    ...errorMap[key].map((val) {
                      return Flexible(
                        child: Text(
                          errorDesc,
                          style:
                              TextStyle(fontSize: constrains.maxWidth * .045),
                          softWrap: false,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }),
                  ],
                ),
              ],
            );
          }),
        ],
      );
    }),
    duration: const Duration(seconds: 3),
  );
}
