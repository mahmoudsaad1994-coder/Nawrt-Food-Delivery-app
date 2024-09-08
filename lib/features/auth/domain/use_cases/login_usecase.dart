import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/usecase.dart';
import '../entities/login_entity.dart';
import '../repos/auth_repo.dart';

class LoginUseCase extends UseCase<AuthEntity, LoginParams> {
  final AuthRepo repo;

  LoginUseCase(this.repo);

  @override
  Future<Either<Failure, AuthEntity>> call(LoginParams params) =>
      repo.login(params);
}
