import 'package:get/get.dart';
import 'package:room_rental_app/app/modules/home/Model/model.dart';

class DetailsController extends GetxController {
  //TODO: Implement DetailsController


Map<dynamic,dynamic>? rentalModel;


RxBool isLoading=false.obs;

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

void setLoading(bool value){

  isLoading.value=value;




}

}
