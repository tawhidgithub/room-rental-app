import 'package:get/get.dart';
import 'package:room_rental_app/app/services/api_services.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
    Get.put(ApiService());
  }
}
