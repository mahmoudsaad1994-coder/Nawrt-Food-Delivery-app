import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../manager/layout_cubit/layout_cubit.dart';
import '../manager/layout_cubit/layout_states.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            bottomNavigationBar: CustomLineIndicatorBottomNavbar(
              selectedColor: kPrimaryColor,
              unSelectedColor: k96908AColor,
              backgroundColor: Colors.white,
              unselectedIconSize: width * .06,
              selectedIconSize: width * .07,
              selectedFontSize: width * .035,
              unselectedFontSize: width * .032,
              enableLineIndicator: true,
              lineIndicatorWidth: 3,
              indicatorType: IndicatorType.top,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNaviIndex(index);
              },
              customBottomBarItems: cubit.bottomTabs,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
