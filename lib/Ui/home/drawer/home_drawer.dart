import 'package:flutter/material.dart';
import 'package:news/Ui/home/drawer/app_theme_provider.dart';
import 'package:news/Ui/home/drawer/section_drawer_item.dart';
import 'package:news/Utils/app_colors.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatefulWidget {
  Function onDrawerItemClicked ;
  HomeDrawer({required this.onDrawerItemClicked}) ;

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String dropDownValue = 'Dark' ;
  String dropDownValueLg = 'English' ;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height ;
    var width = MediaQuery.of(context).size.width ;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Column(

      children: [
        Container(
          color: AppColors.whiteColor,
          height: height*0.18,
          width: double.infinity,
          child: Center(
            child: Text('News App',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: AppColors.blackColor),),
          ),
        ),
        SizedBox(height: height*0.02,) ,
        InkWell(
          onTap: (){
          widget.onDrawerItemClicked() ;
          },
          child: SectionDrawerItem(
              imagePath: 'assets/images/icon_home.png',
              text: 'Go To Home'),
        ) ,
        Divider(color: AppColors.whiteColor,thickness: 2,endIndent: width*0.06,indent: width*0.04,),
        SizedBox(height: height*0.02,) ,
        SectionDrawerItem(
            imagePath: 'assets/images/icon_theme.png',
            text: 'Theme') ,
        Container(
            margin: EdgeInsets.symmetric(horizontal: width*0.04),
            padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16) ,
              border: Border.all(color: AppColors.whiteColor),
            ),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              //  Text('Dark',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20,color: AppColors.whiteColor) ,),
              //  Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,size: 30,) ,
                DropdownButton<String>(

                    dropdownColor: Colors.grey,
                    padding: EdgeInsets.symmetric(horizontal: width*0.2),
                    value: dropDownValue,
                    icon: Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,size: 30,) ,
                    elevation: 5,
                    style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20,color: AppColors.whiteColor),
                    underline: Container(height: double.infinity,width: double.infinity,),
                    items:<String>['Dark','Light'].map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,),);
                    }).toList(),
                    onChanged: (String?newValue){
                      setState(() {
                        dropDownValue =newValue! ;
                      });
                    }),
              ],
            ),
          ),

        SizedBox(height: height*0.02,) ,
        Divider(color: AppColors.whiteColor,thickness: 2,endIndent: width*0.06,indent: width*0.04,),
        SectionDrawerItem(
            imagePath: 'assets/images/icon_language.png',
            text: 'Language') ,
        Container(
          margin: EdgeInsets.symmetric(horizontal: width*0.04),
          padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16) ,
            border: Border.all(color: AppColors.whiteColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Text('English',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20,color: AppColors.whiteColor) ,),
              //Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,size: 30,) ,
              DropdownButton<String>(
                  dropdownColor: Colors.grey,
                  padding: EdgeInsets.symmetric(horizontal: width*0.1),
                  value: dropDownValueLg,
                  icon: Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,size: 30,) ,
                  elevation: 5,
                  style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20,color: AppColors.whiteColor),
                  underline: Container(height: double.infinity,width: double.infinity,),
                  items:<String>['English','Arabic'].map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),);
                  }).toList(),
                  onChanged: (String?newValue){
                    setState(() {
                      dropDownValueLg =newValue! ;
                    });
                  }),
            ],
          ),
        ),
      ],
    );

  }
}
