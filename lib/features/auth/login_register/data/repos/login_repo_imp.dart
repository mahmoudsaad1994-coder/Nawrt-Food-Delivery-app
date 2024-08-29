import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/failure.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../data_source/login_remote_data_souce.dart';

class AuthRepoImp extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImp({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, AuthEntity>> login(LoginParams loginParams) async {
    try {
      final data = await authRemoteDataSource.login(loginParams);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> register(
      RegisterParams registerParams) async {
    try {
      final data = await authRemoteDataSource.register(registerParams);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
