import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';

class BlogTile extends StatelessWidget {
  const BlogTile(
      {Key? key,
      required this.description,
      required this.imageUrl,
      required this.url,
      required this.title})
      : super(key: key);

  final String imageUrl, title, description, url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Article_View(
              url: url,
            ),
          ),
        );
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 240.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              title,
              style:
                  const TextStyle(fontWeight: FontWeight.w900, fontSize: 18.0),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
