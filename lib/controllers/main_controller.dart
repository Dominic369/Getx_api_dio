import 'package:get/get.dart';
import 'package:test_flutter_4/controllers/api.dart';
import 'package:test_flutter_4/models/api_data.dart';

// ignore: camel_case_types
class Main_controller extends GetxController {
  var user = <User>[].obs;

  void fetchUser() async {
    apiService requset = apiService();
    requset.apiServices().then((value) {
      if (value.statusCode == 200) {
        for (var item in value.data) {
          user.add(User.fromJson(item));
        }
      } else {
        print('Backend error');
      } //).catchError((onError) {printError();
    });
  }
}
