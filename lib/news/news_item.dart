

import 'package:flutter/material.dart';
import 'package:news/Utils/app_colors.dart';
import 'package:news/model/NewsResponse.dart';

class NewsItem extends StatelessWidget {

  News news ;
  NewsItem({required this.news}) ;

  @override
  Widget build(BuildContext context) {
   var height = MediaQuery.of(context).size.height ;
   var width = MediaQuery.of(context).size.width ;
    return InkWell(
      onTap: (){
        showModalBottomSheet(
          backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            context: context, builder: (context){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin:EdgeInsets.all(8) ,
                padding: EdgeInsets.all(8),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1,color: Colors.black),
                ),
                child:Image.network(news.urlToImage?? ""),
              ),
              SizedBox(height: 2,),
              Text(news.title??"",style: Theme.of(context).textTheme.titleLarge, ), //Theme.of(context).textTheme.labelLarge,
              SizedBox(height: 3),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                   padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                  onPressed: (){
            // Navigator.of(context).pushNamed(NewsWebView.routeName,arguments: news.url);
                  },
                  child: Text('View Full Articel',style: TextStyle(color: Colors.white),)),
                   
            ],
          );
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.01),
        padding:  EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).indicatorColor ,width: 2),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16) ,
              child: Image.network(news.urlToImage?? ""),
            ),
            SizedBox(height: height*0.01,) ,
            Text(news.title??"",style: Theme.of(context).textTheme.labelLarge,),
            SizedBox(height: height*0.01,) ,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('By: ${news.author??""}',style: TextStyle(fontSize: 12,color: AppColors.greyColor),)),
                Text(news.publishedAt??"",textAlign:TextAlign.end,
                  style: TextStyle(fontSize: 12,color: AppColors.greyColor),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
