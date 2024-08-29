import '../../domain/entities/login_entity.dart';

abstract class AuthStates {}

class InitialAuthStates extends AuthStates {}

class TogglePasswordStates extends AuthStates {}

class LoadingAuthStates extends AuthStates {}

class SucsessAuthStates extends AuthStates {
  final AuthEntity data;

  SucsessAuthStates({required this.data});
}

class ErrorAuthStates extends AuthStates {
  final String error;

  ErrorAuthStates({required this.error});
}
