import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../domain/repos/auth_repo.dart';
import '../../domain/use_cases/login_usecase.dart';
import 'states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.loginUseCase) : super(InitialAuthStates());
  static AuthCubit get(context) => BlocProvider.of(context);

  bool isHidden = true;
  togglePassowrd() {
    isHidden = !isHidden;
    emit(TogglePasswordStates());
  }

  final LoginUseCase loginUseCase;
  bool isLoading = false;
  Future<void> login({required LoginParams params}) async {
    isLoading = true;
    emit(LoadingAuthStates());
    final result = await loginUseCase.call(params);

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
}
