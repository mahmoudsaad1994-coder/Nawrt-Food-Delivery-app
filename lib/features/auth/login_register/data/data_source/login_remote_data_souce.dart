import '../../../../../core/api/url_api_list.dart';
import '../../../../../core/api/api_service.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../model/login_model.dart';
import '../model/register_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthEntity> login(LoginParams loginParams);
  Future<AuthEntity> register(RegisterParams registerParams);
  Future<AuthEntity> verify(VerifyParams verifyParams);
  Future<AuthEntity> reSendOtp(String email);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDatasourceImpl(this.apiService);

  @override
  Future<AuthEntity> login(LoginParams loginParams) async {
    final data = await apiService.postRequest(
      UrlApiList.login,
      data: loginParams.toJson(),
    );
    AuthEntity newData = LoginModel.fromJson(data);

    return newData;
  }

  @override
  Future<AuthEntity> register(RegisterParams registerParams) async {
    final data = await apiService.postRequest(
      UrlApiList.register,
      data: registerParams.toJson(),
    );
    AuthEntity newData = RegisterModel.fromJson(data);
    return newData;
  }

  @override
  Future<AuthEntity> reSendOtp(String email) async {
    final data = await apiService.postRequest(
      UrlApiList.reSendOtp,
      data: {'email': email},
    );
    AuthEntity newData = RegisterModel.fromJson(data);
    return newData;
  }

  @override
  Future<AuthEntity> verify(VerifyParams verifyParams) async {
    final data = await apiService.postRequest(
      UrlApiList.verify,
      data: verifyParams.toJson(),
    );
    AuthEntity newData = RegisterModel.fromJson(data);
    return newData;
  }
}
