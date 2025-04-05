import 'package:flutter/foundation.dart';

import '../../../../Core/APi_Url_Container.dart';
import '../../../services/api_services.dart';

class UserRepo {
  ApiService apiService;
  UserRepo({required this.apiService});

  Future getData() async {
    String url = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.users}".trim();
    if (kDebugMode) {
      print("================URL: $url");
    }
    try {
      var response = await apiService.makeRequest(url: url, method: "get") as List<dynamic>?;

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
