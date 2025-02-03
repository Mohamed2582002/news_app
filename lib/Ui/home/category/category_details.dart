import 'package:flutter/material.dart';
import 'package:news/Ui/home/category/category_details_view_model.dart';
import 'package:news/Ui/home/category/source_tab_widget.dart';
import 'package:news/model/category_model.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category ;
  CategoryDetails({required this.category}) ;
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}


class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel() ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> viewModel,
      child: Consumer<CategoryDetailsViewModel>
        (builder: (context,viewModel,child){
          if (viewModel.errorMessage != null){
            return Center(
                child: Column(
                  children: [
                    Text(viewModel.errorMessage!,
                      style: Theme.of(context).textTheme.headlineLarge, ),
                    ElevatedButton(onPressed: (){
                      viewModel.getSources(widget.category.id);
                      setState(() {
                      });
                      },
                        child: Text('try again',
                          style: Theme.of(context).textTheme.headlineLarge,)),
                              ],
                            ),
                  );


          }
         else if(viewModel.sourcesList == null ){
            // todo: loading
                      return Center(
                        child: CircularProgressIndicator(color: Colors.grey,),);

          }else{
            return SourceTabWidget(sourcesList: viewModel.sourcesList!) ;
          }
      }) ,
    );

      // FutureBuilder<SourceResponse?>(
      //     future: ApiManager.getSources(widget.category.id),
      //     builder: (context ,snapshot){
      //       if(snapshot.connectionState == ConnectionState.waiting){
      //         return Center(
      //           child: CircularProgressIndicator(color: Colors.grey,),);
      //       }else if(snapshot.hasError){
      //         return Center(
      //           child: Column(
      //             children: [
      //               Text('SomeThing went Wrong',style: Theme.of(context).textTheme.headlineLarge, ),
      //               ElevatedButton(
      //                   onPressed: (){
      //                     ApiManager.getSources(widget.category.id);
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
      //         return Center(
      //           child: Column(
      //             children: [
      //               Text('SomeThing went Wrong',style: Theme.of(context).textTheme.headlineLarge, ),
      //               ElevatedButton(
      //                   onPressed: (){
      //                     ApiManager.getSources(widget.category.id);
      //                     setState(() {
      //
      //                     });
      //                   },
      //                   child: Text('try again',style: Theme.of(context).textTheme.headlineLarge,)),
      //             ],
      //           ),
      //         );
      //       }
      //       var sourcesList = snapshot.data!.sources! ;
      //       return SourceTabWidget(sourcesList: sourcesList);
      //     }),

  }
}
