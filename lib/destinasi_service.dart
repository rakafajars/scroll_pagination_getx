import 'package:dio/dio.dart';
import 'package:flutter_application_2/search_destinasi_response.dart';

import 'base_url.dart';

class DestinasiService {
  static Dio dio = Dio();

  static Future<SearchDestinasiResponse> searchDestinasi({
    String? search,
    String? limit,
    String? page,
    String? sort,
    String? filter,
  }) async {
    final response = await dio.get(
      '${BaseUrl.urlAPI}/destinations?search=${search ?? ''}&limit=${limit ?? ''}&page=${page ?? ''}&sort=${sort ?? ''}&filter=${filter ?? ''}',
      options: Options(
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6ImNmZTk5ZGY4LTU5NTktNGMyMy1iNjA5LWEwYzdkMjIxZjI4YiIsIlVzZXJuYW1lIjoiam9obmRvZSIsIlJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE4MTk4MDUyLCJpYXQiOjE3MTgxOTQ0NTIsIm5iZiI6MTcxODE5NDQ1Mn0.z-N_rF2JtCsSvalncCN31RQJdtqxE5MeHrDIJSnRutg',
          'Content-Type': 'application/json',
        },
      ),
    );
    return SearchDestinasiResponse.fromJson(response.data);
  }
}
