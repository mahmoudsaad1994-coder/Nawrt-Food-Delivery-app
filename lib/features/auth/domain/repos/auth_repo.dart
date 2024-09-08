import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/login_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthEntity>> login(LoginParams loginParams);
  Future<Either<Failure, AuthEntity>> register(RegisterParams registerParams);
  Future<Either<Failure, AuthEntity>> verify(VerifyParams verifyParams);
  Future<Either<Failure, AuthEntity>> reSendOtp(String email);
}

class VerifyParams {
  final String email, code;
  VerifyParams({
    required this.email,
    required this.code,
  });

  factory VerifyParams.fromJson(Map<String, dynamic> json) => VerifyParams(
        email: json['email'] as String,
        code: json['code'] as String,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'code': code,
      };
}

class LoginParams {
  final String email, password;
  LoginParams({
    required this.email,
    required this.password,
  });

  factory LoginParams.fromJson(Map<String, dynamic> json) => LoginParams(
        email: json['email'] as String,
        password: json['password'] as String,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

class RegisterParams {
  final String email, password, name, phone;
  RegisterParams({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });

  factory RegisterParams.fromJson(Map<String, dynamic> json) => RegisterParams(
        email: json['email'] as String,
        password: json['password'] as String,
        name: json['name'] as String,
        phone: json['phone'] as String,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'phone': phone,
        'name': name,
      };
}
