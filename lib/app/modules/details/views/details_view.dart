import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:room_rental_app/app/resources/color.dart';
import 'package:room_rental_app/app/resources/widgets/section.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            /// Image
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  child: Image.file(
                    File(controller.rentalModel!['imageUrl']),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            /// Landlord
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      "LandLord",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: ColorManager.secondaryTextColor,
                        ),
                      ),
                      child: Column(
                        spacing: 5,
                        children: [
                          Row(
                            spacing: 20,
                            children: [
                              Text(
                                "Name :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.rentalModel!['landlordName'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 20,
                            children: [
                              Text(
                                "Contact :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.rentalModel!['landlordNumber'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 20,
                            children: [
                              Text(
                                "Email :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.rentalModel!['landlordEmail'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Location
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: ColorManager.secondaryTextColor,
                        ),
                      ),
                      child: Column(
                        spacing: 5,
                        children: [
                          Row(
                            spacing: 20,
                            children: [
                              Text(
                                "Address :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.rentalModel!['address'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 20,
                            children: [
                              Text(
                                "City :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.rentalModel!['city'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Feature
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Feature",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: ColorManager.secondaryTextColor,
                        ),
                      ),
                      child: Column(
                        spacing: 5,
                        children: [
                          Row(
                            spacing: 20,
                            children: [
                              Text(
                                "Bathrooms: ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.rentalModel!['bathRoom'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 20,
                            children: [
                              Text(
                                "Bedroom :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.rentalModel!['badRoom'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            spacing: 20,
                            children: [
                              Text(
                                "Parking :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.rentalModel!['parking'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 20,
                            children: [
                              Text(
                                "Wifi :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                controller.rentalModel!['wifi']
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // /// Status
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 10),
            //     child: Column(
            //       spacing: 5,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           "Status",
            //           style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         Container(
            //           padding: EdgeInsets.all(5),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             border: Border.all(
            //               width: 1,
            //               color: ColorManager.secondaryTextColor,
            //             ),
            //           ),
            //           child: Column(
            //             spacing: 5,
            //             children: [
            //               Row(
            //                 spacing: 20,
            //                 children: [
            //                   Text(
            //                     "Status :",
            //                     style: TextStyle(
            //                       fontSize: 15,
            //                       fontWeight: FontWeight.w500,
            //                     ),
            //                   ),
            //                   Text(
            //                     controller.rentalModel!.availability!.status
            //                         .toString(),
            //                     style: TextStyle(
            //                       fontSize: 15,
            //                       fontWeight: FontWeight.w500,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
