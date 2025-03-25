import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';
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
      appBar: AppBar(
        title: const Text('PropertyListView'),
        centerTitle: true,
      ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Get.toNamed(Routes.ADD_PRODUCT);
        },child: Icon(Icons.add),),
      body: Obx((){return CustomScrollView(
        slivers: [
          SliverList(delegate:SliverChildBuilderDelegate(


                  childCount: controller.propertyData.length,(context,index){
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Slidable(
                // Specify a key if the Slidable is dismissible.
                key: const ValueKey(0),

                // The start action pane is the one at the left or the top side.


                // The end action pane is the one at the right or the bottom side.
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (value){},
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
                  location: controller.propertyData[index]['city'],
                  image:controller.propertyData[index]["imageUrl"],
                  description:controller.propertyData[index]['address'],
                  price:controller.propertyData[index]['price'],
                  title: controller.propertyData[index]['name'],
                  landlordInfo: controller.propertyData[index]['landlordName'],
                ),
              ),
            );
          }))
        ],
      );}),

    );
  }
}
