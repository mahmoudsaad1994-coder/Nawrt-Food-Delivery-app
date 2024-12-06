import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../data/model/order_model.dart';

class CustomOrderItem extends StatelessWidget {
  const CustomOrderItem({
    super.key,
    required this.orderData,
  });
  final OrderModel orderData;
  Color checkOrderStatusMessage(int code) {
    if (code == 0) {
      return Colors.brown;
    } else if (code == 1) {
      return Colors.orange;
    } else if (code == 2) {
      return Colors.blue;
    } else if (code == 3) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * .04,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => OrderDetailsScreen(
              //       orderData: orderData,
              //     ),
              //   ),
              // );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    AssetsData.cat_1Image,
                    fit: BoxFit.fill,
                    width: screenSize.width * .15,
                    height: screenSize.width * .15,
                  ),
                ),
                SizedBox(
                  width: screenSize.width * .03,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nwart',
                      style: Styles.textStyleXXL(
                        context,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor,
                      ),
                    ),
                    Text(
                      orderData.orderStatusMessage,
                      style: Styles.textStyleXXL(
                        context,
                        color: checkOrderStatusMessage(orderData.orderStatusID),
                      ),
                    ),
                    Text(
                      orderData.orderedDate,
                      style: Styles.textStyleXXL(
                        context,
                      ),
                    ),
                    Text(
                      'Order ID: ${orderData.orderID}',
                      style: Styles.textStyleXXL(
                        context,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    SizedBox(
                      height: screenSize.height * .05,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: screenSize.width * .05,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height * .015,
          ),
          checkOrderStatusButton(orderData.orderStatusID, screenSize, context),
        ],
      ),
    );
  }

  Widget checkOrderStatusButton(
      int code, Size screenSize, BuildContext context) {
    if (code == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.close,
                color: kPrimaryColor,
                size: screenSize.width * .05,
              ),
              SizedBox(
                width: screenSize.width * .02,
              ),
              Text(
                'Cancel order',
                style: Styles.textStyleXXL(
                  context,
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ],
      );
    } else if (code == 1) {
      return const SizedBox();
    } else if (code == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                IconAssetsManager.deliveryIcon,
                color: kPrimaryColor,
                width: screenSize.width * .05,
              ),
              SizedBox(
                width: screenSize.width * .02,
              ),
              Text(
                'Tracking',
                style: Styles.textStyleXXL(
                  context,
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ],
      );
    } else if (code == 3) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Image.asset(
                  IconAssetsManager.reorderIcon,
                  color: kPrimaryColor,
                  width: screenSize.width * .05,
                ),
                SizedBox(
                  width: screenSize.width * .02,
                ),
                Text(
                  'Re-order',
                  style: Styles.textStyleXXL(
                    context,
                    fontWeight: FontWeight.w500,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: screenSize.width * .16,
          ),
          // InkWell(
          //   onTap: () {
          //     showModalBottomSheet(
          //       context: context,
          //       builder: (context) => RateOrderScreen(),
          //     );
          //   },
          //   child: Row(
          //     children: [
          //       Image.asset(
          //         IconAssetsManager.happyIcon,
          //         color: kPrimaryColor,
          //         width: screenSize.width * .05,
          //       ),
          //       SizedBox(
          //         width: screenSize.width * .02,
          //       ),
          //       Text(
          //         'Rate order',
          //         style: Styles.textStyleXXL(
          //           context,
          //           fontWeight: FontWeight.w500,
          //           color: kPrimaryColor,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                IconAssetsManager.reorderIcon,
                color: kPrimaryColor,
                width: screenSize.width * .05,
              ),
              SizedBox(
                width: screenSize.width * .02,
              ),
              Text(
                'Re-order',
                style: Styles.textStyleXXL(
                  context,
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}
