import 'package:json_annotation/json_annotation.dart';

part 'check_model.g.dart';

@JsonSerializable()
class CheckModel {

  final int userId;
  final int id;
  final String title;
  final bool completed;

  CheckModel({required this.userId,required this.id,required this.title,required this.completed,});

  factory CheckModel.fromJson(Map<String, dynamic> json) => _$CheckModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckModelToJson(this);
}