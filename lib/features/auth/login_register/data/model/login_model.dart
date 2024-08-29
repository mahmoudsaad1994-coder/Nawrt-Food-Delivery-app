import '../../domain/entities/login_entity.dart';

class LoginModel extends AuthEntity {
  String? status;
  String? message;
  Map<String, dynamic>? data;

  LoginModel({
    this.data,
    this.message,
    this.status,
  }) : super(
          loginData: data,
          logiMessage: message,
          logiStatus: status,
        );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json['status'] as String?,
        message: json['message'] as String?,
        data: json['data'] as Map<String, dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data,
      };
}
