import 'package:bloc_test/src/features/news/data/data_source/news_data_source_impl.dart';
import 'package:bloc_test/src/features/news/data/repository/news_repository_impl.dart';
import 'package:bloc_test/src/features/news/domain/use_case/news_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/news_data_model.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsUseCase useCase = NewsUseCase(
    newsRepository: NewsRepositoryImpl(
      dataSource: NewsDataSourceImpl(),
    ),
  );

  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if (event is GetNews) {
        try {
          emit(NewsLoading());
          NewsData newsData = await useCase.getNewsData();
          emit(NewsLoaded(newsData));
        } catch (e) {
          emit(NewsError(message: '$e'));
        }
      }
    });
  }
}
