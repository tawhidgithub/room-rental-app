import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Core/Image Picker Service/pickerService.dart';
import '../../../../Core/db/dbConfig.dart';

class EditDataController extends GetxController {
  //TODO: Implement EditDataController
  late final int? index;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Rxn<XFile> image = Rxn<XFile>();

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

   editProduct(int index) async {

    final imageFile = image.value != null ? File(image.value!.path) : null;



    DBConfig().editProduct(
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
      index: index,
    ).then((value){


      if(kDebugMode){



        print("-----------Success-------------");
      }
    });

    Get.back(result: true);


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
