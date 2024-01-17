import 'package:get/get.dart';
import 'package:test_flutter_4/controllers/api.dart';
import 'package:test_flutter_4/models/api_data.dart';

// ignore: camel_case_types
class MainController extends GetxController {
  var user = <User>[].obs;

  void fetchUser() async {
    ApiService requset = ApiService();
    requset.apiServices().then((value) {
      if (value.statusCode == 200) {
        for (var item in value.data) {
          user.add(User.fromJson(item));
        }
      } else {
        // ignore: avoid_print
        print('Backend error');
      } //).catchError((onError) {printError();
    });
  }
}
