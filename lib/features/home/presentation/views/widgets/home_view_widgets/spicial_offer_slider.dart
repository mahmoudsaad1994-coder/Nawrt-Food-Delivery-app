import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../manager/cubit.dart';
import '../../../manager/states.dart';

class SpicialOfferSlider extends StatefulWidget {
  const SpicialOfferSlider({super.key});

  @override
  State<SpicialOfferSlider> createState() => _SpicialOfferSliderState();
}

class _SpicialOfferSliderState extends State<SpicialOfferSlider> {
  PageController controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    cubit.changeIndexSlider(index);
                  },
                  autoPlay: true,
                  height: screenSize.height * .22,
                  viewportFraction: .9,
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
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            image,
                            width: screenSize.width,
                            fit: BoxFit.fill,
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
                      width: cubit.selectedPageIndex == i
                          ? screenSize.width * .05
                          : screenSize.width * .025,
                      height: screenSize.width * .02,
                      decoration: BoxDecoration(
                        color: cubit.selectedPageIndex == i
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
        });
  }
}

List<String> bannersData = [
  AssetsData.banner1Image,
  AssetsData.banner2Image,
  AssetsData.banner3Image,
  AssetsData.banner4Image,
  AssetsData.banner5Image,
  AssetsData.banner6Image,
  AssetsData.banner7Image,
];
