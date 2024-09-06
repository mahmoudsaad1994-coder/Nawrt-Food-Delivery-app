import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../domain/repos/auth_repo.dart';
import '../../domain/use_cases/login_usecase.dart';
import '../../domain/use_cases/register_usecase.dart';
import 'states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit({this.registerUseCase, this.loginUseCase})
      : super(InitialAuthStates());
  static AuthCubit get(context) => BlocProvider.of(context);

  //toggle passowrd
  bool isHidden = true;
  togglePassowrd() {
    isHidden = !isHidden;
    emit(TogglePasswordStates());
  }

  bool isHiddenConfirm = true;
  toggleConfirmPassowrd() {
    isHiddenConfirm = !isHiddenConfirm;
    emit(TogglePasswordStates());
  }

  bool isLoading = false;
  //logim
  final LoginUseCase? loginUseCase;
  Future<void> login({required LoginParams params}) async {
    isLoading = true;
    emit(LoadingAuthStates());
    final result = await loginUseCase!.call(params);

    result.fold(
      (failure) {
        if (failure is ServerFailure) {
          isLoading = false;
          emit(ErrorAuthStates(error: failure.message));
        }
      },
      (data) {
        isLoading = false;
        emit(SucsessAuthStates(data: data));
      },
    );
  }

  //register
  final RegisterUseCase? registerUseCase;
  Future<void> register({required RegisterParams params}) async {
    isLoading = true;
    emit(LoadingAuthStates());
    try {
      final result = await registerUseCase!.call(params);

      result.fold(
        (failure) {
          if (failure is ServerFailure) {
            isLoading = false;
            if (failure.messageMapFailure == null) {
              emit(ErrorAuthStates(error: failure.message));
            }
            emit(ErrorAuthStates(messageMap: failure.messageMapFailure));
          }
        },
        (data) {
          isLoading = false;
          emit(SucsessAuthStates(data: data));
        },
      );
    } catch (e) {
      isLoading = false;
      emit(ErrorAuthStates(error: e.toString()));
    }
  }

  //activate code
  String email = '';
  getEmail(String mail) {
    email = mail;
    emit(GetEmailStates());
  }

  int totalTimeInSeconds = 3 * 60;
  changeTimeCounter() {
    totalTimeInSeconds--;
    emit(ChangeTimeStates());
  }
}
