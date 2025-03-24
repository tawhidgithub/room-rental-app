import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 100,
                width: 100,
                child: SvgPicture.asset('assets/logo/logo.svg')),
            Text("StayNest",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
