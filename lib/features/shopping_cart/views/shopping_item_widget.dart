import 'package:flutter/material.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../../core/constants.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/styles.dart';
import '../../home/presentation/manager/cubit.dart';

class ShoppingItemWidget extends StatelessWidget {
  const ShoppingItemWidget(
      {super.key, required this.item, required this.cubit});
  final Map<String, dynamic> item;
  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
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
        child:
            Icon(Icons.delete, color: Colors.white, size: context.width * .07),
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Card(
            margin: EdgeInsetsDirectional.only(start: context.width * .08),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5, // ارتفاع الظل
            shadowColor: Colors.grey.withOpacity(0.5), // لون الظل
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // زوايا منحنية للكارد
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
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["name"],
                        style: Styles.textStyleXXL(
                          context,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${item["price"]} جنيه",
                        style: Styles.textStyleXXL(context,
                            fontWeight: FontWeight.w700, color: kFFC436Color),
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
                            fontSize: context.width * .09,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          cubit.oddFoodItem(item["quantity"]);
                        },
                      ),
                      Text(
                        "${item["quantity"]}",
                        style: TextStyle(
                          fontSize: context.width * .07,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: context.width * .09,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          cubit.addFoodItem(item["quantity"]);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: context.width * .2,
            height: context.width * .2,
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
  }
}
