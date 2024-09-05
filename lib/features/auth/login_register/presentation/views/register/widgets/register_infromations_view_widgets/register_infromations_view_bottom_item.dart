import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../core/utils/app_router.dart';
import '../../../../../../../../core/utils/build_error_widget.dart';
import '../../../../manager/cubit.dart';
import '../../../../manager/states.dart';
import 'register_form.dart';

class RegisterViewBottomItem extends StatelessWidget {
  const RegisterViewBottomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constrain) {
          return BlocConsumer<AuthCubit, AuthStates>(
              listener: (context, state) {
            if (state is SucsessAuthStates) {
              ScaffoldMessenger.of(context).showSnackBar(
                buildErrorWidget(state.data.logiMessage.toString()),
              );

              GoRouter.of(context)
                  .pushReplacement(AppRouter.kActivateCodeScreen);
            }
            if (state is ErrorAuthStates) {
              if (state.error != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  buildErrorWidget(state.error.toString()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  buildErrorMapWidget(state.messageMap!),
                );
              }
            }
          }, builder: (context, state) {
            return RegisterForm(
              constrain: constrain,
              cubit: AuthCubit.get(context),
            );
          });
        },
      ),
    );
  }
}
