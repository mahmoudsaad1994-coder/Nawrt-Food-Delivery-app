import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

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
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        fontFamily: kDINNextLTArabic,
      ),
    );
  }
}
