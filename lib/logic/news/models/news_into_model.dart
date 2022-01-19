import 'package:json_annotation/json_annotation.dart';

part 'news_into_model.g.dart';

@JsonSerializable()
class NewsIntoModel {

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  NewsIntoModel({required this.postId,required this.id,required this.name,required this.email,required this.body});

  factory NewsIntoModel.fromJson(Map<String, dynamic> json) => _$NewsIntoModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsIntoModelToJson(this);
}