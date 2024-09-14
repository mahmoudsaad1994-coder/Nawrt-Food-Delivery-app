import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/styles.dart';
import '../../core/widgets/custom_button.dart';
import 'views/widgets/food_additions_widget.dart';
import 'views/widgets/food_weight_widget.dart';

class FoodDetailsView extends StatelessWidget {
  const FoodDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              AssetsData.imgInfo,
              height: size.height * .4,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .1, vertical: size.width * .07),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: size.width * .07,
                    child: Icon(
                      Icons.favorite_border_outlined,
                      size: size.width * .07,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                height: size.height * .54,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(size.width * .07),
                      topRight: Radius.circular(size.width * .07),
                    )),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .06, vertical: size.width * .02),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'تشيز برجر لحم',
                          style: Styles.textStyleXXL(context,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '150 جنيه',
                          style: Styles.textStyleXXL(context,
                              fontWeight: FontWeight.w700, color: kFFC436Color),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.width * .02),
                      child: Text(
                        'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
                        style: Styles.textStyleL(context,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Text(
                      'الحجم',
                      style: Styles.textStyleXXL(context,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: size.height * .013, top: size.height * .005),
                      child: SizedBox(
                        height: size.height * .06,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // separatorBuilder: (context, index) => ,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: size.width * .06),
                            child: foodWeightList[index],
                          ),
                          itemCount: foodWeightList.length,
                        ),
                      ),
                    ),
                    Text(
                      'الإضافات',
                      style: Styles.textStyleXXL(context,
                          fontWeight: FontWeight.w700),
                    ),
                    ...foodAdditionsWidgetList,
                    SizedBox(height: size.height * .02),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * .03),
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                          color: k0xff867e7eColor,
                        )),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.remove,
                                  size: size.width * .05,
                                ),
                              ),
                              SizedBox(width: size.width * .01),
                              Text(
                                '1',
                                style: Styles.textStyleXXL(
                                  context,
                                ),
                              ),
                              SizedBox(width: size.width * .01),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  size: size.width * .05,
                                ),
                              ),
                              SizedBox(width: size.width * .03),
                              CustomButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      'إضافة إلى عربة التسوق',
                                      style: Styles.textStyleXL(context,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: size.width * .04),
                                    Text(
                                      '150 جنيه',
                                      style: Styles.textStyleXXL(context,
                                          color: kFFC436Color),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<FoodWeightButton> foodWeightList = [
  const FoodWeightButton(foodWeight: '150 جرام'),
  const FoodWeightButton(foodWeight: '200 جرام'),
  const FoodWeightButton(foodWeight: '250 جرام'),
  const FoodWeightButton(foodWeight: '300 جرام'),
];

List<FoodAdditionsWidget> foodAdditionsWidgetList = [
  const FoodAdditionsWidget(
      nameFoodAdditions: 'إضافة خس', priceFoodAdditions: 20),
  const FoodAdditionsWidget(
      nameFoodAdditions: 'إضافة جزر', priceFoodAdditions: 10),
  const FoodAdditionsWidget(
      nameFoodAdditions: 'إضافة خيار', priceFoodAdditions: 15),
];
