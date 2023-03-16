import 'package:bloc_test/src/features/news/data/data_source/news_data_source.dart';

import '../../domain/repository/news_repository.dart';
import '../models/news_data_model.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDataSource dataSource;
  NewsRepositoryImpl({required this.dataSource});

  @override
  Future<NewsData> getNewsData() async{
    return dataSource.fetchNewsData();
  }
}