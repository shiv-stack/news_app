import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/blog_tile.dart';
import 'package:news_app/services/news.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<ArticleModel> articleList = List<ArticleModel>.empty(growable: true);
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  void getCategoryNews() async {
    CategoryNews getNews = CategoryNews();
    await getNews.getCategoryNews(widget.category);
    articleList = getNews.newsList;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Shivam News ',
          style: TextStyle(
              color: Colors.blue, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 28.0),
                    child: ListView.builder(
                      itemCount: articleList.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BlogTile(
                          imageUrl: articleList[index].urlToImage,
                          title: articleList[index].title,
                          description: articleList[index].description,
                          url: articleList[index].url,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
