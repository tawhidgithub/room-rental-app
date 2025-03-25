import 'package:get/get.dart';
import 'package:room_rental_app/app/modules/details/controllers/details_controller.dart';
import 'package:room_rental_app/app/modules/home/Home%20Repo/repo.dart';
import 'package:room_rental_app/app/modules/home/controllers/home_controller.dart';
import 'package:room_rental_app/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/dash_board_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(
      () => DashBoardController(),
    ); Get.lazyPut<HomeController>(
      () => HomeController(repo: Get.find()),
    );Get.lazyPut<HomeRepo>(
      () => HomeRepo(apiService: Get.find()),
    );Get.lazyPut<DetailsController>(
      () => DetailsController(),
    );Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
