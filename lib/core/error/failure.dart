import 'package:dio/dio.dart';

abstract class Failure {
  final String? message;
  final Map? messageMap;
  Failure({this.message, this.messageMap});
}

class ServerFailure extends Failure {
  final String? messageFailure;
  final Map? messageMapFailure;
  ServerFailure({this.messageFailure, this.messageMapFailure})
      : super(
          message: messageFailure,
          messageMap: messageMapFailure,
        );

  factory ServerFailure.fromDiorError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            messageFailure: 'Connection timeout with api server');

      case DioExceptionType.sendTimeout:
        return ServerFailure(messageFailure: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(messageFailure: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(messageFailure: 'badCertificate with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(
            messageFailure: 'Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure(messageFailure: 'No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            messageFailure: 'Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(
          messageFailure: 'Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure(
          messageFailure: 'There is a problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (response['message'] is String) {
        return ServerFailure(messageFailure: response['message']);
      }
      return ServerFailure(messageMapFailure: response['message']);
    } else {
      return ServerFailure(
          messageFailure: 'There was an error , please try again');
    }
  }
}
