import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {

  final int userId;
  final int id;
  final String title;
  final String body;

  NewsModel({required this.userId,required this.id,required this.title,required this.body});

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}