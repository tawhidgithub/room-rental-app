import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/property_list_controller.dart';

class PropertyListView extends GetView<PropertyListController> {
  const PropertyListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PropertyListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PropertyListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(Routes.ADD_PRODUCT);
      },child: Icon(Icons.add),),
    );
  }
}
