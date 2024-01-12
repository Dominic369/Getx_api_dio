import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_4/controllers/main_controller.dart';

class DataFutureView extends StatefulWidget {
  const DataFutureView({super.key});

  @override
  State<DataFutureView> createState() => _DataFutureViewState();
}

class _DataFutureViewState extends State<DataFutureView> {
  @override
  void initState() {
    mainController.fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetX-ดึงข้อมูล (Dio)',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(child: GetX<Main_controller>(
            builder: (controller) {
              return ListView.builder(
                  itemCount: mainController.user.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: Text('${mainController.user[index].id}'),
                        title:
                            Text('Name : ${mainController.user[index].name}'),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Username : ${mainController.user[index].username}'),
                            Text('Email : ${mainController.user[index].email}'),
                            Text('Phone : ${mainController.user[index].phone}'),
                            Text(
                                'Website : ${mainController.user[index].website}'),
                          ],
                        ));
                  });
            },
          ))
        ],
      )),
    );
  }

  final mainController = Get.put(Main_controller());
}
