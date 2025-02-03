import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/Utils/app_colors.dart';
import 'package:news/model/category_model.dart';
import 'package:toggle_switch/toggle_switch.dart';


class CategoryFragment extends StatelessWidget {
  List<CategoryModel> categoriesList = [] ;
  Function onViewAllClicked ;  //call back function

  CategoryFragment({required this.onViewAllClicked}) ;

  @override
  Widget build(BuildContext context) {
    categoriesList = CategoryModel.getCategoriesList(false) ;
    var height = MediaQuery.of(context).size.height ;
    var width = MediaQuery.of(context).size.width ;
    return Container(
      padding: EdgeInsets.symmetric(vertical: width*0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Good Morning\nHere is Some News For You',
            style: Theme.of(context).textTheme.headlineMedium,) ,
          SizedBox(height: height*0.01,) ,
          Expanded(child:
          ListView.separated(
                itemBuilder: (context , index){
                  return Container(
                    child: Stack(
                      alignment: index % 2 == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
                      children: [
                        ClipRRect( borderRadius: BorderRadius.circular(24),
                            child: Image.asset(categoriesList[index].imagePath)) ,
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: width*0.01,vertical: height*0.02),
                          child: ToggleSwitch(
                            customWidths: [ width*0.25 ,width*0.15],
                            cornerRadius: 20.0,
                            customWidgets: [
                              Text('View All',style: Theme.of(context).textTheme.headlineLarge,),
                              CircleAvatar(
                                backgroundColor: AppColors.blackColor,
                                child:Icon(Icons.arrow_forward_ios_outlined,color: AppColors.whiteColor,) ,),
                            ],
                            activeBgColors: [[Theme.of(context).primaryColor], [AppColors.greyColor]],
                            activeFgColor: Colors.white,
                            inactiveBgColor: AppColors.greyColor,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            animate: true,
                            radiusStyle: true,
                            onToggle: (index1) {
                              print('switched to: $index');
                              onViewAllClicked(categoriesList[index]);
                            },
                          ),
                        ),

                      ],
                    ),
                  ) ;
                },
                separatorBuilder: (context , index){
                  return SizedBox(height: height*0.02,) ;
                },
              itemCount: categoriesList.length),
          ),

        ],
      ),
    );
  }
}
