import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_card_offer.dart';

class SpicialOfferSlider extends StatefulWidget {
  const SpicialOfferSlider({super.key});

  @override
  State<SpicialOfferSlider> createState() => _SpicialOfferSliderState();
}

class _SpicialOfferSliderState extends State<SpicialOfferSlider> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .24,
          width: double.infinity,
          child: PageView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            reverse: true,
            allowImplicitScrolling: true,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .02),
              child: const CustomCardOffer(
                image: AssetsData.testbrgrImage1,
                title: 'احصل على شحن مجاني عند طلب برجر اليوم',
                price: 200,
              ),
            ),
            itemCount: 5,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.width * .02),
        SmoothPageIndicator(
          controller: controller,
          axisDirection: Axis.horizontal,
          textDirection: TextDirection.rtl,
          count: 5,
          effect: ExpandingDotsEffect(
            dotHeight: MediaQuery.of(context).size.width * .02,
            dotWidth: MediaQuery.of(context).size.width * .02,
            activeDotColor: kFFC436Color,
          ),
        ),
      ],
    );
  }
}
