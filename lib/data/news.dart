import 'dart:convert';
import 'package:news_app/models/article_models.dart';
import 'package:http/http.dart' as http;

class News
{
  List<ArticleModel> news = [];

  Future<void> getNews() async
  {
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=17659dfa7a2f46d4838a9ab8b9ec48a3";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    print(jsonData);

    if(jsonData["status"] == "ok")
      {
        jsonData["articles"].forEach((element) {
          if(element["title"] != null && element["urlToImage"] != null && element["description"] != null && element['url'] != null && element["author"] != null && element["content"] != null)
            {
              ArticleModel am = ArticleModel(
                title: element["title"],
                author: element["author"],
                desc: element["description"],
                URL: element["url"],
                imageURL: element["urlToImage"],
                content: element["content"]
              );

              news.add(am);
            }
        });
      }

  }
}

// ignore: camel_case_types
class categoryNews1 {
  List<ArticleModel> news = [];

  Future<void> getCategoryNews(String category) async
  {
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=17659dfa7a2f46d4838a9ab8b9ec48a3";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["title"] != null && element["urlToImage"] != null &&
            element["description"] != null && element['url'] != null &&
            element["author"] != null && element["content"] != null) {
          ArticleModel am = ArticleModel(
              title: element["title"],
              author: element["author"],
              desc: element["description"],
              URL: element["url"],
              imageURL: element["urlToImage"],
              content: element["content"]
          );

          news.add(am);
        }
      });
    }
  }
}