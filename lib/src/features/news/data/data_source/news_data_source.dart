import '../models/news_data_model.dart';

abstract class NewsDataSource{
  Future<NewsData> fetchNewsData();
}