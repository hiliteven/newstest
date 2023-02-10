import 'package:flutter/cupertino.dart';

class CategoryModel {
  String id;
  String category;
  String thumbnail;

  CategoryModel({
    this.id  = "",
    this.category  = "",
    this.thumbnail = "",
  });

  static void convert(List datares,datalist) {
    for (var item in datares) {
      datalist.add(CategoryModel.fromJson(item));
    }
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
    
      id: json['id'] ?? "",
      category: json['category'] ?? "",
      thumbnail: json['thumbnail'] ?? "",
    );
  }
}






