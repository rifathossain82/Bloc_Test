import 'package:bloc_test/src/features/news/data/model/news_data_model.dart';
import 'package:bloc_test/src/features/news/data/repository/news_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository;
  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async{
      if(event is GetNews){
        try{
          emit(NewsLoading());
          NewsData newsData = await newsRepository.fetchNewsData();
          emit(NewsLoaded(newsData));
        } on Exception catch (e) {
          emit(NewsError(message: '$e'));
        } catch (e) {
          emit(NewsError(message: '$e'));
        }
      }
    });
  }
}
