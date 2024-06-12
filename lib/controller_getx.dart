import 'package:dio/dio.dart';
import 'package:flutter_application_2/destinasi_service.dart';
import 'package:flutter_application_2/search_destinasi_response.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ControllerGetx extends GetxController {
  final searchDestinasiResponse = SearchDestinasiResponse().obs;
  final PagingController<int, DataDestinasi> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() {
    pagingController.addPageRequestListener(
      (pageKey) {
        getDestination(pageKey: pageKey);
      },
    );
    super.onInit();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  void getDestination({
    required int pageKey,
    String? search,
  }) async {
    try {
      final listDestination = await DestinasiService.searchDestinasi(
          page: "$pageKey", search: search);

      final isLastPage = listDestination.data?.length ?? 0 < 10;

      if (isLastPage == true) {
        pagingController.appendLastPage(
          listDestination.data ?? [],
        );
      } else {
        Future.delayed(const Duration(seconds: 5), () {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(listDestination.data ?? [], nextPageKey);
        });
      }
    } on DioException catch (e) {
      pagingController.error = e;
    }
  }
}
