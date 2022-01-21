import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';


class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=110b320d896243598dc7c6ce02c406b7";
    var response = await http.get(Uri.parse(url));     //store the response which we get
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){     //status is in api
      jsonData["articles"].forEach((element){       //now elements are there in articles in api,and we fetch elements  one by one by indexing

        if(element["urlToImage"] != null && element["description"] != null){       //fetching from api and checking image is there or not

          ArticleModel articleModel = ArticleModel( // saving the data of each property in api in variables
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["context"]
          );

          news.add(articleModel);

        }
      });
    }



  }



}

class CategoryNewsClass{
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{

    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=110b320d896243598dc7c6ce02c406b7";

    var response = await http.get(Uri.parse(url));     //store the response which we get
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){     //status is in api
      jsonData["articles"].forEach((element){       //now elements are there in articles in api,and we fetch elements  one by one by indexing

        if(element["urlToImage"] != null && element["description"] != null){       //fetching from api and checking image is there or not

          ArticleModel articleModel = ArticleModel( // saving the data of each property in api in variables
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["context"]
          );

          news.add(articleModel);

        }
      });
    }



  }



}
