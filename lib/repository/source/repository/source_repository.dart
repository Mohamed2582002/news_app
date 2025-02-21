//todo: repository pattern _ interface
import 'package:news/model/SourceResponse.dart';

abstract class SourceRepository {
  Future<SourceResponse?> getSources(String categoryId) ;

}