import 'package:bloc_test/src/core/network/network_utils.dart';
import 'package:bloc_test/src/features/news/data/data_source/news_data_source.dart';

import 'package:bloc_test/src/features/news/domain/repository/news_repository.dart';
import 'package:bloc_test/src/features/news/data/models/news_data_model.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDataSource dataSource;

  NewsRepositoryImpl({required this.dataSource});

  @override
  Future<NewsData> getNewsData() async {
    dynamic responseBody = await Network.handleResponse2(
      await dataSource.fetchNewsData(),
    );

    NewsData newsData = NewsData(news: []);
    if (responseBody != null) {
      newsData = NewsData.fromJson(responseBody);
    }

    return newsData;
  }
}
