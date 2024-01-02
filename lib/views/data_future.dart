import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_4/controllers/main_controller.dart';

class DataFutureView extends StatefulWidget {
  const DataFutureView({super.key});

  @override
  State<DataFutureView> createState() => _DataFutureViewState();
}

class _DataFutureViewState extends State<DataFutureView> {
  void initState() {
    mainController.fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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

  final mainController = Get.put(Main_controller());
}
