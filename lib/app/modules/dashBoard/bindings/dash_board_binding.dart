import 'package:get/get.dart';
import 'package:room_rental_app/app/modules/User/controllers/user_controller.dart';
import 'package:room_rental_app/app/modules/User/repo/user_repo.dart';
import 'package:room_rental_app/app/modules/details/controllers/details_controller.dart';
import 'package:room_rental_app/app/modules/editData/controllers/edit_data_controller.dart';
import 'package:room_rental_app/app/modules/home/controllers/home_controller.dart';
import 'package:room_rental_app/app/modules/propertyList/controllers/property_list_controller.dart';
import 'package:room_rental_app/app/modules/propertyList/views/property_list_view.dart';

import '../controllers/dash_board_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(
      () => DashBoardController(),
    ); Get.lazyPut<HomeController>(
      () => HomeController(),
    );Get.lazyPut<PropertyListController>(
      () => PropertyListController(),
    );Get.lazyPut<UserController>(
      () => UserController(repo: Get.find()),
    );Get.lazyPut<DetailsController>(
      () => DetailsController(),
    );Get.lazyPut<EditDataController>(
      () => EditDataController(),
    );Get.lazyPut<UserRepo>(
      () => UserRepo(apiService: Get.find()),
    );
  }
}
