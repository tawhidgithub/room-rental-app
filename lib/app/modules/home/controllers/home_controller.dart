import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:room_rental_app/app/modules/details/controllers/details_controller.dart';
import 'package:room_rental_app/app/modules/home/Home%20Repo/repo.dart';

import '../../../../Core/db/dbConfig.dart';
import '../Model/model.dart';

class HomeController extends GetxController {
  HomeRepo repo;
  HomeController({required this.repo});

  DetailsController detailsController = Get.find<DetailsController>();

  //TODO: Implement HomeController

  RxList<Datum> data = <Datum>[].obs;
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

  Future<void> fetchData() async {
    try {
      RoomRentalModel response = RoomRentalModel.fromJson(await repo.getData());
      if (kDebugMode) {
        print("===================Body: ${response.data}");
      }
      if (response.statusCode == 200) {
        if (response.data != null) {
          data.addAll(response.data!);

          if (kDebugMode) {
            print("================Data:${data[0].price}");
          }
        } else {
          if (kDebugMode) {
            print("No data available in the response.");
          }
        }
      } else {
        if (kDebugMode) {
          print("Failed to load data with status code: ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("----------------Error: $e");
      }
      rethrow;
    }
  }

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
