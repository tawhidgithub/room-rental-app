import 'package:get/get.dart';
import 'package:room_rental_app/app/modules/home/Home%20Repo/repo.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(repo: Get.find()),
    );Get.lazyPut<HomeRepo>(
      () => HomeRepo(apiService: Get.find()),
    );
  }
}
