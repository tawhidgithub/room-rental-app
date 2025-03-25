import 'package:get/get.dart';

import '../controllers/property_list_controller.dart';

class PropertyListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyListController>(
      () => PropertyListController(),
    );
  }
}
