import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:room_rental_app/app/modules/User/model/userModel.dart';
import 'package:room_rental_app/app/modules/User/repo/user_repo.dart';

class UserController extends GetxController {


  UserRepo repo;
  UserController({required this.repo});
  //TODO: Implement UserController

  RxList <Users> users=<Users>[].obs;
  RxBool isLoading =false.obs;

setLoading(bool value){

  isLoading.value=value;


}
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
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



  Future<void> fetchData() async {
    setLoading(true);
    try {

      List<dynamic> data = await repo.getData();




        if (kDebugMode) {
          print("===================Body: $data");
        }
        if ( data != null) {

  var  usersList = data.map((user)=> Users.fromJson(user)).toList();
  users.assignAll(usersList);
  setLoading(false);

          if (kDebugMode) {
            print("================Data:$users");
          }
        } else {
          if (kDebugMode) {
            print("No data available in the response.");
          }
        }

    } catch (e) {
      if (kDebugMode) {
        print("----------------Error: $e");
      }
      rethrow;
    }
  }


}
