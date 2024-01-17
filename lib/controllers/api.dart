import 'package:dio/dio.dart';

// ignore: camel_case_types
class ApiService {
  var dio = Dio();

  Future<dynamic> apiServices() async {
    return await dio.get('https://jsonplaceholder.typicode.com/users');
  }

/*
  var _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  var API_DPO = Dio(
  BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    contentType: Headers.jsonContentType,
  ),
)
*/
}
