import 'package:flutter/material.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../features/home/presentation/manager/cubit.dart';
import '../constants.dart';
import '../utils/styles.dart';

class DiscountWidget extends StatefulWidget {
  const DiscountWidget({super.key, required this.cubit});
  final MainCubit cubit;
  @override
  State<DiscountWidget> createState() => _DiscountWidgetState();
}

class _DiscountWidgetState extends State<DiscountWidget> {
  TextEditingController discountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    discountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.width * .12,
                child: TextFormField(
                  controller: discountController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    hintText: "كود الخصم",
                    hintStyle: TextStyle(fontSize: context.width * .035),
                    prefixIcon: const Icon(
                        Icons.discount_outlined), // الأيقونة على اليمين
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide:
                          const BorderSide(color: kFFC436Color, width: 2.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.cubit.errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: context.width * .033,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.width * .12,
            width: context.width * .3,
            child: TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  widget.cubit
                      .applyDiscount(discountController.text.toLowerCase());
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(color: kFFC436Color),
                ),
                backgroundColor: Colors.white,
                overlayColor: kFFC436Color.withOpacity(0.1),
              ),
              child: Text(
                "تطبيق",
                style: Styles.textStyleL(context,
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
