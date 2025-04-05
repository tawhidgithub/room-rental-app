import 'package:get/get.dart';
import 'package:room_rental_app/app/modules/User/repo/user_repo.dart';

import '../controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
      () => UserController(repo: Get.find()),
    );Get.lazyPut<UserRepo>(
      () => UserRepo(apiService: Get.find()),
    );
  }
}
