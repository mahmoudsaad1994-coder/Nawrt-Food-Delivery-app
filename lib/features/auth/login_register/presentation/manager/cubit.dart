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

  bool isHidden = true;
  bool isHiddenConfirm = true;

  togglePassowrd() {
    isHidden = !isHidden;
    emit(TogglePasswordStates());
  }

  toggleConfirmPassowrd() {
    isHiddenConfirm = !isHiddenConfirm;
    emit(TogglePasswordStates());
  }

  bool isLoading = false;
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

  String email = '';
  getEmail(String mail) {
    email = mail;
    emit(GetEmailStates());
  }
}
