import 'package:flutter/material.dart';
import 'package:news/Utils/app_colors.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/news/news_item.dart';
import 'package:news/news/news_widget_view_model.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  Source source ;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourcesId(widget.source.id?? '') ;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child:
      Consumer<NewsWidgetViewModel>(builder: (context,viewModel,child) {
        if(viewModel.errorMessage != null){
          return Center(
                        child: Column(
                          children: [
                            Text(viewModel.errorMessage!,style: Theme.of(context).textTheme.headlineLarge, ),
                            ElevatedButton(
                                onPressed: (){
                                  viewModel.getNewsBySourcesId(widget.source.id?? '') ;
                                  setState(() {

                                  });
                                },
                                child: Text('try again',style: Theme.of(context).textTheme.headlineLarge,)),
                          ],
                        ),
                      );
        }else if(viewModel.newsList == null){
         return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.greyColor,
                        ),
                      ) ;
        }else{
          return ListView.builder(
              itemBuilder: (context, index){
                return NewsItem(news: viewModel.newsList![index]);
              } ,
              itemCount: viewModel.newsList!.length,
              );
        }
    }
      )
      // FutureBuilder<NewsResponse?>(
      //     future: ApiManager.getNewsBySourceId(widget.source.id ?? ""),
      //     builder: (context , snapshot) {
      //       if(snapshot.connectionState == ConnectionState.waiting){
      //         return Center(
      //           child: CircularProgressIndicator(
      //             color: AppColors.greyColor,
      //           ),
      //         ) ;
      //       }else if(snapshot.hasError){
      //         return Center(
      //           child: Column(
      //             children: [
      //               Text('SomeThing went Wrong',style: Theme.of(context).textTheme.headlineLarge, ),
      //               ElevatedButton(
      //                   onPressed: (){
      //                     ApiManager.getNewsBySourceId(widget.source.id?? '');
      //                     setState(() {
      //
      //                     });
      //                   },
      //                   child: Text('try again',style: Theme.of(context).textTheme.headlineLarge,)),
      //             ],
      //           ),
      //         );
      //       }
      //       if(snapshot.data!.status != 'ok'){
      //        return Center(
      //           child: Column(
      //             children: [
      //               Text(snapshot.data!.message!,style: Theme.of(context).textTheme.headlineLarge, ),
      //               ElevatedButton(
      //                   onPressed: (){
      //                     ApiManager.getNewsBySourceId(widget.source.id?? '');
      //                     setState(() {
      //
      //                     });
      //                   },
      //                   child: Text('try again',style: Theme.of(context).textTheme.headlineLarge,)),
      //             ],
      //           ),
      //
      //         );
      //       }
      //       var newsList = snapshot.data!.articles! ;
      //       return ListView.builder(itemBuilder: (context , index){
      //         return NewsItem(news: newsList[index]);
      //       },
      //       itemCount: newsList.length,
      //       );
      //     }
      // ),
    );
  }

}
