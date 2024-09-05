import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/get_it.dart';
import '../../../data/repos/auth_repo_imp.dart';
import '../../../domain/use_cases/register_usecase.dart';
import '../../manager/cubit.dart';
import 'widgets/register_infromations_view_widgets/register_infromations_view_bottom_item.dart';
import 'widgets/register_infromations_view_widgets/register_infromations_view_top_item.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AuthCubit(
              registerUseCase: RegisterUseCase(
            getIt.get<AuthRepoImp>(),
          )),
          child: const Column(
            children: [
              RegisterViewTopItem(),
              RegisterViewBottomItem(),
            ],
          ),
        ),
      ),
    );
  }
}
