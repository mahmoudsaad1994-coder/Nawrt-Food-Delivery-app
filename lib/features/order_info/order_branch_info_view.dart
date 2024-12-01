import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../core/constants.dart';
import '../../core/utils/styles.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custtom_sliver_app_bar.dart';
import '../home/presentation/manager/cubit.dart';
import '../home/presentation/manager/states.dart';

class OrderBranchInfoView extends StatelessWidget {
  const OrderBranchInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    Icon getStatusIcon(OrderStatus status) {
      switch (status) {
        case OrderStatus.done:
          return Icon(
            Icons.check_circle,
            color: kFFC436Color,
            size: context.width * .12,
          );
        case OrderStatus.inProcess:
          return Icon(
            Icons.check_circle_outline_outlined,
            color: kFFC436Color,
            size: context.width * .12,
          );
        case OrderStatus.pending:
          return Icon(
            Icons.propane,
            color: Colors.grey,
            size: context.width * .12,
          );
      }
    }

    return Scaffold(
      body: BlocConsumer<MainCubit, MainStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = MainCubit.get(context);
            return CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                const CustomSliverAppBar(
                  inLayout: false,
                  title: 'معلومات الطلب',
                  isPinned: true,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: context.width * .08,
                      top: context.width * .06,
                      end: context.width * .06,
                    ),
                    child: Text(
                      'طلب رقم #25',
                      style: Styles.textStyleXXL(context,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * .06),
                    child: Column(
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cubit.orderBranchSteps.length,
                            itemBuilder: (context, index) {
                              final step = cubit.orderBranchSteps[index];
                              OrderStatus orderStatus = step['orderStatus'];
                              final bool isLast =
                                  index == cubit.orderBranchSteps.length - 1;
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      //icon
                                      getStatusIcon(orderStatus),
                                      //line
                                      if (!isLast)
                                        Container(
                                          width: 2,
                                          height: context.height * .05,
                                          color: orderStatus == OrderStatus.done
                                              ? kFFC436Color
                                              : Colors.grey,
                                        ),
                                    ],
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              step['title'] as String,
                                              style: TextStyle(
                                                fontSize: context.width * .04,
                                                fontWeight: FontWeight.bold,
                                                color: orderStatus ==
                                                        OrderStatus.pending
                                                    ? Colors.grey
                                                    : Colors.black,
                                              ),
                                            ),
                                            Text(
                                              step['time'] as String,
                                              style: TextStyle(
                                                fontSize: context.width * .032,
                                                color: orderStatus ==
                                                        OrderStatus.pending
                                                    ? kBlackColor
                                                        .withOpacity(.5)
                                                    : kBlackColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          step['description'] as String,
                                          style: TextStyle(
                                            fontSize: context.width * .032,
                                            color: orderStatus ==
                                                    OrderStatus.pending
                                                ? k96908AColor.withOpacity(.5)
                                                : k96908AColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (cubit.orderBranchSteps.last['orderStatus'] ==
                            OrderStatus.done)
                          SizedBox(
                            width: double.infinity,
                            height: context.width * .12,
                            child: CustomButton(
                              onPressed: () {},
                              child: Text(
                                'تم استلام الطلب',
                                style: Styles.textStyleXL(context,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
