import 'package:http/http.dart';

abstract class NewsDataSource{
  Future<Response> fetchNewsData();
}