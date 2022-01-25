// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_into_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsIntoModel _$NewsIntoModelFromJson(Map<String, dynamic> json) {
  return NewsIntoModel(
    postId: json['postId'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$NewsIntoModelToJson(NewsIntoModel instance) => <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
