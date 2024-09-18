import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nawrt/features/auth/domain/use_cases/re_send_otp_usecase.dart';
import 'package:nawrt/features/auth/domain/use_cases/verify_usecase.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/get_it.dart';
import 'features/auth/data/repos/auth_repo_imp.dart';
import 'features/auth/domain/entities/login_entity.dart';
import 'features/auth/domain/use_cases/login_usecase.dart';
import 'features/auth/domain/use_cases/register_usecase.dart';
import 'features/auth/presentation/manager/cubit.dart';
import 'features/home/presentation/manager/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(AuthEntityAdapter());

  setupServiceLocator();

  runApp(
    DevicePreview(
      builder: (context) => const Nawrt(),
    ),
  );
}

class Nawrt extends StatelessWidget {
  const Nawrt({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            loginUseCase: LoginUseCase(
              getIt.get<AuthRepoImp>(),
            ),
            registerUseCase: RegisterUseCase(
              getIt.get<AuthRepoImp>(),
            ),
            reSendOtpUsecase: ReSendOtpUsecase(
              getIt.get<AuthRepoImp>(),
            ),
            verifyUsecase: VerifyUsecase(
              getIt.get<AuthRepoImp>(),
            ),
          ),
        ),
        BlocProvider(create: (context) => MainCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child!,
          );
        },
        theme: ThemeData(
          fontFamily: kDINNextLTArabic,
        ),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar", "EG"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
      ),
    );
  }
}
