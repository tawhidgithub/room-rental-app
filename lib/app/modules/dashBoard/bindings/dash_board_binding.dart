import 'package:get/get.dart';
import 'package:room_rental_app/app/modules/details/controllers/details_controller.dart';
import 'package:room_rental_app/app/modules/editData/controllers/edit_data_controller.dart';
import 'package:room_rental_app/app/modules/home/Home%20Repo/repo.dart';
import 'package:room_rental_app/app/modules/home/controllers/home_controller.dart';
import 'package:room_rental_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:room_rental_app/app/modules/propertyList/controllers/property_list_controller.dart';
import 'package:room_rental_app/app/modules/propertyList/views/property_list_view.dart';

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
    );Get.lazyPut<PropertyListController>(
      () => PropertyListController(),
    );Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );Get.lazyPut<DetailsController>(
      () => DetailsController(),
    );Get.lazyPut<EditDataController>(
      () => EditDataController(),
    );
  }
}
