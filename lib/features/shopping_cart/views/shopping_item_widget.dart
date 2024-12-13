import 'package:flutter/material.dart';
import 'package:nawrt/core/utils/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/styles.dart';
import '../../home/presentation/manager/cubit.dart';
import '../../home/presentation/manager/states.dart';

class ShoppingItemWidget extends StatelessWidget {
  const ShoppingItemWidget({super.key, required this.item});
  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Dismissible(
            key: Key(item["name"] + cubit.cartItems.indexOf(item).toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              cubit.cartItems.remove(item);
            },
            background: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(20),
              child: Icon(Icons.delete,
                  color: Colors.white, size: context.width * .07),
            ),
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Card(
                  margin:
                      EdgeInsetsDirectional.only(start: context.width * .08),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 6, // ارتفاع الظل
                  shadowColor: Colors.grey.withOpacity(0.5), // لون الظل
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // زوايا منحنية للكارد
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsetsDirectional.only(
                        top: 16.0,
                        bottom: 16.0,
                        end: 16.0,
                        start: context.width * .15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["name"],
                              style: Styles.textStyleXL(
                                context,
                                color: kBlackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${item["price"]} جنيه",
                              style: Styles.textStyleXL(context,
                                  fontWeight: FontWeight.w700,
                                  color: kFFC436Color),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              child: Text(
                                '-',
                                style: TextStyle(
                                  fontSize: context.width * .06,
                                  color: Colors.black87,
                                ),
                              ),
                              onPressed: () {
                                cubit
                                    .oddFoodItem(cubit.cartItems.indexOf(item));
                              },
                            ),
                            Text(
                              "${item["quantity"]}",
                              style: TextStyle(
                                fontSize: context.width * .06,
                                color: Colors.black,
                              ),
                            ),
                            TextButton(
                              child: Text(
                                '+',
                                style: TextStyle(
                                  fontSize: context.width * .06,
                                  color: Colors.black87,
                                ),
                              ),
                              onPressed: () {
                                cubit
                                    .addFoodItem(cubit.cartItems.indexOf(item));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: context.width * .18,
                  height: context.width * .18,
                  margin: const EdgeInsetsDirectional.only(start: 10),
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.transparent,
                    shadows: [
                      BoxShadow(
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: const DecoratedBox(
                    decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AssetsData.cat_1Image))),
                  ),
                )
              ],
            ),
          );
        });
  }
}
