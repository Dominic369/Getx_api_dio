import 'package:dio/dio.dart';

class apiService {
  var dio = Dio();

  Future<dynamic> apiServices() async {
    return await dio.get('https://jsonplaceholder.typicode.com/users');
  }
}
