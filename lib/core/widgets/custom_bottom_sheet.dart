import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../utils/styles.dart';
import 'custom_button.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key,
      required this.label,
      required this.textButton,
      required this.body});
  final String label;
  final String textButton;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: Styles.textStyleXL(context,
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.close)),
            ],
          ),
          const SizedBox(height: 20),
          body,
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: context.width * .12,
            child: CustomButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text(
                textButton,
                style: Styles.textStyleXL(context, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
