import 'package:bloc_test/src/features/news/domain/repository/news_repository.dart';

import '../../data/models/news_data_model.dart';

class NewsUseCase{
  final NewsRepository newsRepository;
  NewsUseCase({required this.newsRepository});

  Future<NewsData> getNewsData()async{
    return await newsRepository.getNewsData();
  }
}