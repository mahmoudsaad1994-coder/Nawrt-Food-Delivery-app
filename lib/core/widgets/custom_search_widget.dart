import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../constants.dart';
import '../utils/app_router.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSearchView);
      },
      child: Card(
        elevation: 2,
        color: k0xfff4f3f1Color,
        margin: EdgeInsets.symmetric(horizontal: context.width * .06),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: k0xff867e7eColor),
              const SizedBox(width: 10),
              Text(
                'بحث',
                style: TextStyle(
                  color: k0xff867e7eColor,
                  fontSize: context.width * .035,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.tune,
                color: k0xff867e7eColor,
                size: context.width * .06,
              )
            ],
          ),
        ),
      ),
    );
  }
}
