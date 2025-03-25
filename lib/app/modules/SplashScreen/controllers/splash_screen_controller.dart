import 'dart:async';

import 'package:get/get.dart';
import 'package:room_rental_app/app/routes/app_pages.dart';

import '../../../../Core/db/dbConfig.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    Timer(Duration(seconds: 3), ()=>Get.toNamed(Routes.DASH_BOARD));





    
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
}
