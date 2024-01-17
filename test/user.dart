import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_4/controllers/main_controller.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  void initState() {
    mainController.fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App GetX Dio')),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(child: GetX<MainController>(
            builder: (controller) {
              return ListView.builder(
                  itemCount: mainController.user.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${mainController.user[index].name}'),
                      subtitle: Text('${mainController.user[index].email}'),
                    );
                  });
            },
          ))
        ],
      )),
    );
  }

  final mainController = Get.put(MainController());
}
