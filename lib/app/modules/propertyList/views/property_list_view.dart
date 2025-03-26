import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';
import 'package:room_rental_app/Core/db/dbConfig.dart';
import 'package:room_rental_app/app/resources/color.dart';

import '../../../resources/widgets/Cards.dart';
import '../../../routes/app_pages.dart';
import '../controllers/property_list_controller.dart';

class PropertyListView extends GetView<PropertyListController> {
  const PropertyListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryPurple,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addProduct();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Property List",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : CustomScrollView(
              slivers: [
                controller.propertyData.isEmpty
                    ? SliverToBoxAdapter(
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
                    )
                    : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: controller.propertyData.length,
                        (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Slidable(
                              // Specify a key if the Slidable is dismissible.
                              key: const ValueKey(0),

                              // The start action pane is the one at the left or the top side.

                              // The end action pane is the one at the right or the bottom side.
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (value) {

                                      controller.editProduct(index);


                                    },
                                    backgroundColor: Color(0xFF32a852),
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    label: 'Edit',
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  SlidableAction(
                                    onPressed: (value) {
                                      controller.deleteProduct(index);

                                    },
                                    backgroundColor: Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ],
                              ),

                              // The child of the Slidable is what the user sees when the
                              // component is not dragged.
                              child: CardsView(
                                rating: controller.propertyData[index]['rating'],
                                location:
                                    controller.propertyData[index]['city'],
                                image:
                                    controller.propertyData[index]["imageUrl"],
                                description:
                                    controller.propertyData[index]['description'],
                                price: controller.propertyData[index]['price'],
                                title: controller.propertyData[index]['name'],
                                landlordInfo:
                                    controller
                                        .propertyData[index]['landlordName'],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              ],
            );
      }),
    );
  }
}
