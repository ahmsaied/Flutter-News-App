import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/API.dart';
import '../model/article_model.dart';

part 'news_list_status.dart';
part 'news_list_event.dart';

class NewsListBloc extends Bloc<NewsEvent, NewsState> {
  final API api;
  NewsListBloc(NewsState initialState, this.api) : super(initialState);

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchNewsEvent) {
      yield NewsLoadingState();
      try {
        var api = await API.getAllNews();
        yield NewsFetchedSuccessState(api);
      } catch (err) {
        yield NewsErrorState(err.toString());
      }
    }
  }
}
