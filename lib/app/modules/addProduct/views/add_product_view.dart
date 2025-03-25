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
      appBar: AppBar(title: const Text('AddProductView'), centerTitle: true),
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

                _buildTextField(controller.nameController, 'Name'),
                _buildTextField(
                  controller.priceController,
                  'Price',
                  keyboardType: TextInputType.number,
                ),

                _buildTextField(
                  controller.landlordNameController,
                  'Landlord Name',
                ),
                _buildTextField(controller.addressController, 'Address'),
                _buildTextField(
                  controller.landlordEmailController,
                  'Landlord Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                _buildTextField(
                  controller.landlordNumberController,
                  'Landlord Number',
                  keyboardType: TextInputType.phone,
                ),
                _buildTextField(controller.bedroomController, 'Bedroom'),
                _buildTextField(controller.bathroomController, 'Bathroom'),
                _buildTextField(controller.parkingController, 'Parking'),
                _buildTextField(controller.wifiController, 'WiFi'),
                _buildTextField(controller.cityController, 'City'),
                _buildTextField(controller.stateController, 'State'),
                _buildTextField(controller.ratingController, 'Reting'),
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
  String label, {
  TextInputType keyboardType = TextInputType.text,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primaryPurple),
        ),
      ),
    ),
  );
}
