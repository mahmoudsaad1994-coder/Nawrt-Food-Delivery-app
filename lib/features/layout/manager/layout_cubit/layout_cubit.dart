import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../food_categorys/views/food_categorys_view.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../../account/presentation/views/account_view.dart';
import '../../../shopping_cart/views/shopping_cart_view.dart';
import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialStates());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  changeBottomNaviIndex(index) {
    currentIndex = index;
    emit(ChangeedBottomNavigationBarLayoutStates());
  }

  final List screens = [
    const HomeView(),
    const FoodCategorysView(),
    const ShoppingCartView(),
    const AccountView(),
  ];

  final List<CustomBottomBarItems> bottomTabs = [
    CustomBottomBarItems(
      icon: Icons.home_outlined,
      label: 'الرئيسية',
      isAssetsImage: false,
    ),
    CustomBottomBarItems(
      icon: Icons.summarize_outlined,
      label: 'قائمة الطعام',
      isAssetsImage: false,
    ),
    CustomBottomBarItems(
      icon: Icons.shopping_cart_outlined,
      label: 'عربة التسوق',
      isAssetsImage: false,
    ),
    CustomBottomBarItems(
      icon: Icons.person_outline,
      label: 'حسابي',
      isAssetsImage: false,
    ),
  ];
}
