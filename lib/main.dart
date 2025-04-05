 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:room_rental_app/Core/db/dbConfig.dart';
import 'package:room_rental_app/app/modules/home/views/home_view.dart';
import 'package:room_rental_app/app/routes/app_pages.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var dir=  await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  DBConfig  dbConfig=   DBConfig();
  await dbConfig.openDBBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

    );
  }
}


