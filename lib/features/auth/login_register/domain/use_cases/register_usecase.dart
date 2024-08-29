import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/usecase.dart';
import '../entities/login_entity.dart';
import '../repos/auth_repo.dart';

class RegisterUseCase extends UseCase<AuthEntity, RegisterParams> {
  final AuthRepo repo;

  RegisterUseCase(this.repo);

  @override
  Future<Either<Failure, AuthEntity>> call(RegisterParams params) =>
      repo.register(params);
}
