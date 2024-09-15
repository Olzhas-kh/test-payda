import 'package:json_annotation/json_annotation.dart';

part 'posts_model.g.dart';


@JsonSerializable()
class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.id, this.userId, this.title, this.body});
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
