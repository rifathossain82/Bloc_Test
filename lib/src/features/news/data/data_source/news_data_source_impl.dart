import 'package:bloc_test/src/features/news/data/data_source/news_data_source.dart';
import 'package:http/http.dart';
import 'package:bloc_test/src/core/network/api.dart';
import 'package:bloc_test/src/core/network/network_utils.dart';

class NewsDataSourceImpl extends NewsDataSource {
  @override
  Future<Response> fetchNewsData() async {
    Response response = await Network.getRequest(api: Api.newsList);

    return response;
  }
}
