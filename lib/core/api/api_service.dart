import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  final baseUrl = "http://127.0.0.1:8000/api/v1/";

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> postRequest<T>(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    final response = await _dio.post('$baseUrl$url', data: data);

    return response.data;
  }
}
