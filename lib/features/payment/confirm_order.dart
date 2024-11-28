import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../core/constants.dart';
import '../../core/utils/styles.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // عدد التبويبات
      child: Scaffold(
        appBar: AppBar(
          title: Text("الدفع",
              style: Styles.titleLayout(context, color: kBlackColor)),
          centerTitle: true,
          leadingWidth: context.width * .2,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          bottom: TabBar(
            indicatorColor: kFFC436Color,
            indicatorWeight: 2.0,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                child: Text(
                  "توصيل الطلب",
                  style: TextStyle(fontSize: context.width * .05),
                ),
              ),
              Tab(
                child: Text(
                  "استلام من الفرع",
                  style: TextStyle(fontSize: context.width * .05),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("محتوى توصيل الطلب"),
            ),
            Center(
              child: Text("محتوى استلام من الفرع"),
            ),
          ],
        ),
      ),
    );
  }
}
