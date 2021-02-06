import 'dart:convert';

import 'package:http/http.dart';

import '../model/utils.dart';
import '../model/article_model.dart';

class API {
  static String urlSource;
  static String _baseUrl;

  static String baseUrl(String baseUrl) {
    _baseUrl = Utils.API_URL + '$urlSource' + Utils.API_KEY;
    if (baseUrl == null) {

      return _baseUrl;
    } else {
      return null;
    }
  }

  static Future<List<Article>> getAllNews() async {
    baseUrl(_baseUrl);
   
    final Response response = await get(_baseUrl);
    if (response.statusCode == 200) {
      dynamic list = (List<Map<String, dynamic>>.from(
          json.decode(response.body)['articles']));

      return (list).map<Article>((item) => Article.fromJson(item)).toList();
    } else {
      throw Exception("Can't load author");
    }
  }
}
