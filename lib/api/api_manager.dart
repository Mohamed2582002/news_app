import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

class ApiManager {
// https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY &apiKey=b66b871133c24516803144ea15da7892

  static Future<SourceResponse?> getSources (String categoryId)async {
   Uri url  = Uri.https(
       ApiConstants.baseUrl ,
       EndPoints.sourceApi ,
       {'apiKey' : ApiConstants.apiKey , 'category' : categoryId} );
   try {
     var response = await http.get(url);
     var responseBody = response.body;
     var json = jsonDecode(responseBody) ;
     return SourceResponse.fromJson(json) ;
     // return SourceResponse.fromJson(c(response.body));

   }catch(e){
     throw e ;
   }
 }

 ///https://newsapi.org/v2/everything?q=bitcoin&apiKey=b66b871133c24516803144ea15da7892

static Future<NewsResponse> getNewsBySourceId (String sourceId)async {
   Uri url = Uri.https(ApiConstants.baseUrl ,EndPoints.newsApi ,
   {
     'apiKey' : ApiConstants.apiKey ,
     'sources' : sourceId ,
     //'q' : sourceId,
   }) ;
   try{
   var response = await http.get(url) ;
   var responseBody = response.body;
   var json = jsonDecode(responseBody) ;
   return NewsResponse.fromJson(json) ;
}catch(e){
     throw e ;
   }

 }

 static Future<NewsResponse?> getNewsDate ()async {
   const String apiKey = 'b66b871133c24516803144ea15da7892';
   const String baseUrl = 'https://newsapi.org/v2/everything';
   const String query = 'q';

   Future<List<dynamic>> getNewsDate(String query ,String searchTerm)async{
     final response =await http.get(Uri.parse('$baseUrl?search =$query'));

     if(response.statusCode == 200){
       return json.decode(response.body)['results'];
     }else {
       throw Exception('failed to load date');
     }
   }
 }

  static Future<NewsResponse> searchNews ({required String searchQuery,required int pageNumber})async {
    Uri url = Uri.https(ApiConstants.baseUrl ,ApiConstants.everyThing ,
        {
          //'apiKey' : ApiConstants.apiKey ,
          'q' : searchQuery ,
          'page': pageNumber.toString(),
          'pageSize': "10",

        }) ;
    try{
      var response = await http.get(url,headers: {
        "Authorization": "Bearer${ApiConstants.apiKey}"
      }) ;

      return NewsResponse.fromJson(jsonDecode(response.body)) ;
    }catch(e){
      throw e ;
    }

  }
}
