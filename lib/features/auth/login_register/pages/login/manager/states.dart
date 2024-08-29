import '../../../domain/entities/login_entity.dart';

abstract class LoginStates {}

class InitialLoginStates extends LoginStates {}

class TogglePasswordStates extends LoginStates {}

class LoadingLoginStates extends LoginStates {}

class SucsessLoginStates extends LoginStates {
  final AuthEntity data;

  SucsessLoginStates({required this.data});
}

class ErrorLoginStates extends LoginStates {
  final String error;

  ErrorLoginStates({required this.error});
}
