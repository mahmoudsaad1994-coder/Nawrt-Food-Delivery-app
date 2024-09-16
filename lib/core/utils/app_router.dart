import 'package:go_router/go_router.dart';

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
import '../../features/home/domain/entities/food_entity.dart';
import '../../features/home/presentation/views/widgets/home_view_widgets/best_seller_view.dart';
import '../../features/home/presentation/views/widgets/home_view_widgets/spicial_offers_view.dart';
import '../../features/splash/view/splash_view.dart';
import '../../features/layout/views/layout_view.dart';
import '../../features/search/views/search_view.dart';

abstract class AppRouter {
  static const String kRegistrationPage = '/registrationPage';
  static const String kRegisterScreen = '/register';
  static const String kLoginScreen = '/login';
  static const String kActivateCodeScreen = '/activateCode';
  static const String kForgetPasswordScreen = '/forgetPasswordScreen';
  static const String kSearchView = '/SearchView';
  static const String kLayoutView = '/layoutView';
  static const String kResetNewPasswordScreen = '/resetNewPasswordScreen';
  static const String kFoodsView = '/foodsView';
  static const String kBestSellerView = '/bestSellerView';
  static const String kFoodDetailsView = '/foodDetailsView';
  static const String kSpicialOffersView = '/kSpicialOffersView';
  static const String kResetNewPasswordDoneScreen =
      '/resetNewPasswordDoneScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LayoutView(),
      ),
      GoRoute(
        path: kRegistrationPage,
        builder: (context, state) => const RegistrationPage(),
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
        builder: (context, state) =>
            FoodDetailsView(food: state.extra as FoodEntity),
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
        builder: (context, state) => const LayoutView(),
      ),
    ],
  );
}
