import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:room_rental_app/Core/Image%20Picker%20Service/pickerService.dart';
import 'package:room_rental_app/Core/db/dbConfig.dart';

class AddProductController extends GetxController {
  //TODO: Implement AddProductController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Rxn<XFile> image = Rxn<XFile>();
  void increment() => count.value++;

  // Form field controllers
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final imageUrlController = TextEditingController();
  final landlordNameController = TextEditingController();
  final addressController = TextEditingController();
  final landlordEmailController = TextEditingController();
  final landlordNumberController = TextEditingController();
  final bedroomController = TextEditingController();
  final bathroomController = TextEditingController();
  final parkingController = TextEditingController();
  final wifiController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final ratingController = TextEditingController();

  // Dispose controllers to avoid memory leaks
  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    imageUrlController.dispose();
    landlordNameController.dispose();
    addressController.dispose();
    landlordEmailController.dispose();
    landlordNumberController.dispose();
    bedroomController.dispose();
    bathroomController.dispose();
    parkingController.dispose();
    wifiController.dispose();
    cityController.dispose();
    stateController.dispose();
    super.onClose();
  }

  void addProduct() async {
    DBConfig().addProduct(
      name: nameController.text,
      price: priceController.text ,
      imageUrl: image.value!.path,
      landlordName: landlordNameController.text,
      address: addressController.text,
      landlordEmail: landlordEmailController.text,
      landlordNumber: landlordNumberController.text,
      badRoom: bedroomController.text,
      bathRoom: bathroomController.text,
      parking: parkingController.text,
      wifi: wifiController.text,
      city: cityController.text,
      state: stateController.text,
      rating: ratingController.text,
    );
  }

  /// pic Image from gallery

  Future<void> picImage() async {
    try {
      XFile imagePath =
          await ImagePickerService().pickImageFromGallery() as XFile;

      image.value = imagePath;
    } catch (e) {
      rethrow;
    }
  }
}
