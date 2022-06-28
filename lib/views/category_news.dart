import 'package:flutter/material.dart';
import 'package:news_app/data/data.dart';
import '../models/article_models.dart';
import 'package:news_app/data/news.dart';
import '../views/home.dart';
import '../models/category_models.dart';
import 'package:string_extensions/string_extensions.dart';

class categoryNews extends StatefulWidget {
  final String categoryName;
  const categoryNews({required this.categoryName});

  @override
  _categoryNewsState createState() => _categoryNewsState();
}

class _categoryNewsState extends State<categoryNews> {

  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];

  bool _loading = true;

  String cat_name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getCategoryNews();
    cat_name = widget.categoryName.capitalize!;
  }

  getCategoryNews() async
  {
    categoryNews1 news = categoryNews1();
    await news.getCategoryNews(widget.categoryName);
    articles = news.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$cat_name", style: TextStyle(
                color: Colors.black
            ),),
          ],
        ),
        actions: [Opacity(opacity: 0, child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.share),
        ),)],
        // backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: RefreshIndicator(
          onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          getCategoryNews();
          },
    color: Colors.green,
    child: Container(
        child: Column(
          children: <Widget>[
            ///  BLOGS
            Container(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom - 50,
              child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return blogTile(
                      imageURL: articles[index].imageURL,
                      blogTitle: articles[index].title,
                      blogDesc: articles[index].desc,
                      blogURL: articles[index].URL,
                    );
                  }),
            )
          ]
        ),
      ),
    ));
  }
}
