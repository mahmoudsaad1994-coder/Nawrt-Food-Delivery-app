import 'package:go_router/go_router.dart';

import '../../features/auth/forget_password/views/forget_password_view.dart';
import '../../features/auth/login_register/pages/login/views/login_view.dart';
import '../../features/auth/login_register/pages/register/views/activate_code_view.dart';
import '../../features/auth/login_register/pages/register/views/register_infromations.dart';
import '../../features/auth/login_register/pages/register/views/register_view.dart';
import '../../features/auth/registration_page/presentation/view/registration_page_body_view.dart';
import '../../features/auth/splash/view/splash_view.dart';
import '../../features/layout/views/layout_view.dart';
import '../../features/search/views/search_view.dart';

abstract class AppRouter {
  static const String kRegistrationPage = '/registrationPage';
  static const String kRegisterScreen = '/register';
  static const String kLoginScreen = '/login';
  static const String kActivateCodeScreen = '/activateCode';
  static const String kRegisterInfromationScreen = '/registerInfromation';
  static const String kForgetPasswordScreen = '/forgetPasswordScreen';
  static const String kSearchView = '/SearchView';
  static const String kLayoutView = '/layoutView';

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
        path: kRegisterScreen,
        builder: (context, state) => const RegisterScreen(),
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
        path: kRegisterInfromationScreen,
        builder: (context, state) => const RegisterInfromationsScreen(),
      ),
      GoRoute(
        path: kForgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
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
