import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:room_rental_app/app/modules/home/Home%20Repo/repo.dart';

import '../Model/model.dart';

class HomeController extends GetxController {

  HomeRepo repo;
  HomeController({required this.repo});

  //TODO: Implement HomeController

RxList <Datum> data=<Datum>[].obs;


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


  Future <void> fetchData ()async{

    try{
      RoomRentalModel response = RoomRentalModel.fromJson( await repo.getData());
if(kDebugMode){

  print("===================Body: ${response.data}");

}
if(response.statusCode == 200){


  if (response.data != null) {
    data.addAll(response.data!);

    if(kDebugMode){

      print("================Data:${data[0].price}");
    }


  }else{

    if (kDebugMode) {
      print("No data available in the response.");
    }
  }




}else {
  if (kDebugMode) {
    print("Failed to load data with status code: ${response.statusCode}");
  }
}


    }catch(e){
      if(kDebugMode){


        print("----------------Error: $e");
      }
      rethrow;
    }


  }


}
