import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:room_rental_app/Core/db/dbConfig.dart';
import 'package:room_rental_app/app/resources/color.dart';
import 'package:room_rental_app/app/resources/widgets/Cards.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Obx((){
            return CustomScrollView(
              slivers: [
                /// header
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          "Find your best private space",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: ColorManager.primaryWhite,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      InkWell(
                        onTap: () async {

                          await DBConfig().getProduct();
                          if(kDebugMode){

                            // print("----------------${DBConfig()}");
                          }

                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: ColorManager.purpleLight,
                            shape: BoxShape.circle,
                          ),
                          height: 50,
                          width: 50,
                          child: SvgPicture.asset(
                            "assets/icon/notification.svg",
                            colorFilter: ColorFilter.mode(
                              ColorManager.primaryWhite,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /// search
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),

                        hintText: "Search your space",
                        filled: true,
                        fillColor: ColorManager.primaryWhite,
                        suffixIcon: Icon(Icons.search),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                /// card
              controller.propertyData.isEmpty ? SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 300),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "No Property to show",
                        style: TextStyle(
                          fontSize: 24,
                          color: ColorManager.primaryWhite,
                        ),
                      ),
                      Text(
                        "Add property to show here",
                        style: TextStyle(
                          fontSize: 15,
                          color: ColorManager.primaryWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ) : SliverList(delegate: SliverChildBuilderDelegate(
                    childCount: controller.propertyData.length,
                        (context,index){

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: (){
                            controller.detailsController.rentalModel=controller.propertyData[index];

                            Get.toNamed(Routes.DETAILS);

                          },
                          child: CardsView(
                            location: controller.propertyData[index]['city'],
                            image:controller.propertyData[index]["imageUrl"],
                            rating:controller.propertyData[index]["rating"] ,
                            description:controller.propertyData[index]['description'],
                            price:controller.propertyData[index]['price'],
                            title: controller.propertyData[index]['name'],
                            landlordInfo: controller.propertyData[index]['landlordName'],
                          ),
                        ),
                      );
                    }))
              ],
            );
          }),
        ),
      ),
    );
  }
}
