import 'package:flutter/material.dart';
import 'package:news/Utils/app_colors.dart';

class SectionDrawerItem extends StatelessWidget {
  String imagePath ;
  String text ;
  SectionDrawerItem({required this.imagePath ,required this.text});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height ;
    var width = MediaQuery.of(context).size.width ;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ImageIcon(AssetImage(imagePath),color: AppColors.whiteColor,) ,
          SizedBox(width: width*0.02,) ,
          Text(text ,style: TextStyle(fontWeight: FontWeight.bold,fontSize:20 ,color: AppColors.whiteColor),),

        ],
      ),
    );
  }
}
//Text('Go To Home'