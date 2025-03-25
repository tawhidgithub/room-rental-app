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
                SliverList(delegate: SliverChildBuilderDelegate(
                    childCount: controller.propertyData.length,
                        (context,index){

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: (){
                            controller.detailsController.rentalModel=controller.data[index];

                            Get.toNamed(Routes.DETAILS);

                          },
                          child: CardsView(
                            location: controller.data[index].location!.city!,
                            image:controller.data[index].images![0],
                            description:controller.data[index].description!,
                            price:controller.data[index].price!.toString(),
                            title: controller.data[index].title!, landlordInfo: controller.data[index].landlord!.name!,
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
