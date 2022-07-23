class ArticleModel {
  String title = '';
  String description = '';
  String content = '';
  String urlToImage = '';
  String url = '';
  ArticleModel(
      {required this.content,
      required this.description,
      required this.title,
      required this.url,
      required this.urlToImage});
}
