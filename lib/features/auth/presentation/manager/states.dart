import '../../domain/entities/login_entity.dart';

abstract class AuthStates {}

class InitialAuthStates extends AuthStates {}

class ToggleStates extends AuthStates {}

class LoadingAuthStates extends AuthStates {}

class SucsessAuthStates extends AuthStates {
  final AuthEntity data;

  SucsessAuthStates({required this.data});
}

class ErrorAuthStates extends AuthStates {
  final String? error;
  final Map? messageMap;
  ErrorAuthStates({this.messageMap, this.error});
}

class GetEmailStates extends AuthStates {}

class ChangeTimeStates extends AuthStates {}

class ToogleForgetPasswordStates extends AuthStates {}
