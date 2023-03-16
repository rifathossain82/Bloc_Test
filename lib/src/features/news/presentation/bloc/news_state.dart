part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoading extends NewsState{
  @override
  List<Object?> get props => [];
}

class NewsLoaded extends NewsState{
  final NewsData newsData;
  const NewsLoaded(this.newsData);

  @override
  List<Object?> get props => [newsData];
}

class NewsError extends NewsState{
  final String message;
  const NewsError({required this.message});

  @override
  List<Object?> get props => [message];
}


