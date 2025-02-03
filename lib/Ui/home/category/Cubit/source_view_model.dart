// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news/Ui/home/category/Cubit/source_states.dart';
// import 'package:news/api/api_manager.dart';
//
// class SourceViewModel extends Cubit<SourceState> {
//   SourceViewModel() :super(SourceLoadingState());
//
//   // hold date / handle logic
//   void getSources(String categoryId) async {
//     try {
//       emit(SourceLoadingState());
//       var response = await ApiManager.getSources(categoryId);
//       if(response?.status == 'error'){
//         emit(SourceErrorState(errorMessage: response!.message!));
//         return;
//       }
//       if(response?.status == 'ok'){
//         emit(SourceSuccessState(SourceList: response!.sources!));
//         return;
//       }
//     }catch(e){
//       emit(SourceErrorState(errorMessage: e.toString()));
//     }
//   }
// }