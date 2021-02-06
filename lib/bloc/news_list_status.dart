part of 'news_list_bloc.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsFetchedSuccessState extends NewsState {
  final List<Article> news;
  NewsFetchedSuccessState(this.news);
}

class NewsErrorState extends NewsState {
  final String message;
  NewsErrorState(this.message);
}
