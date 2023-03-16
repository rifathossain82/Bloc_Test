import 'package:bloc_test/src/features/news/data/data_source/news_data_source.dart';
import 'package:bloc_test/src/features/news/data/models/news_data_model.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/network_utils.dart';

class NewsDataSourceImpl extends NewsDataSource{
  @override
  Future<NewsData> fetchNewsData() async{
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