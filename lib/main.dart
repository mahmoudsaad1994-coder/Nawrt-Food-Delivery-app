import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utils/bloc_observer.dart';
import 'core/utils/get_it.dart';
import 'features/auth/domain/entities/login_entity.dart';
import 'nawrt.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(AuthEntityAdapter());

  setupServiceLocator();

  runApp(Nawrt());
}
