import 'package:flutter/cupertino.dart';

class ArticleModel {
  String id;
  String author;
  String title;
  String description;
  String content;
  String publishedAt;
  String url;
  String urlToImage;

  ArticleModel({
    this.id = "",
    this.author = "",
    this.title = "" ,
    this.description = "",
    this.content = "",
    this.publishedAt = "",
    this.url = "",
    this.urlToImage = "",
  });

  static void convert(List datares,datalist) {
    for (var item in datares) {
      datalist.add(ArticleModel.fromJson(item));
    }
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      // source: SourceModel.fromJson(json['source']),
      id: json['id'] ?? "",
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      content: json['content'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
    );
  }
}






