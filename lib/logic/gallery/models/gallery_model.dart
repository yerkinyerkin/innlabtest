import 'package:json_annotation/json_annotation.dart';

part 'gallery_model.g.dart';

@JsonSerializable()
class GalleryModel {

  final int userId;
  final int id;
  final String title;


  GalleryModel({required this.userId,required this.id,required this.title});

  factory GalleryModel.fromJson(Map<String, dynamic> json) => _$GalleryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryModelToJson(this);
}