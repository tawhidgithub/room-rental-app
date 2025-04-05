import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:room_rental_app/Core/Image%20Picker%20Service/pickerService.dart';
import 'package:room_rental_app/Core/db/dbConfig.dart';

class AddProductController extends GetxController {
  final count = 0.obs;
  final Rxn<XFile> image = Rxn<XFile>();
  Uint8List? imageInByte;

  // Form field controllers
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
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

  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    landlordNameController.dispose();
    addressController.dispose();
    landlordEmailController.dispose();
    landlordNumberController.dispose();
    bedroomController.dispose();
    bathroomController.dispose();
    parkingController.dispose();
    wifiController.dispose();
    cityController.dispose();
    ratingController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  void addProduct() async {
    if (image.value != null) {
      final imageFile = File(image.value!.path);

      DBConfig().addProduct(
        name: nameController.text,
        price: priceController.text,
        description: descriptionController.text,
        imageUrl: imageFile,
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
    } else if (kDebugMode) {
      print("No image selected.");
    }
  }

  Future<void> picImage() async {
    try {
      final imagePath = await ImagePickerService().pickImageFromGallery();
      if (imagePath != null) {
        image.value = imagePath;
        imageInByte = await imagePath.readAsBytes();

        if (kDebugMode) {
          print("Picked image bytes: $imageInByte");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Image picking error: $e");
      }
      rethrow;
    }
  }
}