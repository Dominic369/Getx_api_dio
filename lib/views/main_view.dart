import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_4/controllers/main_controller.dart';
import 'package:test_flutter_4/models/api_data_model.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

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
      body: GetBuilder<MainController>(
        init: MainController()..dataFuture.fetchDataList(),
        dispose: (state) {},
        builder: (controller) {
          controller.dataFuture.fetchDataList();
          return FutureBuilder(
            future: controller.dataFuture.futureBuilding,
            builder: (context, snapshot) {
              if (kDebugMode) {
                print('Connection State: ${snapshot.connectionState}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  color: Colors.blue,
                  backgroundColor: Colors.black,
                ); // Loading indicator
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.data == null ||
                  !snapshot.hasData ||
                  snapshot.data!.isEmpty) {
                return const Text('No data available');
              } else {
                // Safely cast the data to List<ApiDataModel>
                List<ApiDataModel> dataList =
                    (snapshot.data as List<dynamic>).cast<ApiDataModel>();

                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                    );
                  },
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(
                        '${dataList[index].id}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      title: Text('Name : ${dataList[index].name}'),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Username : ${dataList[index].username}'),
                          Text('Email : ${dataList[index].email}'),
                          Text('Phone : ${dataList[index].phone}'),
                          Text('Website : ${dataList[index].website}'),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}

/*
class DataFutureView extends StatefulWidget {
  const DataFutureView({super.key});

  @override
  State<DataFutureView> createState() => _DataFutureViewState();
}

class _DataFutureViewState extends State<DataFutureView> {
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
      body: GetBuilder<MainController>(
        init: MainController()..fetchCowBuildingList(),
        dispose: (state) {},
        builder: (controller) {
          return FutureBuilder(
            future: controller.futureBuilding,
            builder: (context, snapshot) {},
          );
        },
      ),
    );
  }

  final mainController = Get.put(MainController());
}
*/
