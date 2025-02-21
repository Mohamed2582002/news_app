import 'package:flutter/material.dart';
import 'package:news/Ui/Search/search_screen.dart';
import 'package:news/Ui/home/category/category_details.dart';
import 'package:news/Ui/home/category/category_fragment.dart';
import 'package:news/Ui/home/drawer/home_drawer.dart';
import 'package:news/Utils/app_colors.dart';
import 'package:news/model/category_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home_screen' ;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( selectedCategory == null ?'Home' : selectedCategory!.title,
        style:Theme.of(context).textTheme.headlineLarge,),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, SearchScreen.routeName) ;
          },
              icon: Icon(Icons.search ,color: Theme.of(context).indicatorColor,)),
        ],
        iconTheme: Theme.of(context).iconTheme,
      ) ,

      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(onDrawerItemClicked: onDrawerItemClicked,),
      ),
      body: selectedCategory == null ?
      CategoryFragment(onViewAllClicked: onViewAllClicked ,) :
          CategoryDetails(category: selectedCategory!,) ,
    );
  }

  CategoryModel? selectedCategory ;

  void onViewAllClicked (CategoryModel newSelectedCategroy){
    selectedCategory = newSelectedCategroy ;
    setState(() {

    });

  }
  void onDrawerItemClicked(){
    selectedCategory = null ;
    Navigator.pop(context) ;
    setState(() {

    });
  }


  appBar(){
    return AppBar(
      title: Text( selectedCategory == null ?'Home'
          : selectedCategory!.title,style: Theme.of(context).textTheme.headlineLarge,),

      iconTheme: Theme.of(context).iconTheme,
    );
  }
}