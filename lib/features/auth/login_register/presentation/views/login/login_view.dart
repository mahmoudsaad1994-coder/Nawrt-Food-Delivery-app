import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/get_it.dart';
import '../../../data/repos/login_repo_imp.dart';
import '../../../domain/use_cases/login_usecase.dart';
import '../../manager/cubit.dart';
import 'widgets/login_widgets/login_view_bottom_item.dart';
import 'widgets/login_widgets/login_view_top_item.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AuthCubit(LoginUseCase(
            getIt.get<AuthRepoImp>(),
          )),
          child: const Column(
            children: [
              LoginViewTopItem(),
              LoginViewBottomItem(),
            ],
          ),
        ),
      ),
    );
  }
}
