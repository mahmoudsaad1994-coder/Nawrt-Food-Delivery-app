import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../../../../../core/constants.dart';
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
                  height: context.height * .22,
                  viewportFraction: 1,
                ),
                items: bannersData.map((image) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      image,
                      width: context.width * .85,
                      fit: BoxFit.fill,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: context.height * .01,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
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
                          horizontal: context.width * .01,
                        ),
                        width: cubit.selectedPageIndex == i
                            ? context.width * .04
                            : context.width * .02,
                        height: context.width * .02,
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
              ),
            ],
          );
        });
  }
}

List<String> bannersData = [
  AssetsData.banner2Image,
  AssetsData.banner3Image,
  AssetsData.banner4Image,
  AssetsData.banner1Image,
  AssetsData.banner5Image,
  AssetsData.banner6Image,
  AssetsData.banner7Image,
];
