part of 'news_list_bloc.dart';

abstract class NewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchNewsEvent extends NewsEvent {}
