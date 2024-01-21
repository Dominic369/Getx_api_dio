import 'package:get/get.dart';
import 'package:test_flutter_4/api/connection/api_data.dart';
import 'package:test_flutter_4/models/api_data_model.dart';

class DataFuture extends GetxController {
  Future<List<ApiDataModel>> futureBuilding = Future.value([]);

  Future<List<ApiDataModel>> getFutureBuilding() async {
    final model = await ApiData.getApiDataList();
    return model;
  }

  Future<void> fetchDataList() async {
    futureBuilding = getFutureBuilding();
  }
}
