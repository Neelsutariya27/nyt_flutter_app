// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

List<ArticleModel> articleModelFromJson(String str) =>
    List<ArticleModel>.from(json.decode(str).map((x) => ArticleModel.fromJson(x)));

String articleModelToJson(List<ArticleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticleModel {
  final DateTime? publishedDate;
  final String? title;
  final String? abstract;

  ArticleModel({this.publishedDate, this.title, this.abstract});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
      publishedDate: json["published_date"] == null
          ? json["pub_date"] == null
              ? null
              : DateTime.parse(json["pub_date"])
          : DateTime.parse(json["published_date"]),
      title: json["title"] ?? json['headline']?["main"],
      abstract: json['abstract']);

  Map<String, dynamic> toJson() => {
        "published_date":
            "${publishedDate!.year.toString().padLeft(4, '0')}-${publishedDate!.month.toString().padLeft(2, '0')}-${publishedDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "abstract": abstract
      };
}
