import 'package:go_router/go_router.dart';

import '../../features/auth/login/views/login_view.dart';
import '../../features/auth/forget_password/views/forget_password_view.dart';
import '../../features/auth/register/views/activate_code_view.dart';
import '../../features/auth/register/views/register_infromations.dart';
import '../../features/auth/register/views/register_view.dart';
import '../../features/auth/splash/view/splash_screen_body_view.dart';
import '../../features/auth/splash/view/splash_view.dart';

abstract class AppRouter {
  static const String kSplashScreen = '/splashView';
  static const String kRegisterScreen = '/register';
  static const String kLoginScreen = '/login';
  static const String kActivateCodeScreen = '/activateCode';
  static const String kRegisterInfromationScreen = '/registerInfromation';
  static const String kForgetPasswordScreen = '/forgetPasswordScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSplashScreen,
        builder: (context, state) => const SplashScreen(),
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
    ],
  );
}
