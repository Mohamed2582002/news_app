import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/news/news_item.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'Search_screen' ;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<News> news = [];

  int maxResult = 0;
  int currentPage = 1;
  String? errorMessage = "";

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        iconTheme: Theme
            .of(context)
            .iconTheme,
        title: TextFormField(
          onFieldSubmitted: (value){
            currentPage = 1 ;
            maxResult = 0 ;
            _search() ;
          },
          controller: controller,
          style: TextStyle(color: Colors.white, fontSize: 20),
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 20, color: Colors.white),
            prefixIcon: Icon(Icons.search, color: Colors.white,),
            suffixIcon: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: Colors.white,)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.white),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if(news.isEmpty&& errorMessage == null)
              Center(child: Image.asset('assets/images/search_empty.png',)),
            if(news.isNotEmpty)
              ListView.separated(
                itemBuilder: (context, index) =>
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: NewsItem(news: news[index]),),
                separatorBuilder: (context, index) => SizedBox(height: 15,),
                itemCount: news.length,
              ),
          ],
        ),
      ),
    );
  }

  _search() async {
    errorMessage = "" ;
    try {
      var response = await ApiManager.searchNews(
          searchQuery: controller.text,
          pageNumber: currentPage
      );
      news = response.articles?? [] ;
      maxResult = response.totalResults?.toInt()?? 0 ; //todo;
      currentPage ++ ;
    }catch(e){
    errorMessage = e.toString() ;
    }
      setState(() {

      });
    }
 }