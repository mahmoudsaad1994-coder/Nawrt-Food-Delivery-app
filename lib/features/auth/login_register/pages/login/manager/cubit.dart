import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/error/failure.dart';
import '../../../domain/repos/auth_repo.dart';
import '../../../domain/use_cases/login_usecase.dart';
import 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginUseCase) : super(InitialLoginStates());
  static LoginCubit get(context) => BlocProvider.of(context);

  bool isHidden = true;
  togglePassowrd() {
    isHidden = !isHidden;
    emit(TogglePasswordStates());
  }

  final LoginUseCase loginUseCase;
  bool isLoading = false;
  Future<void> login({required LoginParams params}) async {
    isLoading = true;
    emit(LoadingLoginStates());
    final result = await loginUseCase.call(params);

    result.fold(
      (failure) {
        if (failure is ServerFailure) {
          isLoading = false;
          emit(ErrorLoginStates(error: failure.message));
        }
      },
      (data) {
        isLoading = false;
        emit(SucsessLoginStates(data: data));
      },
    );
  }
}
