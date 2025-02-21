//todo: interface
//todo: remote  online
import 'package:news/model/SourceResponse.dart';

abstract class SourceRemoteDateSource{
  Future<SourceResponse?> getSources(String categoryId) ;
}
//todo: local offLine
abstract class SourceLocalDateSource{

}

