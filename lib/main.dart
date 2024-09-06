import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/get_it.dart';
import 'features/auth/login_register/data/repos/auth_repo_imp.dart';
import 'features/auth/login_register/domain/entities/login_entity.dart';
import 'features/auth/login_register/domain/use_cases/login_usecase.dart';
import 'features/auth/login_register/domain/use_cases/register_usecase.dart';
import 'features/auth/login_register/presentation/manager/cubit.dart';

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
              )),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
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
