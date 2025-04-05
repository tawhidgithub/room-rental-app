import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:room_rental_app/app/modules/details/controllers/details_controller.dart';

import '../../../../Core/db/dbConfig.dart';

class HomeController extends GetxController {


  DetailsController detailsController = Get.find<DetailsController>();

  //TODO: Implement HomeController

  RxList<Map<dynamic, dynamic>> propertyData = <Map<dynamic, dynamic>>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // fetchData();
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







  Future<void> fetchPropertyData() async {
    try {
      propertyData.value=[];
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
