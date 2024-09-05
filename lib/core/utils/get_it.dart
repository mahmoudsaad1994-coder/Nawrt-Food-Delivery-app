import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login_register/data/data_source/login_remote_data_souce.dart';
import '../../features/auth/login_register/data/repos/auth_repo_imp.dart';
import '../api/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<AuthRepoImp>(
    AuthRepoImp(
      authRemoteDataSource: AuthRemoteDatasourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
