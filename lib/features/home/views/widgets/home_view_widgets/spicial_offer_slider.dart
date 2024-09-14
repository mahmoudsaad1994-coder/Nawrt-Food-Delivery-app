import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class SpicialOfferSlider extends StatefulWidget {
  const SpicialOfferSlider({super.key});

  @override
  State<SpicialOfferSlider> createState() => _SpicialOfferSliderState();
}

class _SpicialOfferSliderState extends State<SpicialOfferSlider> {
  PageController controller = PageController();
  int selectedPageIndex = 0;

  List<String> bannersData = [
    'assets/images/offer_food.PNG',
    'assets/images/offer_food.PNG',
    'assets/images/offer_food.PNG',
    'assets/images/offer_food.PNG',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                selectedPageIndex = index;
              });
            },
            autoPlay: true,
            height: screenSize.height * .22,
            viewportFraction: 1,
          ),
          items: bannersData.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * .04,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image,
                      width: screenSize.width,
                      fit: BoxFit.fill,
                      height: screenSize.height * .22,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: screenSize.height * .01,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              bannersData.length,
              (i) => AnimatedContainer(
                duration: const Duration(
                  milliseconds: 350,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: screenSize.width * .01,
                ),
                width: selectedPageIndex == i
                    ? screenSize.width * .05
                    : screenSize.width * .025,
                height: screenSize.width * .02,
                decoration: BoxDecoration(
                  color: selectedPageIndex == i
                      ? kFFC436Color
                      : Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(
                    180,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
