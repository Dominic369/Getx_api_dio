import 'package:dio/dio.dart';
import 'package:test_flutter_4/api/api.dart';
import 'package:test_flutter_4/models/api_data_model.dart';

/*
class ApiData {
  static Future<List<ApiDataModel>> getApiDataList() async {
    try {
      final res =
          await API_DPO.get('https://jsonplaceholder.typicode.com/users');
      List json = res.data;

      List<ApiDataModel> list = [];
      list = json.map((data) => ApiDataModel.fromJson(data)).toList();

      return list;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        print(
            'Connection to the server timed out. Please check your internet connection.');
      } else {
        print('Dio Error: $e');
      }
      throw Exception(e);
      /*
    on DioException catch (e) {
      throw Exception(e);
    }
    */
    }
  }
}
*/

class ApiData {
  static Future<List<ApiDataModel>> getApiDataList() async {
    try {
      //final res = await API_DPO.get('https://jsonplaceholder.typicode.com/users');
      final res = await API_DPO.get('/users');
      List json = res.data;

      List<ApiDataModel> list = [];
      list = json.map((data) => ApiDataModel.fromJson(data)).toList();

      return list;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        print(
            'Connection to the server timed out. Please check your internet connection.');
      } else if (e.type == DioErrorType.response) {
        // Handle Dio response errors
        print('Dio Response Error - Status Code: ${e.response?.statusCode}');
        print('Dio Response Error - Data: ${e.response?.data}');
      } else {
        // Handle other Dio errors
        print('Dio Error: $e');
      }
      // Rethrow the DioError or throw a custom exception based on your needs
      throw e;
    }
  }
}
