import 'package:dio/dio.dart';

// ignore: camel_case_types
class ApiService {
  var dio = Dio();

  Future<dynamic> apiServices() async {
    return await dio.get('https://jsonplaceholder.typicode.com/users');
  }
}
