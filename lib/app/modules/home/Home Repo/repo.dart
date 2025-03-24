import 'package:flutter/foundation.dart';
import 'package:room_rental_app/Core/APi_Url_Container.dart';
import 'package:room_rental_app/app/services/api_services.dart';

class HomeRepo{
  ApiService apiService;
  HomeRepo({required this.apiService});



  Future getData()async{
    String url= "${ApiUrlContainer.baseUrl}${ApiUrlContainer.details}".trim();
    if(kDebugMode){
      print("================URL: $url");


    }
    try{


      var response =await apiService.makeRequest(url: url,method: "get");

      return response;




    }catch(e){
      rethrow;
    }


  }



}