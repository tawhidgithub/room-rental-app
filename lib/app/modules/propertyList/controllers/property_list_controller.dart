import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../Core/db/dbConfig.dart';

class PropertyListController extends GetxController {
  //TODO: Implement PropertyListController

  final count = 0.obs;

  RxList <Map<dynamic,dynamic>> propertyData=<Map<dynamic,dynamic>>[].obs;



  @override
  void onInit() {
    super.onInit();
    fetchPropertyData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }



  void increment() => count.value++;

  Future<void> fetchPropertyData() async {
    try {
      // Ensure the box is open before fetching data
      await DBConfig().openDBBox();

      final box = DBConfig().box;
      if (kDebugMode) {
        print("----------Unexpected item format in box: ${box!.values}");
        print("----------Unexpected item format in box: ${box.values.length}");
      }
      if (box != null) {
        for (var item in box.values) {
          propertyData.add(item);
        }

        // Update the observable list with new values

        if (kDebugMode) {
          print("Property Data: $propertyData");
        }
      } else if (kDebugMode) {
        print("Box is null, couldn't fetch data.");
      }
    } catch (e) {
      if (kDebugMode) {
        print("----------------Error: $e");
      }
      rethrow;
    }
  }


}
