import 'package:flutter/material.dart';
import 'package:news_app/data/data.dart';
import 'package:news_app/models/article_models.dart';
import 'package:news_app/models/category_models.dart';
import 'package:news_app/data/news.dart';
import 'package:news_app/views/category_news.dart';
import 'package:url_launcher/url_launcher.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // ignore: deprecated_member_use
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async
  {
    News news = News();
    await news.getNews();
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
          children: const <Widget>[
            Text("Karan ", style: TextStyle(
              color: Colors.black
            ),),
            Text("News", style: TextStyle(
                color: Colors.green
            ),),
          ],
        ),
        elevation: 0.0,
      ),

      // body: _loading ? const Center(child: CircularProgressIndicator()):
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          getNews();
        },
        color: Colors.green,
        child:
      Container(
        child: Column(
          children: <Widget>[

            /// CATEGORIES
            Container(
              height: 70,
            child: ListView.builder(
              shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryTile(
                imageUrl: categories[index].imageURL,
                 categoryName: categories[index].categoryName,
              );
            }),
        ),


          ///  BLOGS
          Container(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom - 120,
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
          ],
        ),
      ),
    ));
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => categoryNews(
              categoryName: categoryName.toString().toLowerCase(),
            )));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 10),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl, width: 120, height: 60, fit: BoxFit.cover),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black45
              ),
              child: Text(categoryName, style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),),
            )
          ],
        ),
      ),
    );
  }
}

class blogTile extends StatelessWidget {

  final String imageURL;
  final String blogTitle;
  final String blogDesc;
  final String blogURL;
  const blogTile({Key? key, required this.imageURL, required this.blogTitle, required this.blogDesc, required this.blogURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:()async {
          var url = blogURL;
          if (await canLaunch(url)) {
            await launch(url);
          }
          else {
            throw "Error launching $url";
          }
        },
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageURL, fit: BoxFit.cover),
            ),
            const SizedBox(height: 5,),
            Text(blogTitle, style: const TextStyle(
              fontSize: 20,
              fontFamily: "Georgia",
            ),),
            const SizedBox(height: 5,),
            Text(blogDesc, style: const TextStyle(
              color: Colors.black45,
            ),)
          ],
        ),
      ),
    );
  }
}

//17659dfa7a2f46d4838a9ab8b9ec48a3

// git remote set-url origin https://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@github.com/karanbaboota/News-App



