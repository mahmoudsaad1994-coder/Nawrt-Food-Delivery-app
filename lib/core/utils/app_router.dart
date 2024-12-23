import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/account/presentation/views/about_us.dart';
import '../../features/account/presentation/views/help_view.dart';
import '../../features/account/presentation/views/offers_view.dart';
import '../../features/account/presentation/views/orders_view.dart';
import '../../features/account/presentation/views/payments.dart';
import '../../features/account/presentation/views/settings_dart.dart';
import '../../features/auth/presentation/views/forget_password/forget_password_view.dart';
import '../../features/auth/presentation/views/forget_password/reset_new_password.view.dart';
import '../../features/auth/presentation/views/forget_password/reset_new_password_done.dart';
import '../../features/auth/presentation/views/login/login_view.dart';
import '../../features/auth/presentation/views/widgets/activate_code_view_widgets/activate_code_view.dart';
import '../../features/auth/presentation/views/register/register_view.dart';
import '../../features/auth/presentation/views/registration_page/registration_page_body_view.dart';
import '../../features/food_categorys/views/food_details_view.dart';
import '../../features/food_categorys/views/foods_items_view.dart';
import '../../features/home/domain/entities/categoray.dart';
import '../../features/home/presentation/views/widgets/home_view_widgets/best_seller_view.dart';
import '../../features/home/presentation/views/widgets/home_view_widgets/spicial_offers_view.dart';
import '../../features/map/my_address.dart';
import '../../features/map/order_tracking.dart';
import '../../features/order_info/order_branch_info_view.dart';
import '../../features/order_info/order_delivery_info_view.dart';
import '../../features/payment/confirm_order.dart';
import '../../features/search/views/search_filter_view.dart';
import '../../features/shopping_cart/views/shopping_cart_view_outside.dart';
import '../../features/splash/view/splash_view.dart';
import '../../features/layout/views/layout_view.dart';
import '../../features/search/views/search_view.dart';
import '../widgets/exit_app_dialog.dart';

abstract class AppRouter {
  static const String kRegistrationPage = '/registrationPage';
  static const String kRegisterScreen = '/register';
  static const String kLoginScreen = '/login';
  static const String kActivateCodeScreen = '/activateCode';
  static const String kForgetPasswordScreen = '/forgetPasswordScreen';
  static const String kSearchView = '/SearchView';
  static const String kLayoutView = '/layoutView';
  static const String kSearchFilterView = '/SearchFilterView';
  static const String kResetNewPasswordScreen = '/resetNewPasswordScreen';
  static const String kFoodsView = '/foodsView';
  static const String kBestSellerView = '/bestSellerView';
  static const String kFoodDetailsView = '/foodDetailsView';
  static const String kSpicialOffersView = '/SpicialOffersView';
  static const String kOrderDeliveryInfoView = '/OrderInfoView';
  static const String kOrderBranchInfoView = '/OrderBranchInfoView';
  static const String kOrderTracking = '/OrderTracking';
  static const String kShoppingCartViewOutside = '/ShoppingCartViewOutside';
  static const String kConfirmOrder = '/ConfirmOrder';
  static const String kOfferScreen = '/OfferScreen';
  static const String kOrdersScreen = '/OrdersScreen';
  static const String kSettingsView = '/SettingsView';
  static const String kPaymentsView = '/PaymentsView';
  static const String kHelpView = '/HelpView';
  static const String kAboutUs = '/AboutUs';
  static const String kMyLocationWithMap = '/MyLocationWithMap';
  static const String kResetNewPasswordDoneScreen =
      '/resetNewPasswordDoneScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kRegistrationPage,
        builder: (context, state) => const RegistrationPage(),
      ),
      GoRoute(
        path: kSettingsView,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: kMyLocationWithMap,
        builder: (context, state) => const MyLocationWithMap(),
      ),
      GoRoute(
        path: kPaymentsView,
        builder: (context, state) => const PaymentsView(),
      ),
      GoRoute(
        path: kHelpView,
        builder: (context, state) => const HelpView(),
      ),
      GoRoute(
        path: kAboutUs,
        builder: (context, state) => const AboutUs(),
      ),
      GoRoute(
        path: kOfferScreen,
        builder: (context, state) => const OfferScreen(),
      ),
      GoRoute(
        path: kOrdersScreen,
        builder: (context, state) => const OrdersScreen(),
      ),
      GoRoute(
        path: kSearchFilterView,
        builder: (context, state) => const SearchFilterView(),
      ),
      GoRoute(
        path: kOrderTracking,
        builder: (context, state) => const OrderTracking(),
      ),
      GoRoute(
        path: kOrderBranchInfoView,
        builder: (context, state) => const OrderBranchInfoView(),
      ),
      GoRoute(
        path: kOrderDeliveryInfoView,
        builder: (context, state) => const OrderDeliveryInfoView(),
      ),
      GoRoute(
        path: kConfirmOrder,
        builder: (context, state) => const ConfirmOrder(),
      ),
      GoRoute(
        path: kShoppingCartViewOutside,
        builder: (context, state) => const ShoppingCartViewOutside(),
      ),
      GoRoute(
        path: kBestSellerView,
        builder: (context, state) => const BestSellerView(),
      ),
      GoRoute(
        path: kSpicialOffersView,
        builder: (context, state) => const SpicialOffersView(),
      ),
      GoRoute(
        path: kFoodsView,
        builder: (context, state) =>
            FoodsView(categoryItem: state.extra as CategoriesEntity),
      ),
      GoRoute(
        path: kFoodDetailsView,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final food = extra['food'];
          final isOffer = extra['isOffer'];
          return FoodDetailsView(
            food: food,
            isOffer: isOffer,
          );
        },
      ),
      GoRoute(
        path: kRegisterScreen,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: kActivateCodeScreen,
        builder: (context, state) => const ActivateCode(),
      ),
      GoRoute(
        path: kForgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: kResetNewPasswordScreen,
        builder: (context, state) => const ResetNewPasswordScreen(),
      ),
      GoRoute(
        path: kResetNewPasswordDoneScreen,
        builder: (context, state) => const ResetNewPasswordDoneScreen(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kLayoutView,
        onExit: onExit,
        builder: (context, state) => const LayoutView(),
      ),
    ],
  );
}
