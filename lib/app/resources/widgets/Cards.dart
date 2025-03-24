import 'package:flutter/material.dart';
import 'package:room_rental_app/app/resources/color.dart';

class CardsView extends StatelessWidget {
  const CardsView({super.key,required this.location, required this.landlordInfo, required this.image,required this.description,required this.price,required this.title});
  final String image;
  final String title;
  final String description;
  final String price;
  final String landlordInfo;
  final String location;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width - 50,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.primaryWhite,
      ),
      child: Column(
        children: [
          /// image
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              child: Image.network(image, fit: BoxFit.fill),
            ),
          ),

          /// Name and rating
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),Row(
                  spacing: 5,
                  children: [
                    Icon(Icons.star,color: ColorManager.yellow,),
                    Text("4.6",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                  ],
                )
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ///landlord info
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text("Landlord: ",style: TextStyle(color: ColorManager.textColor)),
                      Text(landlordInfo,style: TextStyle(color: ColorManager.textColor)),
                    ],
                  ),
                ),
                /// description
                SizedBox(
                  width: double.infinity,
                  child: Text(description,style: TextStyle(color: ColorManager.secondaryTextColor),maxLines: 3,),
                ),

              ],
            ),
          ),

          /// distance and price
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

/// Location
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ColorManager.primaryPurple
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Row(
                    spacing: 5,
                    children: [
                      Icon(Icons.location_on,color: ColorManager.primaryWhite,size: 15,),
                      Text(location ,style: TextStyle(fontSize: 15,color: ColorManager.primaryWhite),),
                    ],
                  ),
                ),
              ),
              /// Price
              Row(
                children: [
                  Text("Price: ",style: TextStyle(),),
                  Text("$price \$",style: TextStyle(),)
                ],
              )


            ]),
          ),
        ],
      ),
    );
  }
}
