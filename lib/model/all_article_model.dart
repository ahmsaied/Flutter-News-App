import 'dart:convert';

import '../model/article_model.dart';

class AllArticleModel {
  int totalResults;
  List<Article> articles;

  AllArticleModel.fromJson(String jsonStr) {
    final _map = jsonDecode(jsonStr);
    this.totalResults = _map['totalResults'];
    this.articles = [];
    final _newsList = _map['articles'];

    for (var i = 0; i < (this.totalResults); i++) {
      this.articles.add(new Article.fromJson(_newsList[i]));
    }
  }
}
