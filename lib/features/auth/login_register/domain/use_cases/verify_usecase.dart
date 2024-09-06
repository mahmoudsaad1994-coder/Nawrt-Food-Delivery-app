import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/usecase.dart';
import '../entities/login_entity.dart';
import '../repos/auth_repo.dart';

class VerifyUsecase extends UseCase<AuthEntity, VerifyParams> {
  final AuthRepo repo;

  VerifyUsecase(this.repo);

  @override
  Future<Either<Failure, AuthEntity>> call(VerifyParams params) =>
      repo.verify(params);
}
/*
{
    "status": "error",
    "message": "هذا الحساب غير موجود!"
}


{
    "status": "success",
    "message": "تم التفعيل بنجاح",
    "data": []
}
  */