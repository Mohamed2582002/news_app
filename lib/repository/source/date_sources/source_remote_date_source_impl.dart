import 'package:news/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/repository/source/date_sources/source_remote_date_source.dart';

class SourceRemoteDateSourceImpl implements SourceRemoteDateSource{
  ApiManager apiManager ;
  SourceRemoteDateSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }

}