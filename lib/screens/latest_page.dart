import 'dart:convert';

import 'package:daryo_ui/models/article.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LatestPage extends StatefulWidget {

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
    List<Articles> articles = [];
  void fetchData() async {
    print('FetchData');
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f92e2f1ab28e49b8af125e4b50799d6b";
    try {
      var response = await http.get(Uri.parse(url));
      print(response.body);
      final Map<String, dynamic> body = jsonDecode(response.body);
      Article article = Article.fromJson(body);

      setState(() {
        articles = article.articles!;
      });
    }catch(e){
      print(e);
    }
  }
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return newsItem(articles[index]);
            }));
  }

  Widget newsItem(Articles news) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Maslahatlar",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    " ${news.publishedAt} ",
                    style: TextStyle(color: Colors.black38),
                  ),
                  Icon(Icons.visibility_outlined, color: Colors.grey),
                  SizedBox(width: 4),
                  // Text("${news.watchCount}")
                ],
              )
            ],
          ),
          SizedBox(height: 9),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.network(news.urlToImage ?? "", width: 140),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                news.title ?? "---",
                style: TextStyle(fontWeight: FontWeight.w500, height: 1.2),
              ),
            )
          ]),
          Divider(color: Colors.black12)
        ],
      ),
    );
  }
}
