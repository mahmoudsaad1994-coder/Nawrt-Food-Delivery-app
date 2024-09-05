import '../../domain/entities/login_entity.dart';

class RegisterModel extends AuthEntity {
  String? status;
  dynamic message;

  RegisterModel({
    this.message,
    this.status,
  }) : super(
          logiMessage: status != null ? message : null,
          logiStatus: status,
          loginData: status == null ? message : null,
        );

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json['status'] as String?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}


/* 
{
    "message": {
        "email": [
            "The email has already been taken."
        ],
        "password": [
            "The password field must contain at least one uppercase and one lowercase letter."
        ]
    }
}
 */

/* {
    "status": "success",
    "message": "تم التسجيل بنجاح من فضلك تحقق من البريد الالكترونى",
    "data": []
} */