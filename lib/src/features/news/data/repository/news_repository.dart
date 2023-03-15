
import 'package:bloc_test/src/features/news/data/model/news_data_model.dart';

abstract class NewsRepository {
  Future<NewsData> fetchNewsData();
}