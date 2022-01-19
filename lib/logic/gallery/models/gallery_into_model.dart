import 'package:json_annotation/json_annotation.dart';

part 'gallery_into_model.g.dart';

@JsonSerializable()
class GalleryIntoModel {

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  GalleryIntoModel({required this.albumId,required this.id,required this.title,required this.url,required this.thumbnailUrl});

  factory GalleryIntoModel.fromJson(Map<String, dynamic> json) => _$GalleryIntoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryIntoModelToJson(this);
}