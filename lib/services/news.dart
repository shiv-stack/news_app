import 'dart:convert';

import 'package:news_app/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> newsList = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=d22e176be3f24174a0b1da5cd043d7cd";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            content: element['content'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          newsList.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> newsList = [];

  Future<void> getCategoryNews(String categoty) async {
    String url =
     "https://newsapi.org/v2/top-headlines?country=in&category&apiKey=8485b2e5741444b3bed7df05f65dc156";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              content: element['content'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage']);
          newsList.add(articleModel);
        }
      });
    }
  }
}
