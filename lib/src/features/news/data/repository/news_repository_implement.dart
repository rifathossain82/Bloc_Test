
import 'package:bloc_test/src/features/news/data/model/news_data_model.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/network_utils.dart';
import 'news_repository.dart';

class NewsRepositoryImplement implements NewsRepository {
  @override
  Future<NewsData> fetchNewsData() async {
    dynamic responseBody = await Network.handleResponse(
      await Network.getRequest(api: Api.newsList),
    );

    NewsData newsData = NewsData(news: []);
    if (responseBody != null) {
      newsData = NewsData.fromJson(responseBody);
    } else {
      throw 'Unable to load news data!';
    }

    return newsData;
  }
}