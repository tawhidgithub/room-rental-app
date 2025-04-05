

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_rental_app/app/modules/dashBoard/controllers/dash_board_controller.dart';
import 'package:room_rental_app/app/modules/home/views/home_view.dart';
import 'package:room_rental_app/app/resources/color.dart';

class DashBoardView extends GetView<DashBoardController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx((){
        return controller.screenList[controller.selectedIndex.value];
      }),
      bottomNavigationBar:Obx((){
        return  BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, size: 30),
              label: 'Rentals',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: 'Users',
            ),

          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: ColorManager.primaryPurple,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedFontSize: 16,
          onTap: controller.onItemTapped,
          type: BottomNavigationBarType.fixed,
        );
      }),
    );
  }
}