import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/blog_tile.dart';
import 'package:news_app/model/categories_helper.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/views/categories.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CategoryModel> categories = List<CategoryModel>.empty();
  List<ArticleModel> articleList = List<ArticleModel>.empty(growable: true);
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  Future<void> getNews() async {
    News topNews = News();
    await topNews.getNews();
    setState(() {
      _loading = false;
      articleList = topNews.newsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(articleList.first);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Shivam NewNation ',
          style: TextStyle(
              color: Colors.blue, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : RefreshIndicator(
              onRefresh: getNews,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 70.0,
                      child: ListView.builder(
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                              categoryName: categories[index].categoryName,
                              imageUrl: categories[index].imageUrl);
                        },
                      ),
                    ),
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
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {Key? key, required this.categoryName, required this.imageUrl})
      : super(key: key);

  final String imageUrl, categoryName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Categories(
              category: categoryName.toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 12.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 60,
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
