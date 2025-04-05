import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:room_rental_app/app/modules/User/model/userModel.dart';
import 'package:room_rental_app/app/modules/User/repo/user_repo.dart';
import '../../../../Core/db/dbConfig.dart';

class UserController extends GetxController {
  UserRepo repo;
  UserController({required this.repo});

  RxList<Map<dynamic, dynamic>> userData = <Map<dynamic, dynamic>>[].obs;
  RxList<UsersApiModel> users = <UsersApiModel>[].obs;
  RxBool isLoading = false.obs;

  setLoading(bool value) {
    isLoading.value = value;
  }

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }
/// check Connection
  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }


  Future<void> loadData() async {
    setLoading(true);
    await fetchDataFromAPI();
    await fetchUserData();
    setLoading(false);
  }

  List<UsersApiModel> dataUser=<UsersApiModel>[];
  Future<void> fetchDataFromAPI() async {
    if (await checkInternetConnection()) {
      try {
        var data = await repo.getData();
        saveUsersToDatabase(data);

        if (kDebugMode) {
          print("Fetched data from API: $data");
        }
      } catch (e) {
        if (kDebugMode) {
          print("API Error: $e");
        }
      }
    } else if (kDebugMode) {
      print("No internet connection, skipping API call.");
    }
  }

  /// Save the fetched users to the database
  Future<void> saveUsersToDatabase(List<dynamic> data) async {
    await DBConfig().openDBBox();
    final box = DBConfig().usersBox;

    if (box != null) {
      await box.clear();
      for (var user in data) {
        DBConfig().addUser(
          id: user['id'].toString(),
          name: user['name'],
          userName: user['username'],
          email: user['email'],
        );
      }

      if (kDebugMode) {
        print("Saved users to the database.");
      }
    } else if (kDebugMode) {
      print("Box is null, cannot save users to the database.");
    }
  }

  /// Fetch user data from the database
  Future<void> fetchUserData() async {
    try {
      userData.value=[];
      // Ensure the box is open before fetching data
      await DBConfig().openDBBox();

      final box = DBConfig().usersBox;

      if (box != null) {
        for (var item in box.values) {
          userData.add(item);
        }
        if (kDebugMode) {
          print("----------Unexpected item format in box: ${box.values}");
          print("----------Unexpected item format in box: ${box.values.length}");
          print("===============UserData: $userData");
        }

        // Update the observable list with new values

        if (kDebugMode) {
          print("-------Property Data: $userData");
        }
      } else if (kDebugMode) {
        print("---------------Box is null, couldn't fetch data.");
      }
    } catch (e) {
      if (kDebugMode) {
        print("----------------Error: $e");
      }
      rethrow;
    }
  }


}