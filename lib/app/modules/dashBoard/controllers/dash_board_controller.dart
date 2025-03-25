import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_rental_app/app/modules/details/views/details_view.dart';
import 'package:room_rental_app/app/modules/home/views/home_view.dart';
import 'package:room_rental_app/app/modules/profile/views/profile_view.dart';
import 'package:room_rental_app/app/modules/propertyList/views/property_list_view.dart';

class DashBoardController extends GetxController {
  //TODO: Implement DashBoardController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  RxInt selectedIndex = 0.obs;

RxList  screenList = [
    // Home Screen
    HomeView(),
    // Existing List of Room Rent Screen
    PropertyListView(),

    // Profile Screen
    ProfileView(),
  ].obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
