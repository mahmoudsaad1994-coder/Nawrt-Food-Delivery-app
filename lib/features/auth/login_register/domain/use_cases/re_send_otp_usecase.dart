import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/usecase.dart';
import '../entities/login_entity.dart';
import '../repos/auth_repo.dart';

class ReSendOtpUsecase extends UseCase<AuthEntity, String> {
  final AuthRepo repo;

  ReSendOtpUsecase(this.repo);

  @override
  Future<Either<Failure, AuthEntity>> call(String params) =>
      repo.reSendOtp(params);
}
/*
{
    "status": "error",
    "message": null
} 


{
    "status": "success",
    "message": "تم ارسال الكود للبريد",
    "data": {
        "body": 700325,
        "email": "mahmodsaad22@gmail.com"
    }
}



  */