import 'package:flutter/material.dart';
import 'package:news/Ui/home/category/category_details.dart';
import 'package:news/Ui/home/category/category_fragment.dart';
import 'package:news/Ui/home/drawer/home_drawer.dart';
import 'package:news/Utils/app_colors.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/category_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home_screen' ;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
String? SearchTerm;
bool isSearching = false ;
TextEditingController searchController = TextEditingController();



class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          isSearching? searchAppBar() : appBar(),
        // title: Text( selectedCategory == null ?'Home' : selectedCategory!.title,
      // style:Theme.of(context).textTheme.headlineLarge,),
        // actions: [
        //   IconButton(onPressed: (){},
        //       icon: Icon(Icons.search ,color: Theme.of(context).indicatorColor,)),
        // ],
        // iconTheme: Theme.of(context).iconTheme,


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

  searchAppBar (){
    return AppBar(
      title: TextField(
        controller: searchController,
        style: Theme.of(context).textTheme.headlineLarge,
        cursorColor:Theme.of(context).indicatorColor,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle:Theme.of(context).textTheme.headlineLarge ,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      actions: [
        IconButton(onPressed: (){
          isSearching =false ;
          SearchTerm = null ;
          searchController.text = '';
          setState(() {
           SearchTerm =searchController.text ;
           ApiManager.getNewsDate();
          });
        },
            icon: Icon(Icons.search ,color: Theme.of(context).indicatorColor,)),
      ],
      iconTheme: Theme.of(context).iconTheme,
    );
  }

  appBar(){
    return AppBar(
      title: Text( selectedCategory == null ?'Home'
          : selectedCategory!.title,style: Theme.of(context).textTheme.headlineLarge,),
      actions: [
        IconButton(onPressed: (){
          setState(() {
            isSearching = true ;

          });
        },  icon: Icon(Icons.search ,color: Theme.of(context).indicatorColor,)),
      ],
      iconTheme: Theme.of(context).iconTheme,
    );
  }
}
