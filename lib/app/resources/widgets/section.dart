import 'package:flutter/material.dart';

class SectionView extends StatelessWidget {
  SectionView({super.key,required this.data});
List<Map<String,dynamic>> data  ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15)
      ),
      child: ListView.builder(

          itemCount: data.length,
          itemBuilder: (context,index){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Name"),
            Text("Tawhid Islam")

          ],
        );
      })
    );
  }
}
