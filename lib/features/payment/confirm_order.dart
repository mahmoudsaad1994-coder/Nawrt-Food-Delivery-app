import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../core/constants.dart';
import '../../core/utils/styles.dart';
import '../home/presentation/manager/cubit.dart';
import '../home/presentation/manager/states.dart';
import 'branch_pickup.dart';
import 'order_delivery.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) => DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
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
                    style: TextStyle(fontSize: context.width * .045),
                  ),
                ),
                Tab(
                  child: Text(
                    "استلام من الفرع",
                    style: TextStyle(fontSize: context.width * .045),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              OrderDelivery(cubit: MainCubit.get(context)),
              BranchPickup(cubit: MainCubit.get(context)),
            ],
          ),
        ),
      ),
    );
  }
}
