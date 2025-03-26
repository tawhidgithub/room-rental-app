import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:room_rental_app/app/modules/editData/controllers/edit_data_controller.dart';
import 'package:room_rental_app/app/modules/home/controllers/home_controller.dart';

import '../../../../Core/db/dbConfig.dart';
import '../../../routes/app_pages.dart';

class PropertyListController extends GetxController {
  //TODO: Implement PropertyListController

  final count = 0.obs;
  HomeController homeController=Get.find();

  RxList<Map<dynamic, dynamic>> propertyData = <Map<dynamic, dynamic>>[].obs;
  RxBool isLoading = false.obs;
  EditDataController editDataController = Get.find();

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

  void setLoading(bool value) {
    isLoading.value = value;
  }

  /// fetch product
  Future<void> fetchPropertyData() async {
    try {
      setLoading(true);
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
        setLoading(false);
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

  /// add product
  Future<void> addProduct() async {
    final result = await Get.toNamed(Routes.ADD_PRODUCT);

    // Check if the result indicates the list should be refreshed
    if (result == true) {
      propertyData.clear(); // Clear existing data
      fetchPropertyData();
      homeController.fetchPropertyData();// Refresh data
    }
  }

  /// add product
  Future<void> deleteProduct(int index) async {
    try {
      await DBConfig().deleteProduct(index);
      propertyData.value = [];
      fetchPropertyData();
      homeController.fetchPropertyData();// Refresh data
    } catch (e) {
      rethrow;
    }



  }

  /// edit product
  editProduct(int index) async {
    try {
      editDataController.nameController.text = propertyData[index]['name'];
      editDataController.priceController.text = propertyData[index]['price'];
      editDataController.descriptionController.text =
          propertyData[index]['description'];
      editDataController.landlordNameController.text =
          propertyData[index]['landlordName'];
      editDataController.landlordNumberController.text =
          propertyData[index]['landlordNumber'];
      editDataController.landlordEmailController.text =
          propertyData[index]['landlordEmail'];
      editDataController.bedroomController.text =
          propertyData[index]['badRoom'];
      editDataController.bathroomController.text =
          propertyData[index]['bathRoom'];
      editDataController.parkingController.text =
          propertyData[index]['parking'];
      editDataController.wifiController.text = propertyData[index]['wifi'];
      editDataController.cityController.text = propertyData[index]['city'];
      editDataController.ratingController.text = propertyData[index]['rating'];
      editDataController.addressController.text =
          propertyData[index]['address'];
      editDataController.image.value = XFile(propertyData[index]['imageUrl']);
      editDataController.index = index;

      if (kDebugMode) {
        print("======Name===========${editDataController.nameController.text}");
      }

      // Use result callback
      final result = await Get.toNamed(Routes.EDIT_DATA);
      // Check if the result indicates the list should be refreshed
      if (result == true) {
        propertyData.clear();
        fetchPropertyData();
        homeController.fetchPropertyData();// Refresh data
      }
    } catch (e) {
      rethrow;
    }
  }
}
