import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
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
  Uint8List? imageInByte;
  void increment() => count.value++;

  // Form field controllers
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
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
    descriptionController.dispose();
    super.onClose();
  }

  void addProduct() async {

    final imageFile = image.value != null ? File(image.value!.path) : null;



    DBConfig().addProduct(
      name: nameController.text,
      price: priceController.text ,
      description: descriptionController.text,
      imageUrl: imageFile!,
      landlordName: landlordNameController.text,
      address: addressController.text,
      landlordEmail: landlordEmailController.text,
      landlordNumber: landlordNumberController.text,
      badRoom: bedroomController.text,
      bathRoom: bathroomController.text,
      parking: parkingController.text,
      wifi: wifiController.text,
      city: cityController.text,
      rating: ratingController.text,
    );
    Get.back(result: true);
  }

  /// pic Image from gallery

  Future<void> picImage() async {
    try {
      XFile imagePath =
          await ImagePickerService().pickImageFromGallery() as XFile;

      image.value = imagePath;
      imageInByte = await imagePath.readAsBytes();
      if(kDebugMode){

        print("--------------$imageInByte");
      }
    } catch (e) {
      rethrow;
    }
  }
}
