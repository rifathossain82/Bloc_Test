import 'package:bloc_test/src/core/errors/errors.dart';
import 'package:bloc_test/src/features/news/domain/use_case/news_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/src/features/news/data/models/news_data_model.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsUseCase useCase;

  NewsBloc({required this.useCase}) : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if (event is GetNews) {
        try {
          emit(NewsLoading());
          NewsData newsData = await useCase.getNewsData();
          emit(NewsLoaded(newsData));
        } on BaseError catch(e){
          emit(NewsError(error: e));
        } catch (e) {
          emit(NewsError(error: UnknownError(message: '$e')));
        }
      }
    });
  }
}
