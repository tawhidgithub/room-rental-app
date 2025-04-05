import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:room_rental_app/Core/Image%20Picker%20Service/pickerService.dart';
import 'package:room_rental_app/app/resources/color.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add the Property'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    controller.picImage();
                  },
                  child: Obx(() {
                    return Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: ColorManager.primaryPurple,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child:
                            controller.image.value == null
                                ? Icon(
                                  Icons.add,
                                  color: ColorManager.primaryPurple,
                                )
                                : SizedBox(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                      File(controller.image.value!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                      ),
                    );
                  }),
                ),

                _buildTextField(controller.nameController, 'Name',1),
                _buildTextField(
                  controller.priceController,
                  'Price',1,
                  keyboardType: TextInputType.text,
                ),_buildTextField(
                  controller.descriptionController,
                  'Description',3,
                  keyboardType: TextInputType.number,
                ),

                _buildTextField(
                  controller.landlordNameController,
                  'Landlord Name',1
                ),

                _buildTextField(
                  controller.landlordEmailController,
                  'Landlord Email',1,
                  keyboardType: TextInputType.emailAddress,
                ),
                _buildTextField(
                  controller.landlordNumberController,
                  'Landlord Number',1,
                  keyboardType: TextInputType.phone,
                ),
                _buildTextField(controller.bedroomController, 'Bedroom',1),
                _buildTextField(controller.bathroomController, 'Bathroom',1),
                _buildTextField(controller.parkingController, 'Parking',1),
                _buildTextField(controller.wifiController, 'WiFi',1),
                _buildTextField(controller.addressController, 'Address',1),
                _buildTextField(controller.cityController, 'City',1),
                _buildTextField(controller.ratingController, 'Rating',1),
                ElevatedButton(
                  onPressed: controller.addProduct,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  child: Text('Add Property',style: TextStyle(color: ColorManager.primaryWhite),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField(
  TextEditingController controller,

  String label, int? minLine ,
    {
  TextInputType keyboardType = TextInputType.text,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: controller,
      maxLines:minLine ,
      keyboardType: keyboardType,
      decoration: InputDecoration(

        labelText: label,
        border: OutlineInputBorder(

        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primaryPurple),
        ),
      ),
    ),
  );
}
