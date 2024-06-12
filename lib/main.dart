import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller_getx.dart';
import 'package:flutter_application_2/search_destinasi_response.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DestinationSearchPage(),
    );
  }
}

class DestinationSearchPage extends StatelessWidget {
  DestinationSearchPage({super.key});

  final ControllerGetx controller = Get.put(ControllerGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Destination Search',
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            onChanged: (val) {
              controller.getDestination(pageKey: 1, search: val);
              controller.pagingController.refresh();
            },
          ),
          Expanded(
            child: PagedGridView(
              pagingController: controller.pagingController,
              showNewPageProgressIndicatorAsGridChild: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              builderDelegate: PagedChildBuilderDelegate<DataDestinasi>(
                itemBuilder: (context, item, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text(
                        item.nama ?? "-",
                      ),
                    ),
                  );
                },
                newPageProgressIndicatorBuilder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            // child: PagedListView(
            //   pagingController: controller.pagingController,
            //   builderDelegate: PagedChildBuilderDelegate<DataDestinasi>(
            //     itemBuilder: (context, item, index) {
            //       return Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(
            //           height: 100,
            //           width: double.infinity,
            //           color: Colors.red,
            //           alignment: Alignment.center,
            //           child: Text(
            //             item.nama ?? "-",
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
