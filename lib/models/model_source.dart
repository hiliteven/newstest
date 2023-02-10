import 'package:flutter/cupertino.dart';

class SourceModel {
  String id;
  String name;
  String description;
  String category;

  SourceModel({
    this.id  = "",
    this.name  = "",
    this.description = "",
    this.category = "",
  });

  static void convert(List datares,datalist) {
    for (var item in datares) {
      datalist.add(SourceModel.fromJson(item));
    }
  }

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
    
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      category: json['category'] ?? "",
    );
  }
}






