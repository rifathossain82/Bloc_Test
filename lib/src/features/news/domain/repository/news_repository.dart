

import '../../data/models/news_data_model.dart';

abstract class NewsRepository {
  Future<NewsData> getNewsData();
}