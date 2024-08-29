import 'package:hive/hive.dart';

part 'login_entity.g.dart';

@HiveType(typeId: 0)
class AuthEntity {
  @HiveField(0)
  Map<String, dynamic>? loginData;
  @HiveField(1)
  String? logiMessage;
  @HiveField(2)
  String? logiStatus;

  AuthEntity({
    this.loginData,
    this.logiMessage,
    this.logiStatus,
  });
}
